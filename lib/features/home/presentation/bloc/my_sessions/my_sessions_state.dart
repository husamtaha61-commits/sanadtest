part of 'my_sessions_cubit.dart';

@freezed
class MySessionsState with _$MySessionsState {
  const factory MySessionsState({
    @Default(BaseStatus.initial()) BaseStatus status,

    /// The current active session (can be in progress or upcoming within 1 hour)
    CurrentlySession? firstSession,
    @Default(0) int firstSessionIndex,

    /// The next session after the current one
    CurrentlySession? nextSession,
    @Default(-1) int nextSessionIndex,
    @Default([]) List<Session> weekSessions,
  }) = _MySessionsState;
}
