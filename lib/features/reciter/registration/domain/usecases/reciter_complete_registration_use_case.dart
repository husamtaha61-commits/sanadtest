import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../../data/models/requests/reciter_complete_registration_request.dart';
import '../repositories/reciter_registration_repository.dart';

@lazySingleton
class ReciterCompleteRegistrationUseCase {
  final ReciterRegistrationRepository reciterRegistrationRepository;

  ReciterCompleteRegistrationUseCase(
      {required this.reciterRegistrationRepository});

  Future<ApiResult> call(
      RectierCompleteRegistrationRequest
          rectierCompleteRegistrationRequest) async {
    return await reciterRegistrationRepository
        .reciterCompleteRegistration(rectierCompleteRegistrationRequest);
  }
}
