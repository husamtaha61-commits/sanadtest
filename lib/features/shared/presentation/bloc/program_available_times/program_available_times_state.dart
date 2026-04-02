part of 'program_available_times_cubit.dart';

@freezed
class ProgramAvailableTimesState with _$ProgramAvailableTimesState {
  const factory ProgramAvailableTimesState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<AvailableTimesOptions> programAvailableTimes,
  }) = _ProgramAvailableTimesState;
}
