part of 'session_details_cubit.dart';

@freezed
class SessionDetailsState with _$SessionDetailsState {
  const factory SessionDetailsState({
    @Default(BaseStatus.initial()) BaseStatus status,
    SessionDetails? sessionDetails,
    @Default([]) List<Note> myNotes,
    @Default([]) List<Note> otherNotes,
  }) = _SessionDetailsState;
}
