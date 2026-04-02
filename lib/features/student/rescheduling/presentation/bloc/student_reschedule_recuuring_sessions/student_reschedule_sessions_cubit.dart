import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../../../scheduling/data/models/requests/schedule_session_request.dart';
import '../../../data/models/requests/add_extra_session_request.dart';
import '../../../data/models/requests/reschedule_recuuring_sessions_request.dart';
import '../../../data/models/requests/reschedule_session_once_request.dart';
import '../../../domain/entites/session_time_date.dart';
import '../../../domain/usecases/add_extra_session_use_case.dart';
import '../../../domain/usecases/cancel_session_use_case.dart';
import '../../../domain/usecases/makeup_session_use_case.dart';
import '../../../domain/usecases/reschedule_recuuring_sessions_use_case.dart';
import '../../../domain/usecases/reschedule_session_once_use_case.dart';
import '../../../domain/usecases/validate_session_cancellation_use_case.dart';

part 'student_reschedule_sessions_state.dart';
part 'student_reschedule_sessions_cubit.freezed.dart';

@injectable
class StudentRescheduleSessionsCubit
    extends Cubit<StudentRescheduleSessionsState> {
  final RescheduleRecuuringSessionsUseCase _recuuringSessionsUseCase;
  final RescheduleSessionOnceUseCase _rescheduleSessionOnceUseCase;
  final MakeupSessionUseCase _makeupSessionUseCase;
  final CancelSessionUseCase _cancelSessionUseCase;
  final ValidateSessionCancellationUseCase _validateSessionCancellationUseCase;
  final AddExtraSessionUseCase _addExtraSessionUseCase;

  StudentRescheduleSessionsCubit(
      this._recuuringSessionsUseCase,
      this._rescheduleSessionOnceUseCase,
      this._makeupSessionUseCase,
      this._cancelSessionUseCase,
      this._validateSessionCancellationUseCase,
      this._addExtraSessionUseCase)
      : super(const StudentRescheduleSessionsState());

  String errorMsg = '';
  final note = TextEditingController();
  String? cancledSessionId;

  void rescheduleRecuuringSessions(
      int recieverId, List<SessionTimeDate> sessions) async {
    emit(state.copyWith(
        status: const BaseStatus.loading(),
        event: StudentRescheduleSessionsEvent.reschedule));
    final RescheduleRecuuringSessionsRequest recuuringSessionsRequest =
        RescheduleRecuuringSessionsRequest(
      recieverId: recieverId,
      weeklyScheduleTimes: sessions
          .map(
            (session) => WeeklyScheduleTimes(
              dayId: session.newDayId ?? session.timeDataResponse.dayId,
              timeId: session.newTimeId ?? session.timeDataResponse.timeId,
            ),
          )
          .toList(),
      note: note.text.isEmpty ? null : note.text,
    );
    final response = await _recuuringSessionsUseCase(recuuringSessionsRequest);
    response.when(
      success: (data) => emit(state.copyWith(
          status: const BaseStatus.success(),
          event: StudentRescheduleSessionsEvent.reschedule)),
      failure: (error) => emit(state.copyWith(
          status: const BaseStatus.failure(),
          event: StudentRescheduleSessionsEvent.reschedule)),
    );
  }

  //S--------------------Reschedule Once--------------------S//

  void selectDay(int dayId) {
    emit(state.copyWith(
      selectedDay: dayId,
      selectedTime: null,
    ));
  }

  void selectTime(String dateTime) {
    emit(state.copyWith(selectedTime: dateTime));
  }

  void addSuggestedSession(TimeData timeData) {
    final List<TimeData> newList = List.from(state.suggestedSessions);
    newList.add(timeData);
    emit(
      state.copyWith(
        suggestedSessions: newList,
        selectedTime: null,
        selectedDay: null,
      ),
    );
  }

  void deleteSuggestedSession(TimeData timeData) {
    final List<TimeData> newList = List.from(state.suggestedSessions);
    newList.remove(timeData);
    emit(
      state.copyWith(suggestedSessions: newList),
    );
  }

  void reschduleSessionOnce(
    String sessionId,
  ) async {
    emit(state.copyWith(
        status: const BaseStatus.loading(),
        event: StudentRescheduleSessionsEvent.reschedule));

    final RescheduleSessionOnceRequest rescheduleSessionOnceRequest =
        RescheduleSessionOnceRequest(
      sessionId: sessionId,
      suggestionTimes: state.suggestedSessions
          .map((suggestedSession) => suggestedSession.dateTime!)
          .toList(),
      note: note.text.isEmpty ? null : note.text,
    );
    final response =
        await _rescheduleSessionOnceUseCase(rescheduleSessionOnceRequest);
    response.when(
      success: (data) => emit(state.copyWith(
          status: const BaseStatus.success(),
          event: StudentRescheduleSessionsEvent.reschedule)),
      failure: (error) => emit(state.copyWith(
          status: const BaseStatus.failure(),
          event: StudentRescheduleSessionsEvent.reschedule)),
    );
  }

  void makeupSession(
    String sessionId,
  ) async {
    emit(state.copyWith(
        status: const BaseStatus.loading(),
        event: StudentRescheduleSessionsEvent.reschedule));

    final RescheduleSessionOnceRequest makeSessionRequest =
        RescheduleSessionOnceRequest(
      sessionId: sessionId,
      suggestionTimes: state.suggestedSessions
          .map((suggestedSession) => suggestedSession.dateTime!)
          .toList(),
      note: note.text.isEmpty ? null : note.text,
    );
    final response = await _makeupSessionUseCase(makeSessionRequest);
    response.when(
      success: (data) => emit(state.copyWith(
          status: const BaseStatus.success(),
          event: StudentRescheduleSessionsEvent.reschedule)),
      failure: (error) => emit(state.copyWith(
          status: const BaseStatus.failure(),
          event: StudentRescheduleSessionsEvent.reschedule)),
    );
  }

  Future<bool> validateCancellation(String sessionId) async {
    final response = await _validateSessionCancellationUseCase(sessionId);

    return response.when(
      success: (isValid) {
        return isValid;
      },
      failure: (_) {
        return false;
      },
    );
  }

  void cancelSession(String sessionId) async {
    emit(state.copyWith(
        status: const BaseStatus.loading(),
        event: StudentRescheduleSessionsEvent.cancel));
    final response = await _cancelSessionUseCase(sessionId);
    response.when(
      success: (data) {
        cancledSessionId = sessionId;
        emit(state.copyWith(
            status: const BaseStatus.success(),
            event: StudentRescheduleSessionsEvent.cancel));
      },
      failure: (error) => emit(state.copyWith(
          status: const BaseStatus.failure(),
          event: StudentRescheduleSessionsEvent.cancel)),
    );
  }

  void addExtraSession(int reciterId) async {
    if (state.suggestedSessions.isEmpty) return;

    emit(state.copyWith(
        status: const BaseStatus.loading(),
        event: StudentRescheduleSessionsEvent.addExtraSession));

    final addExtraSessionRequest = AddExtraSessionRequest(
      reciterId: reciterId,
      suggestionTimes: state.suggestedSessions
          .where((session) => session.dateTime != null)
          .map((session) => session.dateTime!)
          .toList(),
      durationInMinutes: 60,
      note: note.text.isEmpty ? null : note.text,
    );

    final response = await _addExtraSessionUseCase(addExtraSessionRequest);
    response.when(
      success: (data) => emit(state.copyWith(
          status: const BaseStatus.success(),
          event: StudentRescheduleSessionsEvent.addExtraSession)),
      failure: (error) => emit(state.copyWith(
          status: const BaseStatus.failure(),
          event: StudentRescheduleSessionsEvent.addExtraSession)),
    );
  }
  //E--------------------Reschedule Once--------------------E//

  void showError(String errMsg) {
    errorMsg = errMsg;
    withStateEmission(() {});
  }

  void withStateEmission(VoidCallback callback) {
    emit(state.copyWith(status: const BaseStatus.initial()));
    callback();
    emit(state.copyWith(status: const BaseStatus.changed()));
  }

  @override
  Future<void> close() {
    note.dispose();
    return super.close();
  }
}
