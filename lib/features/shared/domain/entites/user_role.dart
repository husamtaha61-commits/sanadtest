import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/responses/user_role_response.dart.dart';

part 'user_role.g.dart';

@JsonSerializable()
class UserRole {
  final int id;
  final String name;
  final String comparisonName;

  const UserRole(
      {required this.id, required this.name, required this.comparisonName});

  factory UserRole.fromResponse(UserRoleResponse? response) {
    if (response == null) {
      return const UserRole(
        id: -1,
        name: "",
        comparisonName: "",
      );
    }
    return UserRole(
      id: response.id ?? -1,
      name: response.name ?? "",
      comparisonName: response.comparisonName ?? "",
    );
  }

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$UserRoleFromJson(json);

  Map<String, dynamic> toJson() => _$UserRoleToJson(this);
}
