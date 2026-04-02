import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extenstions/date_time.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_expansion_tile.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../session_details/domain/entites/note.dart';

class NotesListItem extends StatefulWidget {
  final Note note;
  final bool isAuthoredByMe;
  const NotesListItem({
    super.key,
    required this.note,
    this.isAuthoredByMe = false,
  });

  @override
  State<NotesListItem> createState() => _NotesListItemState();
}

class _NotesListItemState extends State<NotesListItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final verseKey = widget.note.verseKey;
    final verse = verseKey.isNotEmpty ? verseKey[verseKey.length - 1] : '';

    return AppExpansionTile(
      onExpansionChanged: (bool expanded) =>
          setState(() => isExpanded = expanded),
      collapsedBackgroundColor: widget.isAuthoredByMe
          ? const Color(0xffFFE49E)
          : AppColors.lighterGrey2,
      backgroundColor: widget.isAuthoredByMe
          ? const Color(0xffFFE49E)
          : AppColors.lighterGrey2,
      childrenPadding: EdgeInsets.symmetric(horizontal: 10.w),
      tilePadding: EdgeInsets.symmetric(horizontal: 10.w),
      collapsedIconColor:
          widget.isAuthoredByMe ? AppColors.navyBlue : AppColors.goldenOrange,
      iconColor:
          widget.isAuthoredByMe ? AppColors.navyBlue : AppColors.goldenOrange,
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      title: Row(
        children: [
          Text(
            widget.note.surahName,
            style: AppTextStyles.font12TextW600,
          ),
          12.horizontalSpace,
          Text(
            "${context.tr(LocaleKeys.readingProgress_verse).toLowerCase()} $verse",
            style: widget.isAuthoredByMe
                ? AppTextStyles.font12navyBlueW400
                : AppTextStyles.font12GoldenOrangeW400,
          ),
          const Spacer(),
          if (!isExpanded)
            _NoteDateTime(
                isAuthoredByMe: widget.isAuthoredByMe,
                creationDate: widget.note.creationDate)
        ],
      ),
      children: [
        Text(
          widget.note.text,
          style: AppTextStyles.font12TextW400OP8,
        ),
        25.verticalSpace,
        if (isExpanded)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppElevatedButton(
                onPressed: () => context.router.push(
                  SessionDetailsRoute(sessionId: widget.note.sessionId),
                ),
                fixedSize: const Size.fromWidth(double.infinity),
                child: Text(context.tr(LocaleKeys.button_goToSession)),
              ),
              _NoteDateTime(
                isAuthoredByMe: widget.isAuthoredByMe,
                creationDate: widget.note.creationDate,
              )
            ],
          ),
        12.verticalSpace
      ],
    );
  }
}

class _NoteDateTime extends StatelessWidget {
  final DateTime creationDate;
  final bool isAuthoredByMe;
  const _NoteDateTime(
      {required this.isAuthoredByMe, required this.creationDate});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextStyles.font10NavyBlueW300,
        children: [
          TextSpan(
            text: creationDate.toStr('EEE d MMM', localized: true),
          ),
          TextSpan(
              text: "  |  ",
              style: TextStyle(
                  color: isAuthoredByMe
                      ? AppColors.navyBlue
                      : AppColors.goldenOrange)),
          TextSpan(
            text: creationDate.toStr('h:mm a', localized: true),
          ),
        ],
      ),
    );
  }
}
