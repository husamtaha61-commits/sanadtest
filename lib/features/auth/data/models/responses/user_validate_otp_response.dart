import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_validate_otp_response.g.dart';

@JsonSerializable(createToJson: false)
class UserValidateOtpResponse {
  final String resetToken;

  UserValidateOtpResponse({required this.resetToken});

  factory UserValidateOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$UserValidateOtpResponseFromJson(json);
}
