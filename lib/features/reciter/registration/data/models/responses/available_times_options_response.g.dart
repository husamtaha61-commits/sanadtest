// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_times_options_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeDataResponseImpl _$$TimeDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TimeDataResponseImpl(
      dayId: (json['dayId'] as num?)?.toInt(),
      timeId: (json['timeId'] as num?)?.toInt(),
      timeValue: json['timeValue'] as String?,
      isReserved: json['isReserved'] as bool?,
      dateTime: json['dateTime'] as String?,
    );
