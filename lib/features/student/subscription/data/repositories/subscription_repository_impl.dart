import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../domain/entities/student_subscription_data.dart';
import '../../domain/repositories/subscription_repository.dart';
import '../datasources/subscription_remote_data_source.dart';
import '../models/requests/student_subscription_request.dart';
import '../models/requests/udpate_student_subscription_request.dart';
import '../models/responses/get_random_quran_response.dart';
import '../models/responses/get_student_subscribition_response.dart';

@LazySingleton(as: SubscriptionRepository)
class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionRemoteDataSource subscriptionRemoteDataSource;

  SubscriptionRepositoryImpl({required this.subscriptionRemoteDataSource});

  @override
  Future<ApiResult<GetRandomQuranResponse>> getRandomQuran() async {
    return await subscriptionRemoteDataSource.getRandomQuran();
  }

  @override
  Future<ApiResult<StudentSubscriptionData>> studentSubscription(
      StudentSubscriptionRequest studentSubscriptionRequest,
      ProgressCallback onProgress) async {
    final result = await subscriptionRemoteDataSource.studentSubscription(
        studentSubscriptionRequest, onProgress);
    return result.when(
      success: (response) {
        final entityList = StudentSubscriptionData.fromResponse(response);

        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<bool>> verifyPhoneNumber(String phoneNumber) async {
    return await subscriptionRemoteDataSource.verifyPhoneNumber(phoneNumber);
  }

  @override
  Future<ApiResult<List<SubscriptionModel>>> getMySubscriptions() {
    return subscriptionRemoteDataSource.getMySubscriptions();
  }

  @override
  Future<ApiResult<void>> resubmitSubscription(
      ResubmitSubscriptionRequest request) async {
    try {
      final fields = request.toSimpleMap();
      final filePaths = request.userIdentityFiles;
      final videoPath = request.videoPath;

      final response = await subscriptionRemoteDataSource.resubmitSubscription(
        fields,
        filePaths,
        videoPath,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
