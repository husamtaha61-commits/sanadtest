part of 'skill_cubit.dart';

@freezed
class SkillState with _$SkillState {
  const factory SkillState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<Skill> skills,
  }) = _SkillState;
}
