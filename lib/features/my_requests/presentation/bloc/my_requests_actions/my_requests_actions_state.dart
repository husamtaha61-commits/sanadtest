part of 'my_requests_actions_cubit.dart';

@freezed
class MyRequestsActionsState with _$MyRequestsActionsState {
  const factory MyRequestsActionsState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default(0) int requestId,
    @Default(0) int requestStatusId,
    int? approvedSuggestionId,
  }) = _MyRequestsActionsState;
}
