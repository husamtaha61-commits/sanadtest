import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twilio_conversations/flutter_twilio_conversations.dart';

import '../../features/messaging/data/models/responses/messaging_contact_response.dart';
import '../../features/messaging/data/models/responses/messaging_conversation_response.dart';
import '../../features/messaging/domain/entities/messaging_conversation.dart';
import '../../features/messaging/domain/entities/messaging_conversation_message.dart';
import '../../features/messaging/presentation/bloc/messaging/messaging_cubit.dart';
import '../../features/shared/domain/entites/user_info.dart';
import '../../features/shared/domain/usecases/get_user_info_usecase.dart';
import '../../features/shared/presentation/bloc/user/user_cubit.dart';
import '../constants/constants.dart';
import '../di/injection.dart';
import '../network/api_response.dart';

class TwilioChatService {
  static ChatClient? chatClient;
  static StreamSubscription<ChatClientSynchronizationStatus>?
      _onClientSynchronizationSubscription;
  static StreamSubscription<ConnectionState>? _onConnectionStateSubscription;
  static StreamSubscription<void>? _onTokenAboutToExpireSubscription;
  static StreamSubscription<void>? _onTokenExpiredSubscription;
  static StreamSubscription<ErrorInfo>? _onErrorSubscription;
  static StreamSubscription<Channel>? _onChannelAddedSubscription;
  static StreamSubscription<Channel>? _onChannelDeletedSubscription;
  static final Map<String, StreamSubscription<Message>?>
      _messageAddedSubscriptions = {};
  static final Map<String, StreamSubscription<MemberUpdatedEvent>?>
      _membersUpdatedSubscriptions = {};

  static Future<void> init(token) async {
    try {
      if (chatClient == null) {
        chatClient = await TwilioConversationsClient.create(
          token,
          Properties(region: 'us1'),
        );
        _onClientSynchronization();
        _onConnectionState();
        _onError();
        _onTokenAboutToExpire();
        _onTokenExpired();
        _onChannelAdded();
        // onChannelDeletedSubscription();

        final fcm = await FirebaseMessaging.instance.getToken();
        if (fcm != null && Platform.isAndroid || Platform.isIOS) {
          await chatClient?.registerForNotification(fcm ?? "");
        }
      } else {
        await chatClient?.updateToken(token);
      }
    } catch (e) {
      if (kDebugMode) {
        log('Error initializing ChatClient: $e');
      }
    }
  }

  static Future<void> shutdown() async {
    for (var subscription in _messageAddedSubscriptions.values) {
      await subscription?.cancel();
    }
    for (var subscription in _membersUpdatedSubscriptions.values) {
      await subscription?.cancel();
    }
    _messageAddedSubscriptions.clear();
    _membersUpdatedSubscriptions.clear();
    await _onClientSynchronizationSubscription?.cancel();
    await _onChannelAddedSubscription?.cancel();
    await _onChannelDeletedSubscription?.cancel();
    await _onConnectionStateSubscription?.cancel();
    await _onTokenAboutToExpireSubscription?.cancel();
    await _onTokenExpiredSubscription?.cancel();
    await _onErrorSubscription?.cancel();
    // final fcm = await FirebaseMessaging.instance.getToken();
    // if (fcm != null) {
    //   await chatClient?.unregisterForNotification(fcm);
    // }

    await chatClient?.shutdown();
    chatClient = null;
  }

  static void _handleError(String functionName, Object error) {
    if (kDebugMode) {
      log("$functionName: $error");
    }
  }

  static MessagingCubit get _messagingCubit =>
      scaffoldMessengerKey.currentContext!.read<MessagingCubit>();

  static Channels? _getChannels() => chatClient?.channels;
  static String _getMyIdentity() => chatClient!.myIdentity!;

  static Future<Channel?> _createConversation(String friendlyName) async {
    try {
      return await _getChannels()
          ?.createChannel(friendlyName, ChannelType.PRIVATE);
    } catch (error) {
      _handleError("_createConversation", error);
      return null;
    }
  }

  static Future<Message?> _sendMsgToNewConversation(
    int authorId,
    int receiverId,
    MessageOptions msg,
  ) async {
    _messagingCubit.updateIsNewConversationFlag(true);
    Channel? newChannel = await _createConversation("${authorId}_$receiverId");

    await newChannel?.members?.addByIdentity(receiverId.toString());
    await newChannel?.join();
    final message = await newChannel?.messages?.sendMessage(msg);
    _messagingCubit.tempConversationId = newChannel?.sid;
    _messagingCubit.updateIsNewConversationFlag(false);
    return message;
  }

  static Future<Member> _getOtherMember(Channel channel) async {
    final myId =
        scaffoldMessengerKey.currentContext?.read<UserCubit>().state.id;

    final members = await channel.members?.getMembersList() ?? [];
    final Member otherMember =
        members.firstWhere((member) => member.identity != myId.toString());
    return otherMember;
  }

