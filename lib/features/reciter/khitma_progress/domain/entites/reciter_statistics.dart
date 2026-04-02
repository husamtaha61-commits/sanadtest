import '../../data/models/responses/reciter_statistics_response.dart';

class ReciterStatistics {
  final int numberOfKhitmat;
  final int numberOfAbsence;
  final int numberOfSuspendedKhitmat;
  final int completedSessionsPercentage;
  final int availableTimesPercentage;

  ReciterStatistics({
    required this.numberOfKhitmat,
    required this.numberOfAbsence,
    required this.numberOfSuspendedKhitmat,
    required this.completedSessionsPercentage,
    required this.availableTimesPercentage,
  });

  factory ReciterStatistics.fromResponse(ReciterStatisticsResponse response) =>
      ReciterStatistics(
        numberOfKhitmat: response.numberOfKhitmat ?? 0,
        numberOfAbsence: response.numberOfAbsence ?? 0,
        numberOfSuspendedKhitmat: response.numberOfSuspendedKhitmat ?? 0,
        completedSessionsPercentage: response.completedSessionsPercentage ?? 0,
        availableTimesPercentage: response.availableTimesPercentage ?? 0,
      );
}
