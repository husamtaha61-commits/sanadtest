import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/extenstions/date_time.dart';
import '../../../../../core/extenstions/string.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/pictures/app_circular_avatar_image.dart';
import '../../../../../core/widgets/pictures/app_cirular_nework_image.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../domain/entities/messaging_contact.dart';
import '../../../domain/entities/messaging_conversation_message.dart';

class MessagePageChatMsg extends StatefulWidget {
  final bool isMyMessage;
  final bool showImage;
  final MessagingConversationMessage message;
  final MessagingContact otherParticipantInfo;
  const MessagePageChatMsg(
      {super.key,
      required this.isMyMessage,
      required this.showImage,
      required this.message,
      required this.otherParticipantInfo});

  @override
  State<MessagePageChatMsg> createState() => _MessagePageChatMsgState();
}

class _MessagePageChatMsgState extends State<MessagePageChatMsg> {
  bool showTime = false;

  Widget getImage() {
    final String? image;
    if (widget.isMyMessage) {
      image = context.read<UserCubit>().state.profileImageUrl;
    } else {
      image = widget.otherParticipantInfo.profileImageUrl;
    }
    return GestureDetector(
      onTap: () {
        if (!widget.isMyMessage) {
          if (isStudentRole(context)) {
            context.router.push(
              ReciterDetailsRoute(
                reciterId: widget.otherParticipantInfo.id,
              ),
            );
          } else {
            context.router.push(StudentProfileRoute(
              fromStudentSide: false,
              studentId: widget.otherParticipantInfo.id,
            ));
          }
        }
      },
      child: image != null
          ? AppCirularNeworkImage(imageId: image, imageSize: 38, memCache: 292)
          : const AppCircularAvatarImage(imageSize: 38),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: widget.isMyMessage ? TextDirection.rtl : TextDirection.ltr,
      children: [
        if (widget.showImage) ...[
          getImage(),
          16.horizontalSpace,
        ] else
          54.horizontalSpace,
        Flexible(
          child: Column(
            crossAxisAlignment: widget.isMyMessage == !getIt<AppPreferences>().isAr
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  showTime = !showTime;
                }),
                onDoubleTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: widget.isMyMessage
                            ? AppColors.navyBlue
                            : const Color(0xffF1F8F9),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          TextSelectionTheme(
                            data: TextSelectionThemeData(
                              selectionColor: widget.isMyMessage
                                  ? AppColors.goldenOrange.withAlpha(170) : null,
                              selectionHandleColor: widget.isMyMessage
                                  ? AppColors.goldenOrange : null,
                            ),
                            child: SelectableText.rich(
                              TextSpan(
                                children: (widget.message.body ?? "")
                                    .extractTypes()
                                    .map((type) {
                                      if(type is Plain) {
                                        return TextSpan(text: type.value);
                                      }
                                      return TextSpan(
                                        text: type.value,
                                        recognizer: TapGestureRecognizer()..onTap =
                                            () => openUrl(type.value),
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: widget.isMyMessage ? AppColors.goldenOrange : Colors.black
                                        ),
                                      );
                                }).toList()
                              ),
                              style: widget.isMyMessage
                                  ? AppTextStyles.font15WhiteW300
                                  : AppTextStyles.font15TextW300,
                              onTap: () => setState(() {
                                showTime = !showTime;
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.isMyMessage) ...[
                      Icon(
                        Icons.done_all,
                        color: widget.message.isRead!
                            ? AppColors.goldenOrange
                            : AppColors.dividerGrey,
                        size: 16.w,
                      ),
                    ]
                  ],
                ),
              ),
              4.verticalSpace,
              if (showTime && widget.message.dateCreation != null)
                Text(
                  widget.message.dateCreation!.toStr("dd/MM/yyyy  |  hh:mm a", localized: true),
                  // timeago.format(widget.message.dateCreation!,
                  //     locale: 'custom'),
                  style: AppTextStyles.font12TextW300,
                )
            ],
          ),
        ),
      ],
    );
  }
}


