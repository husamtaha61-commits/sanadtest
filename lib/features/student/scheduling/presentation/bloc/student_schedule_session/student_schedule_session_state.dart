part of 'student_schedule_session_cubit.dart';

@freezed
class StudentScheduleSessionState with _$StudentScheduleSessionState {
  const factory StudentScheduleSessionState({
    @Default(BaseStatus.initial()) BaseStatus status,
  }) = _StudentScheduleSessionState;
}
