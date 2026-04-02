// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_session_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ScheduleSessionRequestToJson(
        ScheduleSessionRequest instance) =>
    <String, dynamic>{
      'recieverId': instance.recieverId,
      'weeklyScheduleTimes': instance.weeklyScheduleTimes,
      'note': instance.note,
      'durationInMinutes': instance.durationInMinutes,
    };

Map<String, dynamic> _$WeeklyScheduleTimesToJson(
        WeeklyScheduleTimes instance) =>
    <String, dynamic>{
      'dayId': instance.dayId,
      'timeId': instance.timeId,
    };
