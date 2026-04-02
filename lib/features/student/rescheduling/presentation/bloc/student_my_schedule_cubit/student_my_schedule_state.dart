part of 'student_my_schedule_cubit.dart';

@freezed
class StudentMyScheduleState with _$StudentMyScheduleState {
  const factory StudentMyScheduleState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<Session> sessionResponse,
    Reciter? reciterInfo,
  }) = _StudentMyScheduleState;
}
