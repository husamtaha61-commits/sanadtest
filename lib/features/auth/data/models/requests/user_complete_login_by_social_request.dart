import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_complete_login_by_social_request.g.dart';

@JsonSerializable(createFactory: false)
class UserCompleteLoginBySocialRequest {
  final String firstName;
  final String lastName;
  final String dateOfBirth;

  UserCompleteLoginBySocialRequest({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toJson() =>
      _$UserCompleteLoginBySocialRequestToJson(this);
}
