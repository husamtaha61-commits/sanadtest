import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_reset_password_request.g.dart';

@JsonSerializable(createFactory: false)
class UserResetPasswordRequest {
  final String email;
  final String password;
  final String confirmPassword;
  final String resetToken;

  UserResetPasswordRequest({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.resetToken,
  });

  Map<String, dynamic> toJson() => _$UserResetPasswordRequestToJson(this);
}
