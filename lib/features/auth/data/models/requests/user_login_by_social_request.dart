import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_by_social_request.g.dart';

@JsonSerializable(createFactory: false)
class UserLoginBySocialRequest {
  final String idToken;
  final String providerAccessToken;
  final String providerName;

  UserLoginBySocialRequest({
    required this.idToken,
    required this.providerAccessToken,
    required this.providerName,
  });

  Map<String, dynamic> toJson() => _$UserLoginBySocialRequestToJson(this);
}