  static Future<MessagingConversation> _createConversationInstance(
      Channel channel,
      Message lastMessage,
      UserInfo userInfo,
      bool newConversation) async {
    Future<int> getNumberOfUnreadMessages() async {
      late int? numberOfUnreadMessages;
      if (newConversation) {
        numberOfUnreadMessages = _getMyIdentity() == lastMessage.author ? 0 : 1;
      } else {
        final Member myMember =
            await channel.members!.getMember(_getMyIdentity());
        numberOfUnreadMessages = myMember.lastReadMessageIndex != null
            ? await channel.getUnreadMessagesCount()
            : await channel.getMessagesCount();
      }
      return numberOfUnreadMessages ?? 0;
    }

    return MessagingConversation.fromResponse(
      MessagingConversationResponse(
        id: channel.sid,
        lastMessage: lastMessage.messageBody,
        otherParticipantInfo: MessagingContactResponse(
          id: userInfo.id,
          firstName: userInfo.firstName,
          middleName: userInfo.middleName,
          lastName: userInfo.lastName,
          profileImageUrl: userInfo.profileImageUrl,
        ),
        numberOfUnreadMessages: await getNumberOfUnreadMessages(),
        lastMessageDateCreation: lastMessage.dateCreated,
      ),
    );
  }

  static Future<ApiResult<Map<String, MessagingConversation>>?>
      getConversations() async {
    try {
      final subscribedChannels = _getChannels()?.subscribedChannels ?? [];

      for (var channel in subscribedChannels) {
        _onMessageAdded(channel);
        _onMemberUpdated(channel);
      }

      final Map<String, MessagingConversation> conversations = {};

      for (final channel in subscribedChannels) {
        if (channel.synchronizationStatus != ChannelSynchronizationStatus.ALL) {
          break;
        }
        try {
          final lastMessage = await channel.messages
              ?.getMessageByIndex(channel.lastMessageIndex ?? 0);

          final Member otherMember = await _getOtherMember(channel);

          if (otherMember.identity == null) {
            log('Channel ${channel.sid} has member with null identity');
            await channel.leave();
            continue;
          }
          final int otherMemberIdentity = int.parse(otherMember.identity!);

          _messagingCubit.addMemberId(otherMemberIdentity);

          final response = await getIt<GetUserInfoUseCase>()
              .call(otherMemberIdentity); // 6 7 8 9 10

          await response.when(
            success: (userInfo) async {
              conversations[channel.sid] = await _createConversationInstance(
                channel,
                lastMessage!,
                userInfo,
                false,
              );
            },
            failure: (error) async {
              if (kDebugMode) {
                log("Failed to fetch user info: $error");
              }
              await channel.leave();
            },
          );
        } catch (error) {
          if (kDebugMode) {
            log("getConversation: $error");
          }
        }
      }

      return ApiResult.success(conversations);
    } catch (error) {
      if (kDebugMode) {
        log("getConversations: $error");
      }
      return const ApiResult.failure("Error");
    }
  }

  static void setAllMessageReadWithResult(String conversationId) async {
    final channel = await chatClient?.channels?.getChannel(conversationId);
    channel?.messages?.setAllMessagesReadWithResult();
  }

  static Future<void> leaveConversation() async {
    final subscribedChannels = chatClient?.channels?.subscribedChannels ?? [];

    for (var ch in subscribedChannels) {
      await ch.leave();
    }
    // final x =
    //     await _getChannels()?.getChannel("CH9e430e732e6a4274b555fbd202c57193");
    // await x?.leave();
  }

  static void sendMessage({
    String? body,
    String? channelSidOrUniqueName,
    int? authorId,
    int? receiverId,
  }) async {
    assert(
      channelSidOrUniqueName != null ||
          (authorId != null && receiverId != null),
      'authorId and receiverId must be provided if channelSidOrUniqueName is null',
    );
    try {
      final msg = MessageOptions();
      msg.withBody(body ?? "");

      if (channelSidOrUniqueName == null) {
        await _sendMsgToNewConversation(authorId!, receiverId!, msg);
      } else {
        final subscribedChannel =
            await _getChannels()?.getChannel(channelSidOrUniqueName);
        await subscribedChannel?.messages?.sendMessage(msg);
      }
    } catch (error) {
      _handleError("sendMessage", error);
    }
    return null;
  }

  static Future<(List<Message>, int?, int)> getMessages(
      String channelSidOrUniqueName, int pageSize) async {
    final channel = await TwilioConversationsClient.chatClient?.channels
        ?.getChannel(channelSidOrUniqueName);

    final lastMessageIndex = channel?.lastMessageIndex ?? 0;
    final itemLength = _messagingCubit
            .state
            .conversations[channelSidOrUniqueName]
            ?.pagingController!
            .itemList
            ?.length ??
        0;
    final startIndex = lastMessageIndex - itemLength;

    final messages = await channel?.messages?.getMessagesBefore(
          startIndex,
          pageSize,
        ) ??
        [];

    final member = await _getOtherMember(channel!);

    return (messages, member.lastReadMessageIndex, startIndex);
  }

  //S-----------------------------Listeners-----------------------------S//

