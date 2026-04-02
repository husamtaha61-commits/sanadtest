import 'package:json_annotation/json_annotation.dart';

part 'home_section_role_response.g.dart';

@JsonSerializable()
class HomeSectionRoleResponse {
  final int? roleId;
  final int? homeSectionId;

  HomeSectionRoleResponse({
    required this.roleId,
    required this.homeSectionId,
  });

  factory HomeSectionRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeSectionRoleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeSectionRoleResponseToJson(this);
}
