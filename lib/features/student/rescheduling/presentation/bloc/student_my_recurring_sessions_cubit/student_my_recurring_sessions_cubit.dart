import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../domain/entites/session_time_date.dart';
import '../../../domain/usecases/get_student_schedule_times.dart';

part 'student_my_recurring_sessions_state.dart';
part 'student_my_recurring_sessions_cubit.freezed.dart';

@injectable
class StudentMyRecurringSessionsCubit
    extends Cubit<StudentMyRecurringSessionsState> {
  final GetStudentScheduleTimes getStudentScheduleTimes;
  StudentMyRecurringSessionsCubit(this.getStudentScheduleTimes)
      : super(const StudentMyRecurringSessionsState());

  void getScheduleTimes([int? studentId]) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await getStudentScheduleTimes(studentId);
    response.when(
        success: (scheduledTimesResponse) {
          final scheduledSessions = scheduledTimesResponse
              .map((e) => SessionTimeDate(timeDataResponse: e))
              .toList();
          emit(
            state.copyWith(
              status: const BaseStatus.success(),
              scheduledSessions: scheduledSessions,
              originalScheduledSessions:
                  List<SessionTimeDate>.from(scheduledSessions),
            ),
          );
        },
        failure: (error) =>
            emit(state.copyWith(status: const BaseStatus.failure())));
  }

  void deleteSession(SessionTimeDate session) {
    final List<SessionTimeDate> newSessions =
        List.from(state.scheduledSessions);
    newSessions.remove(session);
    emit(state.copyWith(scheduledSessions: newSessions));
  }

  void updateExistingSession(
      SessionTimeDate session, int index, int dayId, int timeId) {
    final List<SessionTimeDate> newSessions =
        List.from(state.scheduledSessions);

    newSessions.removeAt(index);
    newSessions.insert(
        index, session.copyWith(newTimeId: timeId, newDayId: dayId));
    emit(state.copyWith(scheduledSessions: newSessions));
  }

  void resetExistingSession(SessionTimeDate session, int index) {
    final List<SessionTimeDate> newSessions =
        List.from(state.scheduledSessions);

    newSessions.removeAt(index);
    newSessions.insert(
        index, session.copyWith(newTimeId: null, newDayId: null));
    emit(state.copyWith(scheduledSessions: newSessions));
  }

  void addNewSession(SessionTimeDate session) {
    final List<SessionTimeDate> newSessions =
        List.from(state.scheduledSessions);
    newSessions.add(session);
    emit(state.copyWith(scheduledSessions: newSessions));
  }
}
