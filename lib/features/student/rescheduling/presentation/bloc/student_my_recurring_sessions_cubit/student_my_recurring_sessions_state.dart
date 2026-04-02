part of 'student_my_recurring_sessions_cubit.dart';

@freezed
class StudentMyRecurringSessionsState with _$StudentMyRecurringSessionsState {
  const factory StudentMyRecurringSessionsState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<SessionTimeDate> scheduledSessions,
    @Default([]) List<SessionTimeDate> originalScheduledSessions,
  }) = _StudentMyRecurringSessionsState;
}
