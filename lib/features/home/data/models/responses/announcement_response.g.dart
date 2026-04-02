// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementResponse _$AnnouncementResponseFromJson(
        Map<String, dynamic> json) =>
    AnnouncementResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      body: json['body'] as String?,
      link: json['link'] as String?,
      isActive: json['isActive'] as bool?,
      imageUrl: json['imageUrl'] as String?,
      startVisibilityDate: json['startVisibilityDate'] as String?,
      expirationDate: json['expirationDate'] as String?,
    );

Map<String, dynamic> _$AnnouncementResponseToJson(
        AnnouncementResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'link': instance.link,
      'isActive': instance.isActive,
      'imageUrl': instance.imageUrl,
      'startVisibilityDate': instance.startVisibilityDate,
      'expirationDate': instance.expirationDate,
    };
