// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyScheduleResponse _$MyScheduleResponseFromJson(Map<String, dynamic> json) =>
    MyScheduleResponse(
      reciterInfo: json['reciterInfo'] == null
          ? null
          : ReciterResponse.fromJson(
              json['reciterInfo'] as Map<String, dynamic>),
      sessions: (json['sessions'] as List<dynamic>?)
          ?.map((e) => SessionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) =>
    SessionResponse(
      sessionId: json['sessionId'] as String?,
      type: json['type'] == null
          ? null
          : BaseFieldResponse.fromJson(json['type'] as Map<String, dynamic>),
      sessionDateTime: const DateTimeConverter()
          .fromJson(json['sessionDateTime'] as String?),
      status: json['status'] == null
          ? null
          : BaseFieldResponse.fromJson(json['status'] as Map<String, dynamic>),
      studentInfo: json['studentInfo'] == null
          ? null
          : StudentInfoResponse.fromJson(
              json['studentInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionResponseToJson(SessionResponse instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'type': instance.type,
      'sessionDateTime':
          const DateTimeConverter().toJson(instance.sessionDateTime),
      'status': instance.status,
      'studentInfo': instance.studentInfo,
    };

StudentInfoResponse _$StudentInfoResponseFromJson(Map<String, dynamic> json) =>
    StudentInfoResponse(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$StudentInfoResponseToJson(
        StudentInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
    };
