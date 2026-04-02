import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_signin_request.g.dart';

@JsonSerializable(createFactory: false)
class UserSignInRequest {
  final String email;
  final String password;

  UserSignInRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$UserSignInRequestToJson(this);
}
