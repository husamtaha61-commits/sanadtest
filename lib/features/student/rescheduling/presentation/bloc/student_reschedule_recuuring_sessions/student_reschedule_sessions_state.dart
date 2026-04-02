part of 'student_reschedule_sessions_cubit.dart';

@freezed
class StudentRescheduleSessionsState with _$StudentRescheduleSessionsState {
  const factory StudentRescheduleSessionsState({
    @Default(BaseStatus.initial()) BaseStatus status,
    int? selectedDay,
    String? selectedTime,
    StudentRescheduleSessionsEvent? event,
    @Default([]) List<TimeData> suggestedSessions,
  }) = _StudentRescheduleSessionsState;
}

enum StudentRescheduleSessionsEvent {
  reschedule,
  cancel,
  addExtraSession,
}
