import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/reciter_validation_submit_job_step_1_request.dart';
import '../repositories/reciter_registration_repository.dart';

@lazySingleton
class ValidateReciterSubmitJobStep1UseCase {
  final ReciterRegistrationRepository reciterRegistrationRepository;

  ValidateReciterSubmitJobStep1UseCase(
      {required this.reciterRegistrationRepository});

  Future<ApiResult> call(
      ReciterValidationSubmitJobStep1Request
          reciterValidationSubmitJobStep1Request) async {
    return await reciterRegistrationRepository
        .validateReciterSubmitJobStep1(reciterValidationSubmitJobStep1Request);
  }
}
