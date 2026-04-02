part of 'my_requests_cubit.dart';

@freezed
class MyRequestsState with _$MyRequestsState {
  const factory MyRequestsState({
    @Default(BaseStatus.initial()) BaseStatus requestListStatus,
    @Default(BaseStatus.initial()) BaseStatus requestByIdStatus,
    @Default([]) List<MyRequest> myRequests,
    @Default([]) List<int> requestStatuses,
    @Default([]) List<int> requestTypes,
    @Default([]) List<int> requesterSides,
  }) = _MyRequestsState;
}
