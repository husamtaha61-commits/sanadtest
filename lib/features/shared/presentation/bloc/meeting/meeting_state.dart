part of 'meeting_cubit.dart';

@freezed
class MeetingState with _$MeetingState {
  const factory MeetingState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default('') String url,
    @Default(false) bool sessionStarted,
  }) = _MeetingState;
}
