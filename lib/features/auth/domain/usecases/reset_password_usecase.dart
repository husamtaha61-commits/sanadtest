import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_reset_password_request.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class ResetPasswordUseCase {
  final AuthRepository authRepository;

  ResetPasswordUseCase({required this.authRepository});

  Future<ApiResult> call(
      UserResetPasswordRequest userResetPasswordRequest) async {
    return await authRepository.resetPassword(userResetPasswordRequest);
  }
}
