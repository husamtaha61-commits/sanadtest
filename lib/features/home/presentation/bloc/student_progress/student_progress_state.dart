part of 'student_progress_cubit.dart';

@freezed
class StudentProgressState with _$StudentProgressState {
  const factory StudentProgressState({
    @Default(BaseStatus.initial()) BaseStatus status,
    StudentProgress? studentProgress,
    @Default(-1) int studentId,
  }) = _StudentProgressState;
}
