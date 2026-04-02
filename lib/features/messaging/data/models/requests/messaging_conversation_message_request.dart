import 'package:json_annotation/json_annotation.dart';
part 'messaging_conversation_message_request.g.dart';

@JsonSerializable(createFactory: false)
class MessagingConversationMessageRequest {
  final String conversationId;
  final int otherUserId;
  final int? pageNumber;
  final int? pageSize;
  final String? searchTerm;

  MessagingConversationMessageRequest({
    required this.conversationId,
    required this.otherUserId,
    this.pageNumber,
    this.pageSize,
    this.searchTerm,
  });

  Map<String, dynamic> toJson() =>
      _$MessagingConversationMessageRequestToJson(this);
}
