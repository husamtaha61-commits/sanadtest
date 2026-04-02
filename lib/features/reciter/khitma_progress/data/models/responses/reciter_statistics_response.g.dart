// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciter_statistics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReciterStatisticsResponse _$ReciterStatisticsResponseFromJson(
        Map<String, dynamic> json) =>
    ReciterStatisticsResponse(
      numberOfKhitmat: (json['numberOfKhitmat'] as num?)?.toInt(),
      numberOfAbsence: (json['numberOfAbsence'] as num?)?.toInt(),
      numberOfSuspendedKhitmat:
          (json['numberOfSuspendedKhitmat'] as num?)?.toInt(),
      completedSessionsPercentage:
          (json['completedSessionsPercentage'] as num?)?.toInt(),
      availableTimesPercentage:
          (json['availableTimesPercentage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReciterStatisticsResponseToJson(
        ReciterStatisticsResponse instance) =>
    <String, dynamic>{
      'numberOfKhitmat': instance.numberOfKhitmat,
      'numberOfAbsence': instance.numberOfAbsence,
      'numberOfSuspendedKhitmat': instance.numberOfSuspendedKhitmat,
      'completedSessionsPercentage': instance.completedSessionsPercentage,
      'availableTimesPercentage': instance.availableTimesPercentage,
    };
