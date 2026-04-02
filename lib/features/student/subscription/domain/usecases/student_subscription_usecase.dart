import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/student_subscription_request.dart';
import '../../data/models/responses/get_student_subscribition_response.dart';
import '../entities/student_subscription_data.dart';
import '../repositories/subscription_repository.dart';

@lazySingleton
class StudentSubscriptionUseCase {
  final SubscriptionRepository subscriptionRepository;

  StudentSubscriptionUseCase({required this.subscriptionRepository});

  Future<ApiResult<StudentSubscriptionData>> call(
      StudentSubscriptionRequest studentSubscriptionRequest,
      ProgressCallback onProgress) async {
    return await subscriptionRepository.studentSubscription(
        studentSubscriptionRequest, onProgress);
  }

  Future<ApiResult<List<SubscriptionModel>>> getMySubscriptions() {
    return subscriptionRepository.getMySubscriptions();
  }
}
