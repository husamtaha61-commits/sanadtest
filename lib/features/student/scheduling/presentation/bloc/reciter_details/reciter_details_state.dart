part of 'reciter_details_cubit.dart';

@freezed
class ReciterDetailsState with _$ReciterDetailsState {
  const factory ReciterDetailsState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default(BaseStatus.initial()) BaseStatus actionStatus,
    Reciter? reciter,
  }) = _ReciterDetailsState;
}
