import 'package:dio/dio.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/student_subscription_request.dart';
import '../../data/models/requests/udpate_student_subscription_request.dart';
import '../../data/models/responses/get_random_quran_response.dart';
import '../../data/models/responses/get_student_subscribition_response.dart';
import '../entities/student_subscription_data.dart';

abstract class SubscriptionRepository {
  Future<ApiResult<GetRandomQuranResponse>> getRandomQuran();
  Future<ApiResult<StudentSubscriptionData>> studentSubscription(
      StudentSubscriptionRequest studentSubscriptionRequest,
      ProgressCallback onProgress);

  Future<ApiResult<bool>> verifyPhoneNumber(String phoneNumber);
  Future<ApiResult<List<SubscriptionModel>>> getMySubscriptions();
  Future<ApiResult<void>> resubmitSubscription(
      ResubmitSubscriptionRequest request);
}
