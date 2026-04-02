import 'package:json_annotation/json_annotation.dart';

import '../../../../scheduling/data/models/requests/schedule_session_request.dart';
part 'reschedule_recuuring_sessions_request.g.dart';

@JsonSerializable(createFactory: false)
class RescheduleRecuuringSessionsRequest {
  final int recieverId;
  final List<WeeklyScheduleTimes> weeklyScheduleTimes;
  final String? note;

  RescheduleRecuuringSessionsRequest({
    required this.recieverId,
    required this.weeklyScheduleTimes,
    this.note,
  });

  Map<String, dynamic> toJson() =>
      _$RescheduleRecuuringSessionsRequestToJson(this);
}
