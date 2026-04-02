import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/network/retrofit_client.dart';
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

abstract class AuthRemoteDataSource {
  Future<ApiResult<UserSignupResponse>> signup(
      UserSignupRequest userSignupRequest);

  Future<ApiResult<UserSignupResponse>> signIn(
      UserSignInRequest userSignInRequest);

  Future<ApiResult<UserSignupResponse>> loginBySocial(
      UserLoginBySocialRequest userLoginBySocialRequest);

  Future<ApiResult<UserEmailVerifiyResponse>> verifyEmail(
      UserEmailVerifiyRequest userEmailVerifiyRequest);

  Future<ApiResult> completeLoginBySocial(
      UserCompleteLoginBySocialRequest userCompleteLoginBySocialRequest);

  Future<ApiResult> sendOtp(UserSendOtpRequest userSendOtpRequest);

  Future<ApiResult<UserValidateOtpResponse>> validateOtp(
      UserEmailVerifiyRequest userEmailVerifiyRequest);

  Future<ApiResult> resetPassword(
      UserResetPasswordRequest userResetPasswordRequest);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final RetrofitClient retrofitClient;

  AuthRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<UserSignupResponse>> signup(
      UserSignupRequest userSignupRequest) {
    return apiHandler<UserSignupResponse>(
      () => retrofitClient.signup(userSignupRequest),
    );
  }

  @override
  Future<ApiResult<UserSignupResponse>> signIn(
      UserSignInRequest userSignInRequest) {
    return apiHandler<UserSignupResponse>(
      () => retrofitClient.signin(userSignInRequest),
    );
  }

  @override
  Future<ApiResult<UserSignupResponse>> loginBySocial(
      UserLoginBySocialRequest userLoginBySocialRequest) {
    return apiHandler<UserSignupResponse>(
      () => retrofitClient.loginBySocial(userLoginBySocialRequest),
    );
  }

  @override
  Future<ApiResult<UserEmailVerifiyResponse>> verifyEmail(
      UserEmailVerifiyRequest userEmailVerifiyRequest) {
    return apiHandler<UserEmailVerifiyResponse>(
      () => retrofitClient.verifyEmail(userEmailVerifiyRequest),
    );
  }

  @override
  Future<ApiResult> completeLoginBySocial(
      UserCompleteLoginBySocialRequest userCompleteLoginBySocialRequest) {
    return apiHandler(
      () => retrofitClient
          .completeLoginBySocial(userCompleteLoginBySocialRequest),
    );
  }

  @override
  Future<ApiResult> sendOtp(UserSendOtpRequest userSendOtpRequest) {
    return apiHandler(
      () => retrofitClient.sendOtp(userSendOtpRequest),
    );
  }

  @override
  Future<ApiResult<UserValidateOtpResponse>> validateOtp(
      UserEmailVerifiyRequest userEmailVerifiyRequest) {
    return apiHandler<UserValidateOtpResponse>(
      () => retrofitClient.validateOtp(userEmailVerifiyRequest),
    );
  }

  @override
  Future<ApiResult> resetPassword(
      UserResetPasswordRequest userResetPasswordRequest) {
    return apiHandler(
      () => retrofitClient.resetPassword(userResetPasswordRequest),
    );
  }
}
