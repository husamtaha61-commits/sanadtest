import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/utils/date_time_converter.dart';

part 'currently_session_response.g.dart';

@JsonSerializable()
class CurrentlySessionResponse {
  final String? sessionId;
  @JsonKey(name: 'type')
  final CurrentlySessionTypeResponse? currentlySessionType;
  @JsonKey(name: 'sessionDateTime')
  @DateTimeConverter()
  final DateTime? currentlySessionDateTime;
  @JsonKey(name: 'status')
  final CurrentlySessionStatusResponse? currentlySessionStatus;
  @JsonKey(name: 'studentInfo')
  final CurrentlySessionStudentInfoResponse? currentlySessionStudentInfo;

  CurrentlySessionResponse(
      {required this.sessionId,
      required this.currentlySessionType,
      required this.currentlySessionDateTime,
      required this.currentlySessionStatus,
      required this.currentlySessionStudentInfo});

  factory CurrentlySessionResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentlySessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentlySessionResponseToJson(this);
}

@JsonSerializable()
class CurrentlySessionTypeResponse {
  final int? id;
  final String? name;

  CurrentlySessionTypeResponse({required this.id, this.name});

  factory CurrentlySessionTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentlySessionTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentlySessionTypeResponseToJson(this);
}

@JsonSerializable()
class CurrentlySessionStatusResponse {
  final int? id;
  final String? name;

  CurrentlySessionStatusResponse({required this.id, this.name});

  factory CurrentlySessionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentlySessionStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentlySessionStatusResponseToJson(this);
}

@JsonSerializable()
class CurrentlySessionStudentInfoResponse {
  final int? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;

  CurrentlySessionStudentInfoResponse(
      {required this.id, this.firstName, this.middleName, this.lastName});

  factory CurrentlySessionStudentInfoResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentlySessionStudentInfoResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CurrentlySessionStudentInfoResponseToJson(this);
}
