part of 'reciter_statistics_cubit.dart';

@freezed
class ReciterStatisticsState with _$ReciterStatisticsState {
  const factory ReciterStatisticsState({
    @Default(BaseStatus.initial()) BaseStatus status,
    ReciterStatistics? reciterStatistics,
  }) = _ReciterStatisticsState;
}
