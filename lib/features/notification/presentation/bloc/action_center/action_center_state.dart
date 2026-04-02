part of 'action_center_cubit.dart';

@freezed
class ActionCenterState with _$ActionCenterState {
  const factory ActionCenterState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<ActionCenter> actions,
  }) = _ActionCenterState;
}
