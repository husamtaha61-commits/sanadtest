part of 'student_statistics_cubit.dart';

@freezed
class StudentStatisticsState with _$StudentStatisticsState {
  const factory StudentStatisticsState({
    @Default(BaseStatus.initial()) BaseStatus status,
    StudentStatistics? studentStatistics,
  }) = _StudentStatisticsState;
}
