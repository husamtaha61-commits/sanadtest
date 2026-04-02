import 'package:freezed_annotation/freezed_annotation.dart';

part 'reciter_statistics_response.g.dart';

@JsonSerializable()
class ReciterStatisticsResponse {
  final int? numberOfKhitmat;
  final int? numberOfAbsence;
  final int? numberOfSuspendedKhitmat;
  final int? completedSessionsPercentage;
  final int? availableTimesPercentage;

  ReciterStatisticsResponse({
    this.numberOfKhitmat,
    this.numberOfAbsence,
    this.numberOfSuspendedKhitmat,
    this.completedSessionsPercentage,
    this.availableTimesPercentage,
  });

  factory ReciterStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReciterStatisticsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReciterStatisticsResponseToJson(this);
}
