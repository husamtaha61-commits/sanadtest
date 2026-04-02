import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/entities/base_field.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/extenstions/date_time.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/utils/app_date.dart';
import '../../../../student/rescheduling/domain/entites/session.dart';
import '../../../data/models/requests/my_sessions_request.dart';
import '../../../domain/entites/currently_session.dart';
import '../../../domain/usecases/get_my_currently_session_use_case.dart';
import '../../../domain/usecases/get_my_sessions_use_case.dart';

part 'my_sessions_state.dart';
part 'my_sessions_cubit.freezed.dart';

@injectable
class MySessionsCubit extends Cubit<MySessionsState> {
  MySessionsCubit(this.getMySessionsUseCase, this.getCurrentlySessionsUseCase)
      : super(const MySessionsState());
  final GetMySessionsUseCase getMySessionsUseCase;
  final GetCurrentlySessionsUseCase getCurrentlySessionsUseCase;

  // -------------------------------------------------- session counter bar (in home page) --------------------------------------------------
  void getMyUpCommingSession() async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await getCurrentlySessionsUseCase();
    response.when(success: (sessionsResponse) {
      // Check if we have any sessions
      if (sessionsResponse.isEmpty) {
        emit(
          state.copyWith(
            status: const BaseStatus.success(),
            firstSession: null,
            firstSessionIndex: 0,
            nextSession: null,
            nextSessionIndex: -1,
          ),
        );
        return;
      }

      // We have at least one session, display the first one
      final hasNextSession = sessionsResponse.length > 1;

      emit(
        state.copyWith(
          status: const BaseStatus.success(),
          firstSession: sessionsResponse[0],
          firstSessionIndex: 0,
          nextSession: hasNextSession ? sessionsResponse[1] : null,
          nextSessionIndex: hasNextSession ? 1 : -1,
        ),
      );
    }, failure: (error) {
      emit(state.copyWith(status: const BaseStatus.failure()));
    });
  }

  void getWeekSessions() async {
    DateTime now = DateTime.now().toUtc();
    DateTime startOfWeek =
        now.subtract(Duration(days: now.weekday % 7)); // Sunday
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6)); // Saturady

    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await getMySessionsUseCase(
      MySessionsRequest(
        dateStart: startOfWeek.toStr(AppDate.yyyyMMdd),
        dateLimit: endOfWeek.toStr(AppDate.yyyyMMdd),
      ),
    );

    response.whenOrNull(
      success: (sessionsResponse) {
        emit(
          state.copyWith(
            status: const BaseStatus.success(),
            weekSessions: sessionsResponse,
          ),
        );
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void updateWeekSessions(String sessionId) {
    emit(
      state.copyWith(
        weekSessions: state.weekSessions
            .map(
              (e) => e.sessionId == sessionId
                  ? e.copyWith(
                      status: BaseField(
                          id: SessionStatus.cancelled.intValue,
                          name: SessionStatus.cancelled.name))
                  : e,
            )
            .toList(),
      ),
    );
  }

  /// Refreshes the upcoming session data from the API.
  /// This is useful to check if the session status has changed (e.g., completed early).
  /// Returns the updated first session or null if no upcoming session exists.
  Future<CurrentlySession?> refreshUpcomingSession() async {
    final response = await getCurrentlySessionsUseCase();

    CurrentlySession? updatedFirstSession;

    response.whenOrNull(
      success: (sessionsResponse) {
        final now = DateTime.now();

        // Find sessions within time window (no status filtering, same as getMyUpCommingSession)
        final joinableSessions = sessionsResponse.where((session) {
          final sessionEndTime =
              session.currentlySessionDateTime.add(const Duration(minutes: 60));
          return sessionEndTime.isAfter(now);
        }).toList();

        // // Sort by session date time (earliest first)
        joinableSessions.sort((a, b) =>
            a.currentlySessionDateTime.compareTo(b.currentlySessionDateTime));

        CurrentlySession? firstSession;
        int firstSessionIndex = -1;
        CurrentlySession? nextSession;
        int nextSessionIndex = -1;

        if (joinableSessions.isNotEmpty) {
          firstSession = joinableSessions.first;
          firstSessionIndex = sessionsResponse.isNotEmpty ? 0 : -1;
          updatedFirstSession = firstSession;

          if (joinableSessions.length > 1) {
            nextSession = joinableSessions.last;
            nextSessionIndex = sessionsResponse.length > 1 ? 1 : -1;
          }
        }

        emit(state.copyWith(
            status: const BaseStatus.success(),
            firstSession: firstSession,
            firstSessionIndex: firstSessionIndex,
            nextSession: nextSession,
            nextSessionIndex: nextSessionIndex));
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );

    return updatedFirstSession;
  }

  /// Promotes the next session to be the current session.
  /// Called when the current session ends (time-based or status-based).
  void promoteNextSession() {
    if (state.nextSession != null) {
      emit(state.copyWith(
        firstSession: state.nextSession,
        firstSessionIndex: state.nextSessionIndex,
        nextSession: null,
        nextSessionIndex: -1,
      ));
      // Refresh to get the new next session
      refreshUpcomingSession();
    } else {
      emit(state.copyWith(
        firstSession: null,
        firstSessionIndex: -1,
        nextSession: null,
        nextSessionIndex: -1,
      ));
    }
  }
}
