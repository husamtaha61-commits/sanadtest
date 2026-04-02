// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_times_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeDataImpl _$$TimeDataImplFromJson(Map<String, dynamic> json) =>
    _$TimeDataImpl(
      userDayId: (json['userDayId'] as num).toInt(),
      dayId: (json['dayId'] as num).toInt(),
      timeId: (json['timeId'] as num).toInt(),
      userDayName: json['userDayName'] as String,
      userTimeValue: json['userTimeValue'] as String,
      isReserved: json['isReserved'] as bool,
      dateTime: json['dateTime'] as String?,
    );
