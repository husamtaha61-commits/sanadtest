import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_email_verify_request.dart';
import '../../data/models/responses/user_email_verify_response.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class VerifyEmailUseCase {
  final AuthRepository authRepository;

  VerifyEmailUseCase({required this.authRepository});

  Future<ApiResult<UserEmailVerifiyResponse>> call(
      UserEmailVerifiyRequest userEmailVerifiyRequest) async {
    return await authRepository.verifyEmail(userEmailVerifiyRequest);
  }
}
