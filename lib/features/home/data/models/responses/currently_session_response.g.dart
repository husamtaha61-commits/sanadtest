// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currently_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentlySessionResponse _$CurrentlySessionResponseFromJson(
        Map<String, dynamic> json) =>
    CurrentlySessionResponse(
      sessionId: json['sessionId'] as String?,
      currentlySessionType: json['type'] == null
          ? null
          : CurrentlySessionTypeResponse.fromJson(
              json['type'] as Map<String, dynamic>),
      currentlySessionDateTime: const DateTimeConverter()
          .fromJson(json['sessionDateTime'] as String?),
      currentlySessionStatus: json['status'] == null
          ? null
          : CurrentlySessionStatusResponse.fromJson(
              json['status'] as Map<String, dynamic>),
      currentlySessionStudentInfo: json['studentInfo'] == null
          ? null
          : CurrentlySessionStudentInfoResponse.fromJson(
              json['studentInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentlySessionResponseToJson(
        CurrentlySessionResponse instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'type': instance.currentlySessionType,
      'sessionDateTime':
          const DateTimeConverter().toJson(instance.currentlySessionDateTime),
      'status': instance.currentlySessionStatus,
      'studentInfo': instance.currentlySessionStudentInfo,
    };

CurrentlySessionTypeResponse _$CurrentlySessionTypeResponseFromJson(
        Map<String, dynamic> json) =>
    CurrentlySessionTypeResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CurrentlySessionTypeResponseToJson(
        CurrentlySessionTypeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CurrentlySessionStatusResponse _$CurrentlySessionStatusResponseFromJson(
        Map<String, dynamic> json) =>
    CurrentlySessionStatusResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CurrentlySessionStatusResponseToJson(
        CurrentlySessionStatusResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CurrentlySessionStudentInfoResponse
    _$CurrentlySessionStudentInfoResponseFromJson(Map<String, dynamic> json) =>
        CurrentlySessionStudentInfoResponse(
          id: (json['id'] as num?)?.toInt(),
          firstName: json['firstName'] as String?,
          middleName: json['middleName'] as String?,
          lastName: json['lastName'] as String?,
        );

Map<String, dynamic> _$CurrentlySessionStudentInfoResponseToJson(
        CurrentlySessionStudentInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
    };
