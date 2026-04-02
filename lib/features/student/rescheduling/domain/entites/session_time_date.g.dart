// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_time_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionTimeDateImpl _$$SessionTimeDateImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionTimeDateImpl(
      newDayId: (json['newDayId'] as num?)?.toInt(),
      newTimeId: (json['newTimeId'] as num?)?.toInt(),
      timeDataResponse:
          TimeData.fromJson(json['timeDataResponse'] as Map<String, dynamic>),
    );
