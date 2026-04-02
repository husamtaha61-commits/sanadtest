import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/extenstions/string.dart';
import '../../../../core/models/base_status.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/analytics_service.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/form_fields/app_search_field.dart';
import '../../../../core/widgets/pictures/app_circular_avatar_image.dart';
import '../../../../core/widgets/pictures/app_cirular_nework_image.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../domain/entities/messaging_conversation.dart';
import '../bloc/messaging/messaging_cubit.dart';
import '../bloc/messaging_contact/messaging_contact_cubit.dart';
import '../widgets/skeletons/messages_list_skeleton.dart';

class MessingCenter extends StatefulWidget {
  const MessingCenter({super.key});

  @override
  State<MessingCenter> createState() => _MessingCenterState();
}

class _MessingCenterState extends State<MessingCenter> {
  @override
  void initState() {
    super.initState();
    context.read<MessagingContactCubit>().getContacts();
  }

  @override
  Widget build(BuildContext context) {
    final messagingCubit = context.read<MessagingCubit>();
    return AppBlocWrapperScreen(
      floatingActionButton: const _FloatingActionButton(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.tr(LocaleKeys.messingCenter_title),
                        style: AppTextStyles.font20TextW500,
                      ),
                      const _MenuOptions(),
                    ],
                  ),
                  28.verticalSpace,
                  AppSearchField(
                    onChanged: (p0) => messagingCubit.searchOnConversations(),
                    onFieldSubmitted: (p0) =>
                        messagingCubit.searchOnConversations(),
                    onPressed: messagingCubit.searchOnConversations,
                    textEditingController:
                        messagingCubit.conversationQueryController,
                    iconColor: AppColors.goldenOrange,
                  ),
                  16.verticalSpace,
                ],
              ),
            ),
            BlocBuilder<MessagingCubit, MessagingState>(
              builder: (context, state) => state.isTwilioClientSync
                  ? const _MessagingCenterContent()
                  : const MessagesListSkeleton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuOptions extends StatelessWidget {
  const _MenuOptions();

  @override
  Widget build(BuildContext context) {
    final messagingCubit = context.read<MessagingCubit>();

    return PopupMenuButton(
      icon: SvgPicture.asset(
        Assets.icons.dots.path,
        width: 20.w,
        height: 20.w,
        colorFilter: const ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        ),
      ),
      position: PopupMenuPosition.under,
      splashRadius: 8.r,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          onTap: messagingCubit.markAllConversationsAsRead,
          value: 1,
          child: Text(
            context.tr(LocaleKeys.notificationsActions_markAllAsRead),
            style: AppTextStyles.font14TextW400,
          ),
        ),
      ],
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagingCubit, MessagingState>(
      builder: (context, messagingState) =>
          BlocBuilder<MessagingContactCubit, MessagingContactState>(
        builder: (context, state) => state.status.maybeWhen(
          orElse: () => const SizedBox(),
          success: () {
            return messagingState.status is! Success ||
                    state.contacts.isEmpty ||
                    state.contacts.length == messagingState.conversations.length
                ? const SizedBox()
                : FloatingActionButton(
                    onPressed: () =>
                        context.router.push(const MessagingContactsRoute()),
                    backgroundColor: AppColors.navyBlue,
                    child: const Icon(Icons.message),
                  );
          },
        ),
      ),
    );
  }
}

class _MessagingCenterContent extends StatelessWidget {
  const _MessagingCenterContent();

  Map<String, MessagingConversation> _getFilteredConversations(
    Map<String, MessagingConversation> conversations,
    String query,
  ) {
    final Map<String, MessagingConversation> filteredConversations = {};

    for (var conversation in conversations.values) {
      final contact = conversation.otherParticipantInfo;
      final fullName = [
        contact.firstName,
        contact.middleName ?? "",
        contact.lastName
      ].join(" ");

      if (fullName.toLowerCase().startsWith(query.toLowerCase())) {
        filteredConversations[conversation.id] = conversation;
      }
    }

    return filteredConversations;
  }

  @override
  Widget build(BuildContext context) {
    final messagingCubit = context.read<MessagingCubit>();

    return BlocBuilder<MessagingCubit, MessagingState>(
      builder: (context, state) => state.status.maybeWhen(
        orElse: () => const SizedBox(),
        loading: () => const MessagesListSkeleton(),
        success: () {
          final entries = _getFilteredConversations(
            state.conversations,
            messagingCubit.conversationQueryController.text,
          ).entries.toList();
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entries.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 10.w),
              child: MessageItem(conversation: entries[index].value),
            ),
          );
        },
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final MessagingConversation conversation;
  const MessageItem({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            AnalyticsService.instance.logInAppMessageClicked(conversation.id);
            context
                .read<MessagingCubit>()
                .markAllConversationMessagesAsRead(conversation.id);
            context.router.push(
              MessageRoute(
                conversationId: conversation.id,
                otherParticipantInfo: conversation.otherParticipantInfo,
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.w,
            ),
            color: const Color(0xffF8F9FA),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    conversation.otherParticipantInfo.profileImageUrl != null
                        ? AppCirularNeworkImage(
                            imageId: conversation
                                .otherParticipantInfo.profileImageUrl!,
                            imageSize: 56,
                            memCache: 292,
                          )
                        : const AppCircularAvatarImage(imageSize: 56),
                    16.horizontalSpace,
                    SizedBox(
                      width: 190.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${conversation.otherParticipantInfo.firstName.toCapitalize()} ${conversation.otherParticipantInfo.lastName.toCapitalize()}",
                            style: AppTextStyles.font16TextW500,
                          ),
                          8.verticalSpace,
                          Text(
                            conversation.lastMessage ?? "",
                            style: AppTextStyles.font12TextW400OP6,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (conversation.lastMessageDateCreation != null)
                        Text(
                          timeago.format(conversation.lastMessageDateCreation!,
                              locale: 'custom'),
                          style: AppTextStyles.font12TextW400OP6,
                        ),
                      8.verticalSpace,
                      if (conversation.numberOfUnreadMessages != 0)
                        Container(
                          alignment: Alignment.center,
                          width: 24.w,
                          height: 24.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.w),
                            color: const Color(0xff25BDE5),
                          ),
                          child: Text(
                            conversation.numberOfUnreadMessages.toString(),
                            style: AppTextStyles.font12WhiteW400,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
