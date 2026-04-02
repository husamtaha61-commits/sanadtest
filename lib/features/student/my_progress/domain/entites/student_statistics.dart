import '../../data/models/responses/student_statistics_response.dart';

class StudentStatistics {
  final int pagesPercentageProgress;
  final int sessionsPercentageProgress;
  final int numberOfPassedSkills;
  final int numberOfUnpassedSkills;
  final int numberOfAbsence;
  final int numberOfCancelledSessions;
  final int numberOfLatenessMinutes;
  final List<AverageStatistics> averageOfReadingMinutes;
  final List<AverageStatistics> averageOfCompletedPages;

  StudentStatistics({
    required this.pagesPercentageProgress,
    required this.sessionsPercentageProgress,
    required this.numberOfPassedSkills,
    required this.numberOfUnpassedSkills,
    required this.numberOfAbsence,
    required this.numberOfCancelledSessions,
    required this.numberOfLatenessMinutes,
    required this.averageOfReadingMinutes,
    required this.averageOfCompletedPages,
  });

  factory StudentStatistics.fromResponse(StudentStatisticsResponse response) =>
      StudentStatistics(
        pagesPercentageProgress: response.pagesPercentageProgress ?? 0,
        sessionsPercentageProgress: response.sessionsPercentageProgress ?? 0,
        numberOfPassedSkills: response.numberOfPassedSkills ?? 0,
        numberOfUnpassedSkills: response.numberOfUnpassedSkills ?? 0,
        numberOfAbsence: response.numberOfAbsence ?? 0,
        numberOfCancelledSessions: response.numberOfCancelledSessions ?? 0,
        numberOfLatenessMinutes: response.numberOfLatenessMinutes ?? 0,
        averageOfReadingMinutes: response.averageOfReadingMinutes?.map(AverageStatistics.fromResponse).toList() ?? [],
        averageOfCompletedPages: response.averageOfCompletedPages?.map(AverageStatistics.fromResponse).toList() ?? [],
      );
}

class AverageStatistics {
  final String intervalLabel;
  final double average;

  AverageStatistics(this.intervalLabel, this.average);

  factory AverageStatistics.fromResponse(AverageStatisticsResponse response) =>
      AverageStatistics(response.intervalLabel, response.average);
}
