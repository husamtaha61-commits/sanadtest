import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twilio_conversations/flutter_twilio_conversations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/services/twilio_chat_service.dart';
import '../../../data/models/responses/messaging_conversation_message_response.dart';
import '../../../domain/entities/messaging_conversation.dart';
import '../../../domain/entities/messaging_conversation_message.dart';
import '../../../domain/usecases/get_messaging_token_use_case.dart';

part 'messaging_state.dart';
part 'messaging_cubit.freezed.dart';

@injectable
class MessagingCubit extends Cubit<MessagingState> {
  final GetMessagingTokenUseCase _getMessagingTokenUseCase;
  MessagingCubit(this._getMessagingTokenUseCase)
      : super(const MessagingState());

  final List<int> memebersIds = [];
  final messageController = TextEditingController();
  final conversationQueryController = TextEditingController();
  String? tempConversationId;

  Future<void> getToken() async {
    final response = await _getMessagingTokenUseCase();
    response.when(
      success: (token) async {
        await TwilioChatService.init(token);
        emit(state.copyWith(token: token));
      },
      failure: (error) {},
    );
  }

  void updateTwilioClient() => emit(state.copyWith(isTwilioClientSync: true));

  void updateIsNewConversationFlag(bool value) =>
      emit(state.copyWith(isNewConversation: value));

  void getConversations() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await TwilioChatService.getConversations();
    response?.when(
      success: (conversations) => emit(
        state.copyWith(
          status: const BaseStatus.success(),
          conversations: conversations,
        ),
      ),
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void searchOnConversations() {
    emit(state.copyWith(status: const BaseStatus.loading()));
    emit(state.copyWith(status: const BaseStatus.success()));
  }

  void getMessages(
    String channelSidOrUniqueName,
  ) async {
    const pageSize = 20;
    final (
      List<Message> messages,
      int? lastOtherReadMessageIndex,
      int startIndex,
    ) = await TwilioChatService.getMessages(channelSidOrUniqueName, pageSize);
    final currentConversation = state.conversations[channelSidOrUniqueName];

    if (currentConversation == null) return;

    final List<MessagingConversationMessage> updatedMessages = messages.reversed
        .map(
          (message) => MessagingConversationMessage.fromResponse(
            MessagingConversationMessageResponse(
              authorId: int.tryParse(message.author!),
              body: message.messageBody,
              dateCreation: message.dateCreated,
              id: message.sid,
              isRead: lastOtherReadMessageIndex == null
                  ? false
                  : (message.messageIndex ?? 0) <= (lastOtherReadMessageIndex)
                      ? true
                      : false,
            ),
          ),
        )
        .toList();

    final isLastPage = messages.length < pageSize;
    if (isLastPage) {
      currentConversation.pagingController!.appendLastPage(updatedMessages);
    } else {
      currentConversation.pagingController!.appendPage(updatedMessages,
          currentConversation.pagingController!.nextPageKey! + 1);
    }
  }

  void sendMessage({
    String? body,
    String? channelSidOrUniqueName,
    int? authorId,
    int? receiverId,
  }) async {
    TwilioChatService.sendMessage(
      body: body,
      channelSidOrUniqueName: channelSidOrUniqueName,
      receiverId: receiverId,
      authorId: authorId,
    );
  }

  void addMemberId(int id) {
    memebersIds.add(id);
  }

  void markAllConversationMessagesAsRead(String conversationId) {
    final currentConversation = state.conversations[conversationId];

    if (currentConversation == null) return;

    TwilioChatService.setAllMessageReadWithResult(conversationId);

    final updatedConversation =
        currentConversation.copyWith(numberOfUnreadMessages: 0);

    emit(
      state.copyWith(
        conversations: {
          ...state.conversations,
          conversationId: updatedConversation,
        },
      ),
    );
  }

  void markMyMessagesAsSeen(String conversationId) {
    final currentConversation = state.conversations[conversationId];

    if (currentConversation == null) return;
    emit(state.copyWith(status: const BaseStatus.changed()));

    currentConversation.pagingController?.itemList = currentConversation
        .pagingController?.itemList
        ?.map((message) => message.copyWith(isRead: true))
        .toList();
    emit(state.copyWith(status: const BaseStatus.success()));
  }

  void markAllConversationsAsRead() {
    final Map<String, MessagingConversation> updatedConversations = {};
    for (final conversation in state.conversations.values) {
      TwilioChatService.setAllMessageReadWithResult(conversation.id);

      final updatedConversation =
          conversation.copyWith(numberOfUnreadMessages: 0);
      updatedConversations[conversation.id] = updatedConversation;
    }
    emit(
      state.copyWith(
        conversations: updatedConversations,
      ),
    );
  }

  bool _isInMsgPage(String conversationId) {
    try {
      final currentRouter = getIt<AppRouter>().current;
      final args = currentRouter.args as MessageRouteArgs?;
      final isInMsgPage = currentRouter.name == 'MessageRoute' &&
          (args?.conversationId == conversationId ||
              conversationId == tempConversationId);
      return isInMsgPage;
    } catch(_) {
      return false;
    }
  }

  void addConversation(Map<String, MessagingConversation> conversation,
      MessagingConversationMessage message) {
    final conversationId = conversation.keys.first;
    final newConversation = conversation.values.first;

    final isInMsgPage = _isInMsgPage(conversationId);

    newConversation.pagingController?.appendLastPage([message]);

    final updatedConversation = isInMsgPage
        ? {conversationId: newConversation.copyWith(numberOfUnreadMessages: 0)}
        : null;

    if (isInMsgPage) {
      TwilioChatService.setAllMessageReadWithResult(conversationId);
    }

    emit(state.copyWith(conversations: {
      ...(updatedConversation ?? conversation),
      ...state.conversations,
    }));
  }

  void updateConversationMessages(
    String conversationId,
    Message message,
  ) {
    final currentConversation = state.conversations[conversationId];

    if (currentConversation == null) return;

    final newMessage = MessagingConversationMessage.fromResponse(
      MessagingConversationMessageResponse(
        authorId: int.tryParse(message.author!),
        body: message.messageBody,
        dateCreation: message.dateCreated,
        id: message.sid,
        isRead: false,
      ),
    );

    currentConversation.pagingController?.itemList?.insert(0, newMessage);

    final isInMsgPage = _isInMsgPage(conversationId);

    if (isInMsgPage) {
      TwilioChatService.setAllMessageReadWithResult(conversationId);
    }
    final updatedConversation = currentConversation.copyWith(
      lastMessage: message.messageBody,
      lastMessageDateCreation: message.dateCreated,
      numberOfUnreadMessages:
          isInMsgPage ? 0 : currentConversation.numberOfUnreadMessages + 1,
    );

    emit(
      state.copyWith(
        conversations: {
          ...state.conversations,
          conversationId: updatedConversation,
        },
      ),
    );
  }

  void deleteConversation(String id) {
    final conversation = state.conversations[id];
    memebersIds.remove(conversation?.otherParticipantInfo.id);
    final updatedConversations = {...state.conversations};
    updatedConversations.remove(id);
    emit(state.copyWith(conversations: updatedConversations));
  }
}
