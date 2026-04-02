import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/requests/user_complete_login_by_social_request.dart';
import '../models/requests/user_email_verify_request.dart';
import '../models/requests/user_reset_password_request.dart';
import '../models/requests/user_send_otp_request.dart';
import '../models/responses/user_email_verify_response.dart';
import '../models/requests/user_login_by_social_request.dart';
import '../models/requests/user_signin_request.dart';
import '../models/requests/user_signup_request.dart';
import '../models/responses/user_signup_response.dart';
import '../models/responses/user_validate_otp_response.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<ApiResult<UserSignupResponse>> signUp(
      UserSignupRequest userSignupRequest) async {
    return await authRemoteDataSource.signup(userSignupRequest);
  }

  @override
  Future<ApiResult<UserSignupResponse>> signIn(
      UserSignInRequest userSignInRequest) async {
    return await authRemoteDataSource.signIn(userSignInRequest);
  }

  @override
  Future<ApiResult<UserSignupResponse>> loginBySocial(
      UserLoginBySocialRequest userLoginBySocialRequest) async {
    return await authRemoteDataSource.loginBySocial(userLoginBySocialRequest);
  }

  @override
  Future<ApiResult<UserEmailVerifiyResponse>> verifyEmail(
      UserEmailVerifiyRequest userEmailVerifiyRequest) async {
    return await authRemoteDataSource.verifyEmail(userEmailVerifiyRequest);
  }

  @override
  Future<ApiResult> completeLoginBySocial(
      UserCompleteLoginBySocialRequest userCompleteLoginBySocialRequest) async {
    return await authRemoteDataSource
        .completeLoginBySocial(userCompleteLoginBySocialRequest);
  }

  @override
  Future<ApiResult> sendOtp(UserSendOtpRequest userSendOtpRequest) async {
    return await authRemoteDataSource.sendOtp(userSendOtpRequest);
  }

  @override
  Future<ApiResult<UserValidateOtpResponse>> validateOtp(
      UserEmailVerifiyRequest userEmailVerifiyRequest) async {
    return await authRemoteDataSource.validateOtp(userEmailVerifiyRequest);
  }

  @override
  Future<ApiResult> resetPassword(
      UserResetPasswordRequest userResetPasswordRequest) async {
    return await authRemoteDataSource.resetPassword(userResetPasswordRequest);
  }
}
