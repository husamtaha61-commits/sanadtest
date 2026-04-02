// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderResponse _$SliderResponseFromJson(Map<String, dynamic> json) =>
    SliderResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      link: json['link'] as String?,
      isDisabled: json['isDisabled'] as bool?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$SliderResponseToJson(SliderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
      'isDisabled': instance.isDisabled,
      'imageUrl': instance.imageUrl,
    };
