import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_checkout_request.freezed.dart';
part 'payment_checkout_request.g.dart';

@freezed
class PaymentCheckoutRequest with _$PaymentCheckoutRequest {
  const factory PaymentCheckoutRequest({
    required int subscriptionId,
    required bool isInstallment,
    required String currency,
    required String customerEmail,
  }) = _PaymentCheckoutRequest;

  factory PaymentCheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentCheckoutRequestFromJson(json);
}
