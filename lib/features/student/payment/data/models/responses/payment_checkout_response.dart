import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_checkout_response.freezed.dart';
part 'payment_checkout_response.g.dart';

@Freezed()
class PaymentCheckoutResponse with _$PaymentCheckoutResponse {
  const factory PaymentCheckoutResponse({
    required String orderId,
    required String sessionId,
    required String successIndicator,
    required String hostedPageUrl,
  }) = _PaymentCheckoutResponse;

  factory PaymentCheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentCheckoutResponseFromJson(json);
}
