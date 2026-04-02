import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_config_response.g.dart';

@JsonSerializable()
class AdminConfigResponse {
  final int minNumOfAvaialableTimes;
  final int timeFrameForStartScheduleByDays;
  final int minNumOfSessionsWeekly;
  final int maxNumOfSessionsWeekly;
  final int eligibleUserMaxNumOfSessionsWeekly;
  final int minNumberOfHoursBetweenSessions;
  final int minLengthForReciterVideoInMinutes;

  AdminConfigResponse({
    required this.minNumOfAvaialableTimes,
    required this.timeFrameForStartScheduleByDays,
    required this.minNumOfSessionsWeekly,
    required this.maxNumOfSessionsWeekly,
    required this.eligibleUserMaxNumOfSessionsWeekly,
    required this.minNumberOfHoursBetweenSessions,
    required this.minLengthForReciterVideoInMinutes,
  });

  factory AdminConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminConfigResponseToJson(this);
}
