// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaging_conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagingConversationResponse _$MessagingConversationResponseFromJson(
        Map<String, dynamic> json) =>
    MessagingConversationResponse(
      id: json['id'] as String?,
      otherParticipantInfo: json['otherParticipantInfo'] == null
          ? null
          : MessagingContactResponse.fromJson(
              json['otherParticipantInfo'] as Map<String, dynamic>),
      numberOfUnreadMessages: (json['numberOfUnreadMessages'] as num?)?.toInt(),
      lastMessage: json['lastMessage'] as String?,
      lastMessageDateCreation: json['lastMessageDateCreation'] == null
          ? null
          : DateTime.parse(json['lastMessageDateCreation'] as String),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessagingConversationMessageResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessagingConversationResponseToJson(
        MessagingConversationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'otherParticipantInfo': instance.otherParticipantInfo,
      'numberOfUnreadMessages': instance.numberOfUnreadMessages,
      'lastMessage': instance.lastMessage,
      'lastMessageDateCreation':
          instance.lastMessageDateCreation?.toIso8601String(),
      'messages': instance.messages,
    };
