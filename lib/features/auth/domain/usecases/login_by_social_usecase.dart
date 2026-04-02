import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_login_by_social_request.dart';
import '../../data/models/responses/user_signup_response.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class LoginBySocialUseCase {
  final AuthRepository authRepository;

  LoginBySocialUseCase({required this.authRepository});

  Future<ApiResult<UserSignupResponse>> call(
      UserLoginBySocialRequest userLoginBySocialRequest) async {
    return await authRepository.loginBySocial(userLoginBySocialRequest);
  }
}
