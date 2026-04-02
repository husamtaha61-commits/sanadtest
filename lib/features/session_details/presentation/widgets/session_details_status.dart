import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/extenstions/date_time.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_shadow_container.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../domain/entites/session_details.dart';

class SessionDetailsStatus extends StatelessWidget {
  final SessionDetails sessionDetails;
  const SessionDetailsStatus({super.key, required this.sessionDetails});

  @override
  Widget build(BuildContext context) {
    final sessionStatus = [
      _StatusItem(
        imagePath: Assets.icons.dateTime.path,
        label: LocaleKeys.sessionDetails_sessionDateTime,
        value: sessionDetails.sessionDateTime.toStr('EEEE d MMM yy - h:mm a', localized: true),
      ),
      _StatusItem(
        imagePath: Assets.icons.sessionTime.path,
        label: LocaleKeys.sessionDetails_sessionDuration,
        value: sessionDetails.durationInMin == -1 ? LocaleKeys.sessionDetails_inProgress.tr() :
        "${context.tr(LocaleKeys.times_minutes)} ${sessionDetails.durationInMin}",
      ),
      _StatusItem(
        imagePath: Assets.icons.pages.path,
        label: LocaleKeys.sessionDetails_pages,
        value:
            "${context.tr(LocaleKeys.times_from)} ${sessionDetails.startPage} ${context.tr(LocaleKeys.times_to)} ${sessionDetails.endPage}",
      ),
      _StatusItem(
        imagePath: Assets.icons.sessionStatus.path,
        label: LocaleKeys.sessionDetails_sessionStatus,
        value: sessionDetails.status.name,
      ),
      _StatusItem(
        imagePath: Assets.icons.sessionQuran.path,
        label: LocaleKeys.sessionDetails_numberOfPages,
        value:
            "${context.tr(LocaleKeys.sessionDetails_pages)} ${sessionDetails.endPage - sessionDetails.startPage + 1}",
      ),
      // _StatusItem(
      //   imagePath: Assets.icons.bookmarks.path,
      //   label: LocaleKeys.sessionDetails_bookmarkVerse,
      //   value: 'Surah Al-Kahf, Verse 8',
      // ),
    ];

    return AppShadowContainer(
      child: AlignedGridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 40.w,
        itemCount: sessionStatus.length,
        itemBuilder: (context, index) {
          return sessionStatus[index];
        },
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final String value;
  const _StatusItem(
      {required this.imagePath, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          imagePath,
          width: 39.w,
          height: 39.w,
        ),
        16.verticalSpace,
        Text(context.tr(label),
            style: AppTextStyles.font16TextW600, textAlign: TextAlign.center),
        4.verticalSpace,
        Text(value,
            style: AppTextStyles.font12TextW400OP8, textAlign: TextAlign.center)
      ],
    );
  }
}
