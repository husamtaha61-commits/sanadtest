// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookups_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookUpsDataResponse _$LookUpsDataResponseFromJson(Map<String, dynamic> json) =>
    LookUpsDataResponse(
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nationalities: (json['nationalities'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      genders: (json['genders'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      recitations: (json['recitations'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      recitationTypes: (json['recitationTypes'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      userIdTypes: (json['userIdTypes'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      ageRanges: (json['ageRanges'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestStatuses: (json['requestStatuses'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestTypes: (json['requestTypes'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      requesterSide: (json['requesterSide'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      averageIntervals: (json['averageIntervals'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LookUpsDataResponseToJson(
        LookUpsDataResponse instance) =>
    <String, dynamic>{
      'languages': instance.languages,
      'nationalities': instance.nationalities,
      'countries': instance.countries,
      'genders': instance.genders,
      'recitations': instance.recitations,
      'recitationTypes': instance.recitationTypes,
      'userIdTypes': instance.userIdTypes,
      'ageRanges': instance.ageRanges,
      'requestStatuses': instance.requestStatuses,
      'requestTypes': instance.requestTypes,
      'requesterSide': instance.requesterSide,
      'days': instance.days,
      'averageIntervals': instance.averageIntervals,
    };
