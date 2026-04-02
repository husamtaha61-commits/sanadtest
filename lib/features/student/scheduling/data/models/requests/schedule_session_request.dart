import 'package:freezed_annotation/freezed_annotation.dart';
part 'schedule_session_request.g.dart';

@JsonSerializable(createFactory: false)
class ScheduleSessionRequest {
  final int recieverId;
  final List<WeeklyScheduleTimes> weeklyScheduleTimes;
  final String? note;
  @JsonKey(defaultValue: 60)
  final int durationInMinutes;

  ScheduleSessionRequest({
    required this.recieverId,
    required this.weeklyScheduleTimes,
    this.note,
    this.durationInMinutes = 60,
  });

  Map<String, dynamic> toJson() => _$ScheduleSessionRequestToJson(this);
}

@JsonSerializable(createFactory: false)
class WeeklyScheduleTimes {
  final int dayId;
  final int timeId;

  WeeklyScheduleTimes({required this.dayId, required this.timeId});

  Map<String, dynamic> toJson() => _$WeeklyScheduleTimesToJson(this);
}
