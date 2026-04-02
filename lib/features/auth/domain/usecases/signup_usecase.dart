import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_signup_request.dart';
import '../../data/models/responses/user_signup_response.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<ApiResult<UserSignupResponse>> call(
      UserSignupRequest userSignupRequest) async {
    return await authRepository.signUp(userSignupRequest);
  }
}
