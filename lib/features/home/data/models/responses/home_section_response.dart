import 'package:json_annotation/json_annotation.dart';

import 'home_section_role_response.dart';
import 'section_type_lookup_response.dart';

part 'home_section_response.g.dart';

@JsonSerializable()
class HomeSectionResponse {
  final int? sectionTypeId;
  final SectionTypeLookupResponse? sectionTypeLookup;
  final String? title;
  final bool? visable;
  final int? orderNumber;
  final int? id;
  final List<HomeSectionRoleResponse>? homeSectionRoles;

  HomeSectionResponse({
    required this.sectionTypeId,
    required this.sectionTypeLookup,
    required this.title,
    required this.visable,
    required this.orderNumber,
    required this.id,
    required this.homeSectionRoles,
  });

  factory HomeSectionResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeSectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeSectionResponseToJson(this);
}
