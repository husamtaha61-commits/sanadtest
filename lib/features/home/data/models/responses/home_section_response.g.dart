// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_section_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSectionResponse _$HomeSectionResponseFromJson(Map<String, dynamic> json) =>
    HomeSectionResponse(
      sectionTypeId: (json['sectionTypeId'] as num?)?.toInt(),
      sectionTypeLookup: json['sectionTypeLookup'] == null
          ? null
          : SectionTypeLookupResponse.fromJson(
              json['sectionTypeLookup'] as Map<String, dynamic>),
      title: json['title'] as String?,
      visable: json['visable'] as bool?,
      orderNumber: (json['orderNumber'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      homeSectionRoles: (json['homeSectionRoles'] as List<dynamic>?)
          ?.map((e) =>
              HomeSectionRoleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeSectionResponseToJson(
        HomeSectionResponse instance) =>
    <String, dynamic>{
      'sectionTypeId': instance.sectionTypeId,
      'sectionTypeLookup': instance.sectionTypeLookup,
      'title': instance.title,
      'visable': instance.visable,
      'orderNumber': instance.orderNumber,
      'id': instance.id,
      'homeSectionRoles': instance.homeSectionRoles,
    };
