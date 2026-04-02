import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/data/data_cubit.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/extenstions/date_time.dart';
import '../../../../../core/extenstions/string.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/services/analytics_service.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../core/services/twilio_chat_service.dart';
import '../../../../../core/utils/app_date.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../data/models/requests/user_complete_login_by_social_request.dart';
import '../../../data/models/requests/user_email_verify_request.dart';
import '../../../data/models/requests/user_login_by_social_request.dart';
import '../../../data/models/requests/user_reset_password_request.dart';
import '../../../data/models/requests/user_send_otp_request.dart';
import '../../../data/models/requests/user_signin_request.dart';
import '../../../data/models/requests/user_signup_request.dart';
import '../../../domain/usecases/complete_login_by_social_usecase.dart';
import '../../../domain/usecases/login_by_social_usecase.dart';
import '../../../domain/usecases/reset_password_usecase.dart';
import '../../../domain/usecases/send_otp_usecase.dart';
import '../../../domain/usecases/signin_usecase.dart';
import '../../../domain/usecases/signup_usecase.dart';
import '../../../domain/usecases/validate_otp_usecase.dart';
import '../../../domain/usecases/verifiy_email_usecase.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  final LoginBySocialUseCase _loginBySocialUseCase;
  final CompleteLoginBySocailUseCase _completeLoginBySocailUseCase;
  final SendOtpUseCase _sendOtpUseCase;
  final ValidateOtpUseCase _validateOtpUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final AppPreferences _appPreferences;
  final AuthService _authService;
  AuthCubit(
    this._appPreferences,
    this._authService,
    this._signUpUseCase,
    this._verifyEmailUseCase,
    this._loginBySocialUseCase,
    this._completeLoginBySocailUseCase,
    this._signInUseCase,
    this._sendOtpUseCase,
    this._validateOtpUseCase,
    this._resetPasswordUseCase,
  ) : super(const AuthState());

  void signUpByEmail(UserSignupRequest userSignupRequest) async {
    emit(const AuthState(status: BaseStatus.loading()));
    final response = await _signUpUseCase(userSignupRequest);
    response.when(
      success: (userResponse) {
        _appPreferences.setUserEmail(userResponse.email);
        AnalyticsService.instance.logSignUp();

        emit(
          AuthState(
            email: userResponse.email,
            isVerified: userResponse.isVerified,
            isLoginCompleted: true,
            status: const BaseStatus.success(),
          ),
        );
      },
      failure: (error) => emit(const AuthState(status: BaseStatus.failure())),
    );
  }

  void signInByEmail(UserSignInRequest userSignInRequest) async {
    emit(const AuthState(status: BaseStatus.loading()));
    final response = await _signInUseCase(userSignInRequest);
    response.when(
      success: (userResponse) async {
        _appPreferences.setUserEmail(userResponse.email);
        AnalyticsService.instance.logLogin();

        if (userResponse.accessToken == null) {
          final otpResponse = await _sendOtpUseCase(
              UserSendOtpRequest(email: userSignInRequest.email));
          otpResponse.when(
            success: (_) {
              emit(
                AuthState(
                  email: userResponse.email,
                  isLoginCompleted: true,
                  role: UserRoles.Student.name,
                  status: const BaseStatus.success(),
                ),
              );
            },
            failure: (error) =>
                emit(AuthState(status: BaseStatus.failure(error))),
          );
        } else {
          _appPreferences.setAccessToken(userResponse.accessToken);
          emit(
            AuthState(
              isLoginCompleted: userResponse.isLoginCompleted ?? false,
              isVerified: userResponse.isVerified,
              resetToken: userResponse.resetToken ?? '',
              accessToken: userResponse.accessToken ?? '',
              status: const BaseStatus.success(),
            ),
          );
        }
      },
      failure: (error) => emit(AuthState(status: BaseStatus.failure(error))),
    );
  }

  void signInByFacebook() async {
    try {
      emit(const AuthState(status: BaseStatus.loading()));
      final result = await _authService.signInByFacebook();
      if (result != null) {
        final UserCredential userCredential = result[0];
        final userProfile = userCredential.additionalUserInfo!.profile!;
        final response = await _loginBySocialUseCase(
          UserLoginBySocialRequest(
            providerAccessToken: result[1],
            idToken: result[2],
            providerName: 'facebook',
          ),
        );
        response.when(
          success: (userResponse) {
            AnalyticsService.instance.logLogin();

            if (userResponse.isLoginCompleted!) {
              _appPreferences.setAccessToken(userResponse.accessToken!);
            } else {
              _appPreferences.setTempAccessToken(userResponse.accessToken!);
            }
            bool isDateBirth = userProfile.containsKey('birthday') &&
                userProfile['birthday'] != null;
            emit(
              AuthState(
                firstName: userProfile['first_name'],
                lastName: userProfile['last_name'],
                email: userResponse.email,
                dateOfBirth: isDateBirth
                    ? (userProfile['birthday'] as String)
                            .toDate(AppDate.MMddyyyy)
                            ?.toStr(AppDate.ddMMyyyy) ??
                        ''
                    : '',
                isVerified: userResponse.isVerified,
                isLoginCompleted: userResponse.isLoginCompleted!,
                accessToken: userResponse.accessToken!,
                role: UserRoles.Student.name,
                status: const BaseStatus.success(),
              ),
            );
          },
          failure: (error) =>
              emit(AuthState(status: BaseStatus.failure(error))),
        );
      } else {
        emit(const AuthState(status: BaseStatus.failure()));
      }
    } on FirebaseAuthException catch (error) {
      triggerDataEvent(error.message.toString(), true);
      emit(const AuthState(status: BaseStatus.failure()));
    } catch (error) {
      triggerDataEvent(LocaleKeys.apiError_server.tr(), true);
      emit(const AuthState(status: BaseStatus.failure()));
    }
  }

  void signInByGoogle() async {
    try {
      emit(const AuthState(status: BaseStatus.loading()));
      final result = await _authService.signInByGoogle();
      if (result != null) {
        final UserCredential userCredential = result[0];
        final userProfile = userCredential.additionalUserInfo!.profile!;
        final response = await _loginBySocialUseCase(
          UserLoginBySocialRequest(
            providerAccessToken: result[1],
            idToken: result[2],
            providerName: 'google',
          ),
        );

        response.when(success: (userResponse) {
          AnalyticsService.instance.logLogin();

          if (userResponse.isLoginCompleted!) {
            _appPreferences.setAccessToken(userResponse.accessToken!);
          } else {
            _appPreferences.setTempAccessToken(userResponse.accessToken!);
          }
          emit(
            AuthState(
              firstName: userProfile['given_name'],
              lastName: userProfile['family_name'],
              email: userProfile['email'],
              isVerified: userResponse.isVerified,
              isLoginCompleted: userResponse.isLoginCompleted!,
              accessToken: userResponse.accessToken!,
              role: UserRoles.Student.name,
              status: const BaseStatus.success(),
            ),
          );
        }, failure: (error) {
          emit(AuthState(status: BaseStatus.failure(error)));
        });
      } else {
        emit(const AuthState(status: BaseStatus.failure()));
      }
    } on FirebaseAuthException catch (error) {
      triggerDataEvent(error.message.toString(), true);
      emit(const AuthState(status: BaseStatus.failure()));
    } catch (error) {
      triggerDataEvent(LocaleKeys.apiError_server.tr(), true);
      emit(const AuthState(status: BaseStatus.failure()));
    }
  }

  void signInByApple() async {
    try {
      emit(const AuthState(status: BaseStatus.loading()));
      final result = await _authService.signInByApple();
      if (result != null) {
        final UserCredential userCredential = result[0];
        final userProfile = userCredential.additionalUserInfo!.profile!;
        final response = await _loginBySocialUseCase(
          UserLoginBySocialRequest(
            providerAccessToken: result[1],
            idToken: result[2],
            providerName: 'apple',
          ),
        );

        response.when(success: (userResponse) {
          AnalyticsService.instance.logLogin();

          if (userResponse.isLoginCompleted!) {
            _appPreferences.setAccessToken(userResponse.accessToken!);
          } else {
            _appPreferences.setTempAccessToken(userResponse.accessToken!);
          }
          emit(
            AuthState(
              firstName: userProfile['givenName'] ?? '',
              lastName: userProfile['familyName'] ?? '',
              email: userProfile['email'] ?? userResponse.email,
              isVerified: userResponse.isVerified,
              isLoginCompleted: userResponse.isLoginCompleted!,
              accessToken: userResponse.accessToken!,
              role: UserRoles.Student.name,
              status: const BaseStatus.success(),
            ),
          );
        }, failure: (error) {
          emit(AuthState(status: BaseStatus.failure(error)));
        });
      } else {
        emit(const AuthState(status: BaseStatus.failure()));
      }
    } on FirebaseAuthException catch (error) {
      triggerDataEvent(error.message.toString(), true);
      emit(const AuthState(status: BaseStatus.failure()));
    } catch (error) {
      triggerDataEvent(LocaleKeys.apiError_server.tr(), true);
      emit(const AuthState(status: BaseStatus.failure()));
    }
  }

  void verifyEmail(UserEmailVerifiyRequest userEmailVerifiyRequest) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _verifyEmailUseCase(userEmailVerifiyRequest);
    response.when(
      success: (userEmailVerifiyResponse) {
        _appPreferences.setAccessToken(userEmailVerifiyResponse.token);
        triggerDataEvent(LocaleKeys.snackbar_emailVerified.tr(), false);
        emit(state.copyWith(status: const BaseStatus.success()));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void completeLoginBySocial(
      UserCompleteLoginBySocialRequest userCompleteLoginBySocialRequest) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response =
        await _completeLoginBySocailUseCase(userCompleteLoginBySocialRequest);
    response.when(
      success: (_) {
        _appPreferences.setAccessToken(state.accessToken);
        _appPreferences.deleteTempAccessToken();
        emit(state.copyWith(status: const BaseStatus.success()));
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  void sendOtp(
      UserSendOtpRequest userSendOtpRequest, bool isForgotPasswordMode) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _sendOtpUseCase(userSendOtpRequest);
    response.when(
      success: (_) {
        emit(
          state.copyWith(
            email: userSendOtpRequest.email,
            isForgotPasswordMode: isForgotPasswordMode,
            status: const BaseStatus.success(),
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  void validateOtp(UserEmailVerifiyRequest userEmailVerifiyRequest) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _validateOtpUseCase(userEmailVerifiyRequest);
    response.when(
      success: (userEmailVerifiyResponse) {
        emit(
          state.copyWith(
            resetToken: userEmailVerifiyResponse.resetToken,
            status: const BaseStatus.success(),
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  void resetPassword(UserResetPasswordRequest userResetPasswordRequest) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _resetPasswordUseCase(userResetPasswordRequest);
    response.when(
      success: (_) {
        emit(const AuthState(status: BaseStatus.success()));
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  Future<void> signout({
    BuildContext? context,
    bool isRebuild = false,
    VoidCallback? showSnackbarFn,
  }) async {
    try {
      FirebaseCrashlytics.instance.setUserIdentifier("");
      _appPreferences.deleteAccessToken();
      _appPreferences.deleteTempAccessToken();
      await TwilioChatService.shutdown();
      await _authService.googleSignIn.signOut();
      await _authService.facebookAuth.logOut();
      await _authService.firebaseAuth.signOut();
      if (isRebuild) {
        if (context != null && context.mounted) {
          Phoenix.rebirth(context);
          context.router.replaceAll([
            LoginRoute(
              showSnackbarFn: showSnackbarFn,
            )
          ]);
        }
      }
      // ignore: empty_catches
    } catch (error) {}
  }
}
