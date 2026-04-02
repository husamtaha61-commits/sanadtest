import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_signin_request.dart';
import '../../data/models/responses/user_signup_response.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  Future<ApiResult<UserSignupResponse>> call(
      UserSignInRequest userSignInRequest) async {
    return await authRepository.signIn(userSignInRequest);
  }
}
