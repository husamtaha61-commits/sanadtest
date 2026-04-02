// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_connection_reciter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalRecitersSectionResponse _$GlobalRecitersSectionResponseFromJson(
        Map<String, dynamic> json) =>
    GlobalRecitersSectionResponse(
      sectionData: json['sectionData'] == null
          ? null
          : SectionDataResponse.fromJson(
              json['sectionData'] as Map<String, dynamic>),
      numOfReciters: (json['numOfReciters'] as num?)?.toInt(),
      numOfStudents: (json['numOfStudents'] as num?)?.toInt(),
      numOfIjazah: (json['numOfIjazah'] as num?)?.toInt(),
      numOfItqan: (json['numOfItqan'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GlobalRecitersSectionResponseToJson(
        GlobalRecitersSectionResponse instance) =>
    <String, dynamic>{
      'sectionData': instance.sectionData,
      'numOfReciters': instance.numOfReciters,
      'numOfStudents': instance.numOfStudents,
      'numOfIjazah': instance.numOfIjazah,
      'numOfItqan': instance.numOfItqan,
    };

SectionDataResponse _$SectionDataResponseFromJson(Map<String, dynamic> json) =>
    SectionDataResponse(
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageId: json['imageId'] as String?,
    );

Map<String, dynamic> _$SectionDataResponseToJson(
        SectionDataResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imageId': instance.imageId,
    };
