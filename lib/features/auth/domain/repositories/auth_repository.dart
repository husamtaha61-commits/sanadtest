import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_complete_login_by_social_request.dart';
import '../../data/models/requests/user_email_verify_request.dart';
import '../../data/models/requests/user_reset_password_request.dart';
import '../../data/models/requests/user_send_otp_request.dart';
import '../../data/models/responses/user_email_verify_response.dart';
import '../../data/models/requests/user_login_by_social_request.dart';
import '../../data/models/requests/user_signin_request.dart';
import '../../data/models/requests/user_signup_request.dart';
import '../../data/models/responses/user_signup_response.dart';
import '../../data/models/responses/user_validate_otp_response.dart';

abstract class AuthRepository {
  Future<ApiResult<UserSignupResponse>> signUp(
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
