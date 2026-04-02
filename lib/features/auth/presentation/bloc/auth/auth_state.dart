part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default('') String firstName,
    @Default('') String middleName,
    @Default('') String lastName,
    @Default('') String email,
    @Default('') String dateOfBirth,
    @Default('') String role,
    @Default(false) bool isVerified,
    @Default(false) bool isLoginCompleted,
    @Default(false) bool isForgotPasswordMode,
    @Default('') String resetToken,
    @Default('') String accessToken,
    @Default(false) bool showVerificationMessage
  }) = _AuthState;
}
