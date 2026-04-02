import 'package:json_annotation/json_annotation.dart';

part 'skill_response.g.dart';

@JsonSerializable()
class SkillResponse {
  final int? id;
  final int? parentId;
  final String? name;
  final bool? isGained;
  final List<SkillResponse>? children;
  final double? percent;

  SkillResponse({
    required this.id,
    required this.parentId,
    required this.name,
    required this.isGained,
    required this.children,
    required this.percent,
  });

  factory SkillResponse.fromJson(Map<String, dynamic> json) =>
      _$SkillResponseFromJson(json);
}
