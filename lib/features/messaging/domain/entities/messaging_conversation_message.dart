import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/responses/messaging_conversation_message_response.dart';
part 'messaging_conversation_message.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class MessagingConversationMessage with _$MessagingConversationMessage {
  const factory MessagingConversationMessage({
    required String id,
    String? body,
    bool? isRead,
    DateTime? dateCreation,
    required int authorId,
  }) = _MessagingConversationMessage;

  factory MessagingConversationMessage.fromResponse(
      MessagingConversationMessageResponse? response) {
    if (response == null) {
      return const MessagingConversationMessage(
        id: "",
        body: null,
        isRead: true,
        dateCreation: null,
        authorId: -1,
      );
    }
    return MessagingConversationMessage(
      id: response.id ?? "",
      body: response.body,
      isRead: response.isRead ?? true,
      dateCreation: response.dateCreation,
      authorId: response.authorId ?? -1,
    );
  }
}
