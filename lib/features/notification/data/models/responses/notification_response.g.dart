// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      isRead: json['isRead'] as bool?,
      isSessionRelated: json['isSessionRelated'] as bool?,
      creationDate:
          const DateTimeConverter().fromJson(json['creationDate'] as String?),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'isRead': instance.isRead,
      'isSessionRelated': instance.isSessionRelated,
      'url': instance.url,
      'creationDate': const DateTimeConverter().toJson(instance.creationDate),
    };
