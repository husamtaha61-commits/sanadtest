// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_center_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionCenterResponse _$ActionCenterResponseFromJson(
        Map<String, dynamic> json) =>
    ActionCenterResponse(
      id: (json['id'] as num?)?.toInt(),
      message: json['message'] as String?,
      title: json['title'] as String?,
      actionName: json['actionName'] as String?,
      metaDataObject: json['metaDataObject'] as Map<String, dynamic>?,
      creationDate:
          const DateTimeConverter().fromJson(json['creationDate'] as String?),
    );

Map<String, dynamic> _$ActionCenterResponseToJson(
        ActionCenterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'title': instance.title,
      'actionName': instance.actionName,
      'metaDataObject': instance.metaDataObject,
      'creationDate': const DateTimeConverter().toJson(instance.creationDate),
    };
