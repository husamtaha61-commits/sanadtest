import 'package:json_annotation/json_annotation.dart';

part 'user_change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  final String email;
  final String oldPassword;
  final String password;
  final String confirmPassword;

  ChangePasswordRequest({
    required this.email,
    required this.oldPassword,
    required this.password,
    required this.confirmPassword,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
