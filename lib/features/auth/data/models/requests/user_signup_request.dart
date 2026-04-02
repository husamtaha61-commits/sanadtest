import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_signup_request.g.dart';

@JsonSerializable(createFactory: false)
class UserSignupRequest {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String email;
  final String password;
  final String confirmPassword;

  UserSignupRequest({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$UserSignupRequestToJson(this);
}
