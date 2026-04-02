import 'package:json_annotation/json_annotation.dart';

import 'messaging_contact_response.dart';
import 'messaging_conversation_message_response.dart';
part 'messaging_conversation_response.g.dart';

@JsonSerializable()
class MessagingConversationResponse {
  final String? id;
  final MessagingContactResponse? otherParticipantInfo;
  final int? numberOfUnreadMessages;
  final String? lastMessage;
  final DateTime? lastMessageDateCreation;
  final List<MessagingConversationMessageResponse>? messages;

  MessagingConversationResponse({
    this.id,
    this.otherParticipantInfo,
    this.numberOfUnreadMessages,
    this.lastMessage,
    this.lastMessageDateCreation,
    this.messages,
  });

  factory MessagingConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagingConversationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessagingConversationResponseToJson(this);
}
