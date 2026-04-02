import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/services/analytics_service.dart';
import '../../../../../../core/services/app_preferences.dart';
import '../../../../subscription/data/models/responses/get_student_subscribition_response.dart';
import '../../../data/models/requests/payment_checkout_request.dart';
import '../../../data/models/responses/payment_checkout_response.dart';
import '../../../data/models/responses/payment_status_model_response.dart';
import '../../../domain/entities/payment_plan_request.dart';
import '../../../domain/repositries/payment_repositry.dart';
part 'payment_cubit.freezed.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository paymentRepository;
  final AppPreferences appPreferences = getIt<AppPreferences>();

  PaymentCubit({required this.paymentRepository}) : super(const PaymentState());

  Future<void> loadPaymentPlansFromSubscription(
      SubscriptionModel subscription) async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    try {
      final price = subscription.programPrice ?? 0.0;
      final plans = <PaymentPlan>[
        PaymentPlan(
          type: PaymentPlanType.fullPayment,
          price: price,
        ),
      ];

      final hasInstallments = (subscription.installments?.isNotEmpty ?? false);

      if (hasInstallments) {
        plans.add(
          PaymentPlan(
            type: PaymentPlanType.installment,
            price: price,
            installments: subscription.installments,
          ),
        );
      }

      emit(state.copyWith(
        status: const BaseStatus.success(),
        plans: plans,
        selectedPlan: null,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BaseStatus.failure(e.toString()),
        errorMessage: 'Failed to load payment plans: $e',
      ));
    }
  }

  void selectPaymentPlan(PaymentPlan plan) {
    state.status.when(
      success: () {
        emit(state.copyWith(selectedPlan: plan));
      },
      initial: () {},
      changed: () {},
      loading: () {},
      silentLoading: () {},
      failure: (_) {},
    );
  }

  Future<void> initiatePayment(SubscriptionModel subscription) async {
    if (state.selectedPlan == null) {
      emit(state.copyWith(errorMessage: 'Please select a payment plan first'));
      return;
    }

    emit(state.copyWith(isProcessingPayment: true, errorMessage: null));

    try {
      final userInfo = appPreferences.getUserCachedResponse();
      final request = PaymentCheckoutRequest(
        subscriptionId: subscription.id,
        isInstallment: state.selectedPlan!.type == PaymentPlanType.installment,
        customerEmail: userInfo.email,
        currency: "USD",
      );

      final response = await paymentRepository.checkout(request);

      // Log analytics for payment initiation
      AnalyticsService.instance.logPaymentAction(
        paymentMethod: state.selectedPlan!.type.name,
        amount: state.selectedPlan!.price,
        status: 'initiated',
      );
      emit(state.copyWith(
        isProcessingPayment: false,
        paymentUrl: response.hostedPageUrl,
        checkoutResponse: response,
      ));
    } catch (e) {
      // Log failure
      AnalyticsService.instance.logPaymentAction(
        paymentMethod: state.selectedPlan?.type.name ?? 'unknown',
        amount: state.selectedPlan?.price ?? 0,
        status: 'failed',
      );
      emit(state.copyWith(
        isProcessingPayment: false,
        errorMessage: 'Failed to initiate payment: $e',
      ));
    }
  }

  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }

  void resetPaymentUrl() {
    emit(state.copyWith(paymentUrl: null));
  }

  void handlePaymentSuccess() {
    emit(state.copyWith(isPaymentSuccessful: true));
    AnalyticsService.instance.logPaymentAction(
      paymentMethod: state.selectedPlan?.type.name ?? 'unknown',
      amount: state.selectedPlan?.price ?? 0,
      status: 'success',
    );
  }

  void handlePaymentFailure(String error) {
    emit(state.copyWith(errorMessage: error, isProcessingPayment: false));
    // Log failed payment
    AnalyticsService.instance.logPaymentAction(
      paymentMethod: state.selectedPlan?.type.name ?? 'unknown',
      amount: state.selectedPlan?.price ?? 0,
      status: 'failed',
    );
  }

  void handlePaymentCancellation() {
    emit(state.copyWith(
      errorMessage: 'Payment was cancelled',
      isProcessingPayment: false,
    ));
    // Log cancelled payment
    AnalyticsService.instance.logPaymentAction(
      paymentMethod: state.selectedPlan?.type.name ?? 'unknown',
      amount: state.selectedPlan?.price ?? 0,
      status: 'cancelled',
    );
  }

  set isPaymentSuccessful(bool value) {
    emit(state.copyWith(isPaymentSuccessful: value));
  }

  bool get isPaymentSuccessful => state.isPaymentSuccessful;

  Future<void> checkPaymentStatus() async {
    final subscriptionId = getIt<AppPreferences>()
        .getUserCachedResponse()
        .userIdentities
        .first
        .subscriptionId;

    emit(state.copyWith(isProcessingPayment: true));

    final result =
        await paymentRepository.getPaymentStatus(subscriptionId.toString());

    result.when(
      success: (PaymentStatusModel status) {
        if (status.paid) {
          isPaymentSuccessful = true;
        } else {
          emit(state.copyWith(
            errorMessage: 'Payment Failed: ${status.reason}',
            isProcessingPayment: false,
          ));
        }
      },
      failure: (error) {
        emit(state.copyWith(
          errorMessage: error,
          isProcessingPayment: false,
        ));
      },
    );
  }
}
