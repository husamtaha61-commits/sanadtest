import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/skill_response.dart';

part 'skill.freezed.dart';

@freezed
class Skill with _$Skill {
  const Skill._();

  const factory Skill(
      {required int id,
      int? parentId,
      required String name,
      bool? isGained,
      List<Skill>? children,
      @Default(SkillType.undefined) SkillType type,
      @Default(0.0) double? percent}) = _Skill;

  bool get hasChildren => children?.isNotEmpty == true;

  double get childrenCompletionPercentage {
    if (children?.isEmpty ?? true) {
      return percent != 0 && percent != null ? percent! : 0.0;
    }
    final gainedChildrenCount =
        children!.where((child) => child.isGained == true).length;
    return (gainedChildrenCount / (children!.length)) * 100;
  }

  factory Skill.fromResponse(SkillResponse response) => Skill(
        id: response.id ?? -1,
        parentId: response.parentId,
        name: response.name ?? "",
        isGained: response.isGained,
        children: (response.children ?? [])
            .map((skillResponse) => Skill.fromResponse(skillResponse))
            .toList(),
        percent: response.percent ?? 0.0,
      );
}

enum SkillType {
  undefined,
  level,
  section,
  skillWithoutChildren,
  skillWithChildren,
  subSkill
}
