import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/models/responses/messaging_conversation_response.dart';
import 'messaging_contact.dart';
import 'messaging_conversation_message.dart';
part 'messaging_conversation.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class MessagingConversation with _$MessagingConversation {
  const factory MessagingConversation({
    required String id,
    required MessagingContact otherParticipantInfo,
    required int numberOfUnreadMessages,
    String? lastMessage,
    DateTime? lastMessageDateCreation,
    PagingController<int, MessagingConversationMessage>? pagingController,
  }) = _MessagingConversation;

  factory MessagingConversation.fromResponse(
          MessagingConversationResponse response) =>
      MessagingConversation(
        id: response.id ?? "",
        numberOfUnreadMessages: response.numberOfUnreadMessages ?? 0,
        otherParticipantInfo:
            MessagingContact.fromResponse(response.otherParticipantInfo),
        lastMessage: response.lastMessage ?? "",
        lastMessageDateCreation: response.lastMessageDateCreation,
        pagingController: PagingController(firstPageKey: 1),
      );
}
