import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_statistics_response.g.dart';

@JsonSerializable()
class StudentStatisticsResponse {
  final int? pagesPercentageProgress;
  final int? sessionsPercentageProgress;
  final int? numberOfPassedSkills;
  final int? numberOfUnpassedSkills;
  final int? numberOfAbsence;
  final int? numberOfCancelledSessions;
  final int? numberOfLatenessMinutes;
  final List<AverageStatisticsResponse>? averageOfReadingMinutes;
  final List<AverageStatisticsResponse>? averageOfCompletedPages;

  StudentStatisticsResponse({
    this.pagesPercentageProgress,
    this.sessionsPercentageProgress,
    this.numberOfPassedSkills,
    this.numberOfUnpassedSkills,
    this.numberOfAbsence,
    this.numberOfCancelledSessions,
    this.numberOfLatenessMinutes,
    this.averageOfReadingMinutes,
    this.averageOfCompletedPages,
  });

  factory StudentStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentStatisticsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentStatisticsResponseToJson(this);
}


@JsonSerializable()
class AverageStatisticsResponse {
  final String intervalLabel;
  final double average;

  AverageStatisticsResponse(this.intervalLabel, this.average);

  factory AverageStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$AverageStatisticsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AverageStatisticsResponseToJson(this);
}