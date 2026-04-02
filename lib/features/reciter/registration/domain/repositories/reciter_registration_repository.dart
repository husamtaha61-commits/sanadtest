import '../../data/models/requests/reciter_complete_registration_request.dart';
import '../../data/models/requests/reciter_registration_request.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/reciter_validation_submit_job_step_1_request.dart';

abstract class ReciterRegistrationRepository {
  Future<ApiResult> reciterRegistration(
      RectierRegistrationRequest rectierRegistrationRequest);

  Future<ApiResult> reciterCompleteRegistration(
      RectierCompleteRegistrationRequest rectierCompleteRegistrationRequest);

  Future<ApiResult> validateReciterSubmitJobStep1(
      ReciterValidationSubmitJobStep1Request
          reciterValidationSubmitJobStep1Request);
}
