// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_reciter_availability_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeReciterAvailabilityRequest _$ChangeReciterAvailabilityRequestFromJson(
        Map<String, dynamic> json) =>
    ChangeReciterAvailabilityRequest(
      dayId: (json['dayId'] as num).toInt(),
      hoursIds: (json['hoursIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ChangeReciterAvailabilityRequestToJson(
        ChangeReciterAvailabilityRequest instance) =>
    <String, dynamic>{
      'dayId': instance.dayId,
      'hoursIds': instance.hoursIds,
    };

Map<String, dynamic> _$$ChangeReciterAvailabilityRequestImplToJson(
        _$ChangeReciterAvailabilityRequestImpl instance) =>
    <String, dynamic>{
      'dayId': instance.dayId,
      'hoursIds': instance.hoursIds,
    };
