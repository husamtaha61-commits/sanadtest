// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sanad_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SanadCourseResponse _$SanadCourseResponseFromJson(Map<String, dynamic> json) =>
    SanadCourseResponse(
      courseId: (json['courseId'] as num?)?.toInt(),
      courseTitle: json['courseTitle'] as String?,
      stepsTotal: (json['stepsTotal'] as num?)?.toInt(),
      stepsCompleted: (json['stepsCompleted'] as num?)?.toInt(),
      progressPercentage: (json['progressPercentage'] as num?)?.toInt(),
      progressStatus: json['progressStatus'] as String?,
    );

Map<String, dynamic> _$SanadCourseResponseToJson(
        SanadCourseResponse instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseTitle': instance.courseTitle,
      'stepsTotal': instance.stepsTotal,
      'stepsCompleted': instance.stepsCompleted,
      'progressPercentage': instance.progressPercentage,
      'progressStatus': instance.progressStatus,
    };
