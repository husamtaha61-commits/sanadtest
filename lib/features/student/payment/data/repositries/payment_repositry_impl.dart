import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../domain/repositries/payment_repositry.dart';
import '../datasource/remote_data_source.dart';
import '../models/requests/payment_checkout_request.dart';
import '../models/responses/payment_checkout_response.dart';
import '../models/responses/payment_status_model_response.dart';

@LazySingleton(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;

  PaymentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<PaymentCheckoutResponse> checkout(PaymentCheckoutRequest request) {
    return remoteDataSource.checkout(request);
  }

  @override
  Future<ApiResult<PaymentStatusModel>> getPaymentStatus(
      String subscriptionId) {
    return remoteDataSource.getPaymentStatus(subscriptionId);
  }
}
