// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_statistics_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentStatisticsRequest _$StudentStatisticsRequestFromJson(
        Map<String, dynamic> json) =>
    StudentStatisticsRequest(
      readingMinutesAverageInterval:
          (json['readingMinutesAverageInterval'] as num?)?.toInt(),
      completedPagesAverageInterval:
          (json['completedPagesAverageInterval'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StudentStatisticsRequestToJson(
        StudentStatisticsRequest instance) =>
    <String, dynamic>{
      'readingMinutesAverageInterval': instance.readingMinutesAverageInterval,
      'completedPagesAverageInterval': instance.completedPagesAverageInterval,
    };
