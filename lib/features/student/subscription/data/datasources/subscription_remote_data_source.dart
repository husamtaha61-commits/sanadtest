import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/data/models/responses/lookups_data_response.dart';
import '../models/requests/student_subscription_request.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../models/responses/get_random_quran_response.dart';
import '../models/responses/get_student_subscribition_response.dart';
import '../models/responses/post_student_subscribition_model_response.dart';

abstract class SubscriptionRemoteDataSource {
  Future<ApiResult<LookUpsDataResponse>> getLookUpsData(List<int> ids);
  Future<ApiResult<GetRandomQuranResponse>> getRandomQuran();
  Future<ApiResult<StudentSubscriptionDataModel>> studentSubscription(
      StudentSubscriptionRequest studentSubscriptionRequest,
      ProgressCallback onProgress);
  Future<ApiResult<bool>> verifyPhoneNumber(String phoneNumber);
  Future<ApiResult<List<SubscriptionModel>>> getMySubscriptions();
  Future<ApiResponse> resubmitSubscription(
      Map<String, String> fields, List<String>? filePaths, String? videoPath);
}

@LazySingleton(as: SubscriptionRemoteDataSource)
class SubscriptionRemoteDataSourceImp implements SubscriptionRemoteDataSource {
  final RetrofitClient retrofitClient;

  SubscriptionRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<LookUpsDataResponse>> getLookUpsData(List<int> ids) {
    return apiHandler<LookUpsDataResponse>(
      () => retrofitClient.getLookUpsData(ids),
    );
  }

  @override
  Future<ApiResult<GetRandomQuranResponse>> getRandomQuran() {
    return apiHandler<GetRandomQuranResponse>(
      () => retrofitClient.getRandomQuran(),
    );
  }

  @override
  Future<ApiResult<StudentSubscriptionDataModel>> studentSubscription(
      StudentSubscriptionRequest studentSubscriptionRequest,
      ProgressCallback onProgress) {
    return apiHandler<StudentSubscriptionDataModel>(() =>
        retrofitClient.studentSubscription(
            _buildFormData(studentSubscriptionRequest), onProgress));
  }

  @override
  Future<ApiResult<bool>> verifyPhoneNumber(String phoneNumber) async {
    final response = await apiHandler(
      () => retrofitClient.verifyPhoneNumber(phoneNumber.substring(1)),
    );

    return response.when(
      success: (apiResponse) {
        return const ApiResult.success(true);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<SubscriptionModel>>> getMySubscriptions() {
    return apiHandler<List<SubscriptionModel>>(
      () => retrofitClient.getMySubscriptions(),
    );
  }

  @override
  Future<ApiResponse> resubmitSubscription(Map<String, String> fields,
      List<String>? filePaths, String? videoPath) async {
    final formData = FormData();

    fields.forEach((key, value) {
      formData.fields.add(MapEntry(key, value));
    });

    if (filePaths != null) {
      for (final path in filePaths) {
        final file = File(path);
        if (await file.exists()) {
          formData.files.add(MapEntry(
            'userIdentity.UserIdentityFiles',
            await MultipartFile.fromFile(file.path,
                filename: file.uri.pathSegments.last),
          ));
        }
      }
    }

    if (videoPath != null) {
      final videoFile = File(videoPath);
      if (await videoFile.exists()) {
        formData.files.add(MapEntry(
          'Video',
          await MultipartFile.fromFile(videoFile.path,
              filename: videoFile.uri.pathSegments.last),
        ));
      }
    }
    return await retrofitClient.resubmitSubscription(formData);
  }
}

FormData _buildFormData(StudentSubscriptionRequest studentSubscriptionRequest) {
  final Map<String, dynamic> data = {
    "User.FirstName": studentSubscriptionRequest.firstName,
    "User.MiddleName": studentSubscriptionRequest.middleName,
    "User.LastName": studentSubscriptionRequest.lastName,
    "User.PhoneNumber": studentSubscriptionRequest.phoneNumber,
    "ProgramId": studentSubscriptionRequest.programId,
    "User.GenderId": studentSubscriptionRequest.genderId,
    "User.DateOfBirth": studentSubscriptionRequest.dateOfBirth,
    "User.NationalityId": studentSubscriptionRequest.nationalityId,
    "User.MainLanguageId": studentSubscriptionRequest.mainLanguageId,
    "User.PlaceOfResidenceId": studentSubscriptionRequest.placeOfResidenceId,
    "UserIdentityDto.UserIdentityTypeId":
        studentSubscriptionRequest.identityTypeId,
    "User.OtherLanguagesIds": studentSubscriptionRequest.otherLanguagesIds,
    "RecitationId": studentSubscriptionRequest.recitationId,
    "EvaluationMethod": studentSubscriptionRequest.evaluationMethod,
    "PreferredLanguage": studentSubscriptionRequest.preferredLanguage,
    "LiveSessionRequest.RecieverId": studentSubscriptionRequest.recieverId,
    "LiveSessionRequest.SuggestionTime":
        studentSubscriptionRequest.suggestionTime,
  };

  // Handle optional video
  if (studentSubscriptionRequest.video != null) {
    final videoFile = studentSubscriptionRequest.video!;
    final videoExtension = videoFile.path.split('.').last;
    data['Video'] = MultipartFile.fromFileSync(
      videoFile.path,
      filename: '${DateTime.now().millisecondsSinceEpoch}.$videoExtension',
      contentType: DioMediaType('video', videoExtension),
    );
  }

  // Handle UserIdentityFiles
  if (studentSubscriptionRequest.images.isNotEmpty) {
    data['UserIdentityDto.UserIdentityFiles'] =
        studentSubscriptionRequest.images.map((file) {
      final ext = file.path.split('.').last;
      return MultipartFile.fromFileSync(
        file.path,
        filename: '${DateTime.now().millisecondsSinceEpoch}.$ext',
        contentType: DioMediaType('image', ext == 'jpg' ? 'jpeg' : ext),
      );
    }).toList();
  }

  // Remove null values so FormData doesn't include them
  data.removeWhere((key, value) => value == null);

  return FormData.fromMap(data);
}
