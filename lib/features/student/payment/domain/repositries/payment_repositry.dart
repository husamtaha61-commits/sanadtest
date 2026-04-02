import '../../../../../core/network/api_response.dart';
import '../../data/models/responses/payment_status_model_response.dart';
import '../../data/models/requests/payment_checkout_request.dart';
import '../../data/models/responses/payment_checkout_response.dart';

abstract class PaymentRepository {
  Future<PaymentCheckoutResponse> checkout(PaymentCheckoutRequest request);
  Future<ApiResult<PaymentStatusModel>> getPaymentStatus(String subscriptionId);
}
