import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/services/firebase_messaging_listener.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../subscription/data/models/responses/get_student_subscribition_response.dart';
import '../../data/models/payment_model.dart';
import '../../domain/entities/payment_plan_request.dart';
import '../../domain/repositries/payment_repositry.dart';
import '../bloc/payment/payment_cubit.dart';
import '../widgets/payment_plan_card_widget.dart';

@RoutePage()
class PaymentPlansPage extends StatelessWidget {
  const PaymentPlansPage({super.key, required this.subscriptionModel});
  final SubscriptionModel subscriptionModel;
  @override
  Widget build(BuildContext context) {
    final cubit = PaymentCubit(paymentRepository: getIt<PaymentRepository>())
      ..loadPaymentPlansFromSubscription(subscriptionModel);

    return AppBlocWrapperScreen<PaymentCubit, PaymentState>(
      bloc: cubit,
      child: PaymentPlansContent(
        subscriptionModel: subscriptionModel,
      ),
    );
  }
}

class PaymentPlansContent extends StatelessWidget {
  const PaymentPlansContent({super.key, required this.subscriptionModel});
  final SubscriptionModel subscriptionModel;

  @override
  Widget build(BuildContext context) {
    int? lastUnpaid;

    if (subscriptionModel.installments!.isNotEmpty) {
      final installments = subscriptionModel.installments!;

      final lastPaidIndex =
          installments.lastIndexWhere((inst) => inst.paid == true);

      if (lastPaidIndex != -1 && lastPaidIndex < installments.length - 1) {
        final nextInstallment = installments[lastPaidIndex + 1];
        lastUnpaid = nextInstallment.number;
      } else if (lastPaidIndex == installments.length - 1) {
        lastUnpaid = installments.last.number;
      } else if (lastPaidIndex == -1) {
        lastUnpaid = installments.first.number;
      } else {
        lastUnpaid = installments[installments.length - 1].number;
      }
    }
    bool dontAllowFullPayment = false;
    if (subscriptionModel.installments!.isNotEmpty) {
      dontAllowFullPayment = subscriptionModel.installments != null &&
          subscriptionModel.installments!.any((i) => i.paid == true);
    }

    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) async {
        final firebaseListener = getIt<FirebaseMessagingListener>();
        if (firebaseListener.isFirebaseRedirect) {
          firebaseListener.resetFirebaseRedirect();
          return;
        }
        if (state.paymentUrl != null) {
          _navigateToPaymentWebView(context, state.paymentUrl!);
        }
        if (state.errorMessage != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final backgroundColor = state.errorMessage!.contains('cancelled')
                ? Colors.orange
                : Colors.red.shade600;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage!,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: backgroundColor,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
            context.read<PaymentCubit>().clearError();
          });
        }
        if (state.isPaid != null) {
          if (state.isPaid == true) {
            await _showSuccessBottomSheet(context);
          } else {
            showAppModalBottomSheet(
              context: context,
              title: LocaleKeys.paymentPlanPage_paymentFailedTitle.tr(),
              subTitle: LocaleKeys.paymentPlanPage_paymentFailedSubtitle.tr(),
              mainBtnLabel: LocaleKeys.paymentPlanPage_retry.tr(),
              mainOnPressed: () {
                Navigator.pop(context);
              },
            );
          }
        }
      },
      builder: (context, state) {
        return AppCustomScrollView(
          appPageHeader: AppPageHeader.subtitle,
          title: LocaleKeys.paymentPlanPage_title.tr(),
          bottomChildren: [
            if (state.plans.isNotEmpty)
              _buildPaymentButton(context, state, lastUnpaid),
          ],
          children: [
            32.verticalSpace,
            _buildHeaderSection(context),
            24.verticalSpace,
            _buildPaymentPlansList(
                context, state, dontAllowFullPayment, lastUnpaid),
          ],
        );
      },
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.paymentPlanPage_headerTitle.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
          ),
          8.verticalSpace,
          Text(
            LocaleKeys.paymentPlanPage_headerSubtitle.tr(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentPlansList(BuildContext context, PaymentState state,
      bool allowFullPayment, int? phase) {
    final filteredPlans = state.plans.where((plan) {
      if (allowFullPayment && plan.type == PaymentPlanType.fullPayment) {
        return false;
      }
      return true;
    }).toList();

    return Column(
      children: [
        ...filteredPlans.asMap().entries.map(
          (entry) {
            final index = entry.key;
            final plan = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                bottom: 16.h,
                left: 16.w,
                right: 16.w,
              ).copyWith(
                top: index == 0 ? 0 : 0,
              ),
              child: PaymentPlanCard(
                phase: phase,
                plan: plan,
                isSelected: state.selectedPlan == plan,
                onSelect: () {
                  context.read<PaymentCubit>().selectPaymentPlan(plan);
                },
              ),
            );
          },
        ),
        8.verticalSpace,
      ],
    );
  }

  Widget _buildPaymentButton(
      BuildContext context, PaymentState state, int? phase) {
    final paymentCubit = context.read<PaymentCubit>();
    final selectedPlan = state.selectedPlan;
    final totalAmount = selectedPlan == null
        ? null
        : selectedPlan.type == PaymentPlanType.installment &&
                (selectedPlan.installments?.isNotEmpty ?? false)
            ? ((phase != null)
                    ? selectedPlan.installments!.firstWhere(
                        (installment) => installment.number == phase,
                        orElse: () => selectedPlan.installments!.first,
                      )
                    : selectedPlan.installments!.first)
                .amount
            : selectedPlan.price;
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          if (state.selectedPlan != null) ...[
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.paymentPlanPage_totalAmount.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                  ),
                  Text(
                    '\$${totalAmount!.toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800,
                        ),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
          ],
          AppElevatedButton(
            onPressed: state.selectedPlan == null || state.isProcessingPayment
                ? null
                : () {
                    paymentCubit.initiatePayment(subscriptionModel);
                  },
            child: state.isProcessingPayment
                ? SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.selectedPlan == null
                            ? LocaleKeys.paymentPlanPage_selectPlanToContinue
                                .tr()
                            : LocaleKeys.paymentPlanPage_proceedToSecurePayment
                                .tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      if (state.selectedPlan != null) ...[
                        8.horizontalSpace,
                        const Icon(Icons.lock_outlined, size: 16),
                      ],
                    ],
                  ),
          ),
          if (state.selectedPlan != null) ...[
            12.verticalSpace,
            Text(
              LocaleKeys.paymentPlanPage_paymentSecured.tr(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _showSuccessBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64.w,
              color: Colors.green,
            ),
            16.verticalSpace,
            Text(
              LocaleKeys.paymentPlanPage_paymentSuccessfulTitle.tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            8.verticalSpace,
            Text(
              LocaleKeys.paymentPlanPage_paymentSuccessfulSubtitle.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            24.verticalSpace,
            AppElevatedButton(
              onPressed: () {
                context.router.replace(const ReciterListingRoute());
              },
              child: Text(
                LocaleKeys.paymentPlanPage_continueToReciter.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPaymentWebView(
      BuildContext context, String paymentUrl) async {
    if (paymentUrl.isEmpty || !paymentUrl.startsWith('http')) {
      context.read<PaymentCubit>().handlePaymentFailure(
          LocaleKeys.paymentPlanPage_invalidPaymentUrl.tr());
      return;
    }

    final cubit = context.read<PaymentCubit>();
    cubit.resetPaymentUrl();

    final result = await PaymentModal.show(context: context, url: paymentUrl);

    if (result.isSuccess) {
      await cubit.checkPaymentStatus();
    } else if (result.isCancelled) {
      cubit.handlePaymentCancellation();
    } else {
      cubit.handlePaymentFailure(
        result.errorMessage ??
            LocaleKeys.paymentPlanPage_paymentFailedDefault.tr(),
      );
    }
  }
}
