// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_statistics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentStatisticsResponse _$StudentStatisticsResponseFromJson(
        Map<String, dynamic> json) =>
    StudentStatisticsResponse(
      pagesPercentageProgress:
          (json['pagesPercentageProgress'] as num?)?.toInt(),
      sessionsPercentageProgress:
          (json['sessionsPercentageProgress'] as num?)?.toInt(),
      numberOfPassedSkills: (json['numberOfPassedSkills'] as num?)?.toInt(),
      numberOfUnpassedSkills: (json['numberOfUnpassedSkills'] as num?)?.toInt(),
      numberOfAbsence: (json['numberOfAbsence'] as num?)?.toInt(),
      numberOfCancelledSessions:
          (json['numberOfCancelledSessions'] as num?)?.toInt(),
      numberOfLatenessMinutes:
          (json['numberOfLatenessMinutes'] as num?)?.toInt(),
      averageOfReadingMinutes:
          (json['averageOfReadingMinutes'] as List<dynamic>?)
              ?.map((e) =>
                  AverageStatisticsResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
      averageOfCompletedPages:
          (json['averageOfCompletedPages'] as List<dynamic>?)
              ?.map((e) =>
                  AverageStatisticsResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$StudentStatisticsResponseToJson(
        StudentStatisticsResponse instance) =>
    <String, dynamic>{
      'pagesPercentageProgress': instance.pagesPercentageProgress,
      'sessionsPercentageProgress': instance.sessionsPercentageProgress,
      'numberOfPassedSkills': instance.numberOfPassedSkills,
      'numberOfUnpassedSkills': instance.numberOfUnpassedSkills,
      'numberOfAbsence': instance.numberOfAbsence,
      'numberOfCancelledSessions': instance.numberOfCancelledSessions,
      'numberOfLatenessMinutes': instance.numberOfLatenessMinutes,
      'averageOfReadingMinutes': instance.averageOfReadingMinutes,
      'averageOfCompletedPages': instance.averageOfCompletedPages,
    };

AverageStatisticsResponse _$AverageStatisticsResponseFromJson(
        Map<String, dynamic> json) =>
    AverageStatisticsResponse(
      json['intervalLabel'] as String,
      (json['average'] as num).toDouble(),
    );

Map<String, dynamic> _$AverageStatisticsResponseToJson(
        AverageStatisticsResponse instance) =>
    <String, dynamic>{
      'intervalLabel': instance.intervalLabel,
      'average': instance.average,
    };
