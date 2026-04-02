// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciter_student_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReciterStudentResponse _$ReciterStudentResponseFromJson(
        Map<String, dynamic> json) =>
    ReciterStudentResponse(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$ReciterStudentResponseToJson(
        ReciterStudentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'profileImageUrl': instance.profileImageUrl,
    };
