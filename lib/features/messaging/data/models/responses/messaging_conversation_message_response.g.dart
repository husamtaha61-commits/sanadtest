// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaging_conversation_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagingConversationMessageResponse
    _$MessagingConversationMessageResponseFromJson(Map<String, dynamic> json) =>
        MessagingConversationMessageResponse(
          id: json['id'] as String?,
          body: json['body'] as String?,
          isRead: json['isRead'] as bool?,
          dateCreation: json['dateCreation'] == null
              ? null
              : DateTime.parse(json['dateCreation'] as String),
          authorId: (json['authorId'] as num?)?.toInt(),
        );

Map<String, dynamic> _$MessagingConversationMessageResponseToJson(
        MessagingConversationMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'isRead': instance.isRead,
      'dateCreation': instance.dateCreation?.toIso8601String(),
      'authorId': instance.authorId,
    };
