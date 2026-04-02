import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../models/requests/reciter_complete_registration_request.dart';
import '../models/requests/reciter_registration_request.dart';
import '../models/requests/reciter_validation_submit_job_step_1_request.dart';

abstract class ReciterRegistrationRemoteDataSource {
  Future<ApiResult> reciterRegistration(
      RectierRegistrationRequest reciterRegistrationRequest);

  Future<ApiResult> reciterCompleteRegistration(
      RectierCompleteRegistrationRequest rectierCompleteRegistrationRequest);

  Future<ApiResult> validateReciterSubmitJobStep1(
      ReciterValidationSubmitJobStep1Request
          reciterValidationSubmitJobStep1Request);
}

@LazySingleton(as: ReciterRegistrationRemoteDataSource)
class ReciterRegistrationRemoteDataSourceImp
    implements ReciterRegistrationRemoteDataSource {
  final Dio dio;
  final RetrofitClient retrofitClient;

  ReciterRegistrationRemoteDataSourceImp(this.dio, this.retrofitClient);

  @override
  Future<ApiResult> reciterRegistration(
      RectierRegistrationRequest reciterRegistrationRequest) async {
    final reciterRegistrationRequestFormData =
        await reciterRegistrationRequest.toFormData();
    return apiHandler(() async {
      final response = await dio.post('/Reciter/RegisterReciter',
          data: reciterRegistrationRequestFormData);
      return ApiResponse(data: response.data);
    });
  }

  @override
  Future<ApiResult> reciterCompleteRegistration(
      RectierCompleteRegistrationRequest
          rectierCompleteRegistrationRequest) async {
    final reciterRegistrationRequestFormData =
        await rectierCompleteRegistrationRequest.toFormData();
    return apiHandler(() async {
      final response = await dio.post('/Reciter/CompleteReciterRegistration',
          data: reciterRegistrationRequestFormData);
      return ApiResponse(data: response.data);
    });
  }

  @override
  Future<ApiResult> validateReciterSubmitJobStep1(
      ReciterValidationSubmitJobStep1Request
          reciterValidationSubmitJobStep1Request) {
    return apiHandler(() => retrofitClient
        .validateReciterSubmitJobStep1(reciterValidationSubmitJobStep1Request));
  }
}
