import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/reciter_registration_request.dart';
import '../repositories/reciter_registration_repository.dart';

@lazySingleton
class ReciterRegistrationUseCase {
  final ReciterRegistrationRepository reciterRegistrationRepository;

  ReciterRegistrationUseCase({required this.reciterRegistrationRepository});

  Future<ApiResult> call(
      RectierRegistrationRequest rectierRegistrationRequest) async {
    return await reciterRegistrationRepository
        .reciterRegistration(rectierRegistrationRequest);
  }
}
