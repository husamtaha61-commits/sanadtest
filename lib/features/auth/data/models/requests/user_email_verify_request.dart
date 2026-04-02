import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_email_verify_request.g.dart';

@JsonSerializable(createFactory: false)
class UserEmailVerifiyRequest {
  final String email;
  final String otp;

  UserEmailVerifiyRequest({required this.email, required this.otp});

  Map<String, dynamic> toJson() => _$UserEmailVerifiyRequestToJson(this);
}
