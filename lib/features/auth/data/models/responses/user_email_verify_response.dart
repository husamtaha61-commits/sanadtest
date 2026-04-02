import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_email_verify_response.g.dart';

@JsonSerializable(createToJson: false)
class UserEmailVerifiyResponse {
  final String token;

  UserEmailVerifiyResponse({required this.token});

  factory UserEmailVerifiyResponse.fromJson(Map<String, dynamic> json) =>
      _$UserEmailVerifiyResponseFromJson(json);
}
