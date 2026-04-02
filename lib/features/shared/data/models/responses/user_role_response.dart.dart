import 'package:json_annotation/json_annotation.dart';

part 'user_role_response.dart.g.dart';

@JsonSerializable()
class UserRoleResponse {
  final int? id;
  final String? name;
  final String? comparisonName;

  UserRoleResponse({
    this.id,
    this.name,
    this.comparisonName,
  });

  factory UserRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRoleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserRoleResponseToJson(this);
}
