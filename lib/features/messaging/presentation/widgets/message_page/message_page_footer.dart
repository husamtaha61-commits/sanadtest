import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/device_manager.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../domain/entities/messaging_contact.dart';
import '../../bloc/messaging/messaging_cubit.dart';

class MessagePageFooter extends StatefulWidget {
  final String? conversationId;
  final MessagingContact? otherParticipantInfo;

  const MessagePageFooter({
    super.key,
    this.otherParticipantInfo,
    this.conversationId,
  });

  @override
  State<MessagePageFooter> createState() => _MessagePageFooterState();
}

class _MessagePageFooterState extends State<MessagePageFooter> {
  bool showSendButton = false;

  @override
  Widget build(BuildContext context) {
    final messagingCubit = context.read<MessagingCubit>();
    return AppTextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      contentPadding: EdgeInsets.symmetric(
        vertical: 18.w,
        horizontal: 12.w,
      ),
      onFieldSubmitted: (p0) {},
      onChanged: (newVal) {
        if (newVal!.isNotEmpty) {
          setState(() => showSendButton = true);
        } else {
          setState(() => showSendButton = false);
        }
      },
      textEditingController: messagingCubit.messageController,
      hintText: context.tr(LocaleKeys.button_typeSomething),
      suffixIcon: showSendButton
          ? IconButton(
              padding: DeviceManager.isTablet(context)
                  ? EdgeInsets.symmetric(horizontal: 12.w)
                  : null,
              onPressed: () {
                messagingCubit.sendMessage(
                  body: messagingCubit.messageController.text,
                  receiverId: widget.otherParticipantInfo?.id,
                  authorId: context.read<UserCubit>().state.id,
                  channelSidOrUniqueName: widget.conversationId ??
                      messagingCubit.tempConversationId,
                );
                messagingCubit.messageController.text = '';
                setState(() => showSendButton = false);
              },
              icon: SvgPicture.asset(
                Assets.icons.send.path,
                width: 24.w,
                height: 24.w,
              ),
            )
          : null,
      // prefixIcon: IconButton(
      //   padding: DeviceManager.isTablet(context)
      //       ? EdgeInsets.symmetric(horizontal: 12.w)
      //       : null,
      //   onPressed: () {},
      //   icon: SvgPicture.asset(
      //     Assets.icons.attach.path,
      //     width: 24.w,
      //     height: 24.w,
      //   ),
      // ),
    );
  }
}
