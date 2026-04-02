// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_type_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionTypeLookupResponse _$SectionTypeLookupResponseFromJson(
        Map<String, dynamic> json) =>
    SectionTypeLookupResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SectionTypeLookupResponseToJson(
        SectionTypeLookupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
