part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState(
      {@Default(BaseStatus.initial()) BaseStatus status,
      @Default([]) List<PaymentPlan> plans,
      PaymentPlan? selectedPlan,
      String? paymentUrl,
      String? errorMessage,
      @Default(false) bool isProcessingPayment,
      PaymentCheckoutResponse? checkoutResponse,
      @Default(false) bool isPaymentSuccessful,
      bool? isPaid}) = _PaymentState;
}
