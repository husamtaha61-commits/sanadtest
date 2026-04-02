import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/responses/base_field_response.dart';
import '../../../../../../core/utils/date_time_converter.dart';
import '../../../../scheduling/data/models/responses/reciter_response.dart';
part 'my_schedule_response.g.dart';

@JsonSerializable(createToJson: false)
class MyScheduleResponse {
  final ReciterResponse? reciterInfo;
  final List<SessionResponse>? sessions;

  MyScheduleResponse({this.reciterInfo, this.sessions});
  factory MyScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$MyScheduleResponseFromJson(json);
}

@JsonSerializable()
class SessionResponse {
  String? sessionId;
  BaseFieldResponse? type;
  @DateTimeConverter()
  DateTime? sessionDateTime;
  BaseFieldResponse? status;
  StudentInfoResponse? studentInfo;

  SessionResponse({
    this.sessionId,
    this.type,
    this.sessionDateTime,
    this.status,
    this.studentInfo,
  });

  factory SessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SessionResponseToJson(this);
}

@JsonSerializable()
class StudentInfoResponse {
  final int? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;

  StudentInfoResponse({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
  });

  factory StudentInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentInfoResponseToJson(this);
}
