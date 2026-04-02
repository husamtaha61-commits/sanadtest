part of 'reciter_available_times_cubit.dart';

@freezed
class ReciterAvailableTimesState with _$ReciterAvailableTimesState {
  const factory ReciterAvailableTimesState(
          {@Default(BaseStatus.initial()) BaseStatus status,
          @Default([]) List<AvailableTimesOptions> reciterAvailableTimes,
          required Map<int, TimeData> reciterTimeDataMap,
          required Map<int, TimeData> reciterSelectedTimeDataMap,
          @Default([]) List<AvailableTimesOptions> programAvailableTimes,
          @Default(false) bool isEditingAvailability}) =
      _ReciterAvailableTimesState;
}
