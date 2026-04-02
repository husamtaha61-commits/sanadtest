part of 'reciter_student_cubit.dart';

@freezed
class ReciterStudentState with _$ReciterStudentState {
  const factory ReciterStudentState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<ReciterStudent> students,
    @Default(-1) int activeStudentId,
  }) = _ReciterStudentState;
}
