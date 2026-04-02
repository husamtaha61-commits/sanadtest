import 'package:json_annotation/json_annotation.dart';

part 'messaging_conversation_message_response.g.dart';

@JsonSerializable()
class MessagingConversationMessageResponse {
  final String? id;
  final String? body;
  final bool? isRead;
  final DateTime? dateCreation;
  final int? authorId;

  MessagingConversationMessageResponse( {
    this.id,
      this.body,
      this.isRead,
      this.dateCreation,
      this.authorId
  });

  factory MessagingConversationMessageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MessagingConversationMessageResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MessagingConversationMessageResponseToJson(this);
}