  static void _onClientSynchronization() {
    void onData(ChatClientSynchronizationStatus status) {
      if (status != ChatClientSynchronizationStatus.FAILED) {
        _messagingCubit.updateTwilioClient();
        final conversations = _messagingCubit.state.conversations;
        if (conversations.isEmpty) {
          _messagingCubit.getConversations();
        }
      }
    }

    onData(ChatClientSynchronizationStatus.STARTED);
    _onClientSynchronizationSubscription =
        chatClient?.onClientSynchronization?.listen(onData);
  }

  static void _onConnectionState() {
    _onConnectionStateSubscription = chatClient?.onConnectionState?.listen(
      (state) {
        if (state != ConnectionState.CONNECTED &&
            state != ConnectionState.CONNECTING) {
          _messagingCubit.getToken();
        }
      },
    );
  }

  static void _onTokenAboutToExpire() {
    _onTokenAboutToExpireSubscription =
        chatClient?.onTokenAboutToExpire?.listen(
      (event) {
        _messagingCubit.getToken();
      },
    );
  }

  static void _onTokenExpired() {
    _onTokenExpiredSubscription = chatClient?.onTokenExpired?.listen(
      (event) {
        _messagingCubit.getToken();
      },
    );
  }

  static void _onError() {
    _onErrorSubscription = chatClient?.onError?.listen(
      (ErrorInfo error) {
        log(error.toString());
        if (chatClient?.connectionState != ConnectionState.CONNECTED) {
          _messagingCubit.getToken();
        }
      },
    );
  }

  static void _onChannelAdded() {
    _onChannelAddedSubscription = chatClient?.onChannelAdded?.listen(
      (channel) async {
        if (_messageAddedSubscriptions.containsKey(channel.sid) &&
            !(_messageAddedSubscriptions[channel.sid]?.isPaused ?? true)) {
          return;
        }
        final subscription = channel.onMessageAdded?.listen(
          (message) async {
            try {
              if (!_messagingCubit.state.conversations
                  .containsKey(channel.sid)) {
                _messagingCubit.tempConversationId = channel.sid;

                final Member otherMember = await _getOtherMember(channel);
                final int otherMemberIdentity =
                    int.parse(otherMember.identity!);

                if (!_messagingCubit.memebersIds
                    .contains(otherMemberIdentity)) {
                  _messagingCubit.addMemberId(otherMemberIdentity);
                }

                final response =
                    await getIt<GetUserInfoUseCase>().call(otherMemberIdentity);

                response.when(
                  success: (userInfo) async {
                    final conversation = {
                      channel.sid: await _createConversationInstance(
                        channel,
                        message,
                        userInfo,
                        true,
                      ),
                    };
                    final lastMessage = MessagingConversationMessage(
                      authorId: int.parse(message.author!),
                      body: message.messageBody,
                      dateCreation: message.dateCreated,
                      id: message.sid,
                      isRead: false,
                    );

                    _messagingCubit.addConversation(
                      conversation,
                      lastMessage,
                    );
                  },
                  failure: (error) async {
                    log(
                      'New conversation: user $otherMemberIdentity not found. Leaving channel ${channel.sid}',
                    );
                    await channel.leave();
                  },
                );
              } else {
                _messagingCubit.updateConversationMessages(
                  channel.sid,
                  message,
                );
              }
            } catch (error) {
              _handleError("_onChannelAdded", error);
            }
          },
        );
        _onMemberUpdated(channel);

        if (subscription != null) {
          _messageAddedSubscriptions.putIfAbsent(
              channel.sid, () => subscription);
        }
      },
    );
  }

  // static onChannelDeletedSubscription() {
  //   _onChannelDeletedSubscription =
  //       chatClient?.onChannelDeleted?.listen((channel) async {
  //     scaffoldMessengerKey.currentContext
  //         ?.read<MessagingCubit>()
  //         .deleteConversation(channel.sid);
  //   });
  // }

  static void _onMessageAdded(Channel channel) async {
    if (_messageAddedSubscriptions.containsKey(channel.sid) &&
        !(_messageAddedSubscriptions[channel.sid]?.isPaused ?? true)) {
      return;
    }
    final subscription = channel.onMessageAdded?.listen(
      (Message message) async {
        _messagingCubit.updateConversationMessages(
          channel.sid,
          message,
        );
      },
    );

    if (subscription != null) {
      _messageAddedSubscriptions.putIfAbsent(channel.sid, () => subscription);
    }
  }

  static void _onMemberUpdated(Channel channel) async {
    if (_membersUpdatedSubscriptions.containsKey(channel.sid) &&
        !(_membersUpdatedSubscriptions[channel.sid]?.isPaused ?? true)) {
      return;
    }
    final subscription = channel.onMemberUpdated?.listen(
      (MemberUpdatedEvent event) async {
        final myId = scaffoldMessengerKey.currentContext!
            .read<UserCubit>()
            .state
            .id
            .toString();
        if (event.reason == MemberUpdateReason.LAST_READ_MESSAGE_INDEX &&
            event.member.identity != myId) {
          _messagingCubit.markMyMessagesAsSeen(channel.sid);
        }
      },
    );

    if (subscription != null) {
      _membersUpdatedSubscriptions.putIfAbsent(channel.sid, () => subscription);
    }
  }

  //E-----------------------------Listeners-----------------------------E//
}
