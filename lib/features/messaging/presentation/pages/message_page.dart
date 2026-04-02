import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../domain/entities/messaging_contact.dart';
import '../../domain/entities/messaging_conversation.dart';
import '../../domain/entities/messaging_conversation_message.dart';
import '../bloc/messaging/messaging_cubit.dart';
import '../widgets/message_page/message_page_chat_msg.dart';
import '../widgets/message_page/message_page_footer.dart';
import '../widgets/message_page/message_page_header.dart';

@RoutePage()
class MessagePage extends StatefulWidget {
  final String? conversationId;
  final MessagingContact otherParticipantInfo;
  const MessagePage({
    super.key,
    this.conversationId,
    required this.otherParticipantInfo,
  });

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  late void Function(int) _pageRequestListener;
  late MessagingCubit messagingCubit;

  @override
  void initState() {
    super.initState();
    if (widget.conversationId != null) {
      messagingCubit = context.read<MessagingCubit>();

      final MessagingConversation? conversation =
          messagingCubit.state.conversations[widget.conversationId];

      _pageRequestListener = (pageKey) {
        messagingCubit.getMessages(widget.conversationId!);
      };

      if (conversation != null) {
        conversation.pagingController!
            .addPageRequestListener(_pageRequestListener);
      }
    }
  }

  @override
  void dispose() {
    final MessagingConversation? conversation = messagingCubit.state.conversations[widget.conversationId];
    conversation?.pagingController?.removePageRequestListener(_pageRequestListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messagingCubit = context.read<MessagingCubit>();
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        messagingCubit.tempConversationId = null;
        messagingCubit.messageController.text = '';
        if (messagingCubit.state.conversations[widget.conversationId] != null) {
          messagingCubit
              .state.conversations[widget.conversationId]?.pagingController
              ?.removePageRequestListener(_pageRequestListener);
        }
      },
      child: BlocListener<MessagingCubit, MessagingState>(
        listenWhen: (previous, current) {
          return previous.isNewConversation != current.isNewConversation;
        },
        listener: (context, state) {
          if (state.isNewConversation) {
            showAppLoadingDialog(context);
          } else {
            context.router.popForced();
          }
        },
        child: AppBlocWrapperScreen(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: MessagePageHeader(
                  contact: widget.otherParticipantInfo,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: true,
                child: Column(
                  children: [
                    BlocBuilder<MessagingCubit, MessagingState>(
                      builder: (context, state) {
                        MessagingConversation? conversation =
                            state.conversations[widget.conversationId ??
                                messagingCubit.tempConversationId];

                        return conversation == null
                            ? const Spacer()
                            : Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  child: PagedListView<int,
                                      MessagingConversationMessage>(
                                    pagingController: conversation.pagingController!,
                                    shrinkWrap: true,
                                    reverse: true,
                                    builderDelegate: PagedChildBuilderDelegate<MessagingConversationMessage>(
                                      itemBuilder: (context, message, index) {
                                        MessagingConversationMessage?
                                            nextMessage;
                                        if (index != (conversation.pagingController!.itemList!.length - 1)) {
                                          nextMessage = conversation.pagingController?.itemList![index + 1];
                                        }
                                        final userState = context.read<UserCubit>().state;
                                        return Padding(
                                          padding: EdgeInsets.only(top: 10.w),
                                          child: MessagePageChatMsg(
                                              isMyMessage: userState.id == message.authorId,
                                              message: message,
                                              showImage: message.authorId != nextMessage?.authorId,
                                              otherParticipantInfo: widget.otherParticipantInfo
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 24.w,
                        top: 20.w,
                        left: 14.w,
                        right: 14.w,
                      ),
                      child: MessagePageFooter(
                        otherParticipantInfo: widget.otherParticipantInfo,
                        conversationId: widget.conversationId,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
