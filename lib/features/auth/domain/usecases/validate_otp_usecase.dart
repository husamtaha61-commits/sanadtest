import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_email_verify_request.dart';
import '../../data/models/responses/user_validate_otp_response.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class ValidateOtpUseCase {
  final AuthRepository authRepository;

  ValidateOtpUseCase({required this.authRepository});

  Future<ApiResult<UserValidateOtpResponse>> call(
      UserEmailVerifiyRequest userEmailVerifiyRequest) async {
    return await authRepository.validateOtp(userEmailVerifiyRequest);
  }
}
