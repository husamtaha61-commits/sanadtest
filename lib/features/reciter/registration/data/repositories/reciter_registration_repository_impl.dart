import 'package:injectable/injectable.dart';
import '../datasources/reciter_registration_remote_data_source.dart';
import '../models/requests/reciter_complete_registration_request.dart';
import '../models/requests/reciter_registration_request.dart';

import '../../../../../core/network/api_response.dart';
import '../../domain/repositories/reciter_registration_repository.dart';
import '../models/requests/reciter_validation_submit_job_step_1_request.dart';

@LazySingleton(as: ReciterRegistrationRepository)
class ReciterRegistrationRepositoryImpl
    implements ReciterRegistrationRepository {
  final ReciterRegistrationRemoteDataSource reciterRegistrationRemoteDataSource;

  ReciterRegistrationRepositoryImpl(
      {required this.reciterRegistrationRemoteDataSource});

  @override
  Future<ApiResult> reciterRegistration(
      RectierRegistrationRequest rectierRegistrationRequest) async {
    return await reciterRegistrationRemoteDataSource
        .reciterRegistration(rectierRegistrationRequest);
  }

  @override
  Future<ApiResult> reciterCompleteRegistration(
      RectierCompleteRegistrationRequest
          rectierCompleteRegistrationRequest) async {
    return await reciterRegistrationRemoteDataSource
        .reciterCompleteRegistration(rectierCompleteRegistrationRequest);
  }

  @override
  Future<ApiResult> validateReciterSubmitJobStep1(
      ReciterValidationSubmitJobStep1Request
          reciterValidationSubmitJobStep1Request) async {
    return await reciterRegistrationRemoteDataSource
        .validateReciterSubmitJobStep1(reciterValidationSubmitJobStep1Request);
  }

}
