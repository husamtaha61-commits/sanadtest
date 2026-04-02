import 'dart:developer';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../models/requests/payment_checkout_request.dart';
import '../models/responses/payment_checkout_response.dart';
import '../models/responses/payment_status_model_response.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentCheckoutResponse> checkout(PaymentCheckoutRequest request);
  Future<ApiResult<PaymentStatusModel>> getPaymentStatus(String subscriptionId);
}

@LazySingleton(as: PaymentRemoteDataSource)
class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final RetrofitClient retrofitClient;
  PaymentRemoteDataSourceImpl({required this.retrofitClient});

  @override
  Future<ApiResult<PaymentStatusModel>> getPaymentStatus(
      String subscriptionId) async {
    return apiHandler(() async {
      final response = await retrofitClient.getPaymentStatus(subscriptionId);
      return response.data;
    });
  }

  @override
  Future<PaymentCheckoutResponse> checkout(
      PaymentCheckoutRequest request) async {
    try {
      final result = await apiHandler(
        () => retrofitClient.checkout(request),
      );
      return result.when(
        success: (response) {
          if (response is! PaymentCheckoutResponse) {
            throw Exception('Invalid response type: ${response.runtimeType}');
          }
          return response;
        },
        failure: (error) {
          log('Payment checkout failed: $error');
          throw error;
        },
      );
    } catch (e) {
      log('Unexpected error during checkout: $e');
      rethrow;
    }
  }
}
