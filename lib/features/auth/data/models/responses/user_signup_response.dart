import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_signup_response.g.dart';

@JsonSerializable(createToJson: false)
class UserSignupResponse {
  final String email;
  final bool isVerified;
  final String? accessToken;
  final String? resetToken;
  final bool? isLoginCompleted;

  UserSignupResponse({
    required this.email,
    required this.isVerified,
    this.accessToken,
    this.resetToken,
    this.isLoginCompleted,
  });

  factory UserSignupResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSignupResponseFromJson(json);
}
