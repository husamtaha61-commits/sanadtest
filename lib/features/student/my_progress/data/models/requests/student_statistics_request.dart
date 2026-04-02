import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_statistics_request.g.dart';

@JsonSerializable()
class StudentStatisticsRequest {
  final int? readingMinutesAverageInterval;
  final int? completedPagesAverageInterval;

  StudentStatisticsRequest({
    required this.readingMinutesAverageInterval,
    required this.completedPagesAverageInterval,
  });

  factory StudentStatisticsRequest.fromJson(Map<String, dynamic> json) =>
      _$StudentStatisticsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StudentStatisticsRequestToJson(this);
}
