// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminConfigResponse _$AdminConfigResponseFromJson(Map<String, dynamic> json) =>
    AdminConfigResponse(
      minNumOfAvaialableTimes: (json['minNumOfAvaialableTimes'] as num).toInt(),
      timeFrameForStartScheduleByDays:
          (json['timeFrameForStartScheduleByDays'] as num).toInt(),
      minNumOfSessionsWeekly: (json['minNumOfSessionsWeekly'] as num).toInt(),
      maxNumOfSessionsWeekly: (json['maxNumOfSessionsWeekly'] as num).toInt(),
      eligibleUserMaxNumOfSessionsWeekly:
          (json['eligibleUserMaxNumOfSessionsWeekly'] as num).toInt(),
      minNumberOfHoursBetweenSessions:
          (json['minNumberOfHoursBetweenSessions'] as num).toInt(),
      minLengthForReciterVideoInMinutes:
          (json['minLengthForReciterVideoInMinutes'] as num).toInt(),
    );

Map<String, dynamic> _$AdminConfigResponseToJson(
        AdminConfigResponse instance) =>
    <String, dynamic>{
      'minNumOfAvaialableTimes': instance.minNumOfAvaialableTimes,
      'timeFrameForStartScheduleByDays':
          instance.timeFrameForStartScheduleByDays,
      'minNumOfSessionsWeekly': instance.minNumOfSessionsWeekly,
      'maxNumOfSessionsWeekly': instance.maxNumOfSessionsWeekly,
      'eligibleUserMaxNumOfSessionsWeekly':
          instance.eligibleUserMaxNumOfSessionsWeekly,
      'minNumberOfHoursBetweenSessions':
          instance.minNumberOfHoursBetweenSessions,
      'minLengthForReciterVideoInMinutes':
          instance.minLengthForReciterVideoInMinutes,
    };
