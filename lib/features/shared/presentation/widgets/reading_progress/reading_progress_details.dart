import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extenstions/date_time.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/app_date.dart';
import '../../../../../gen/translations/locale_keys.g.dart';

class ReadingProgressDetails extends StatelessWidget {
  final DateTime khitmaStartDate;
  final DateTime estimatedEndDate;
  final bool showReadingProgressTitle;
  const ReadingProgressDetails({
    super.key,
    required this.khitmaStartDate,
    required this.estimatedEndDate,
    this.showReadingProgressTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showReadingProgressTitle) ...[
          Text(
            context.tr(LocaleKeys.readingProgress_title),
            style: AppTextStyles.font16TextW600,
          ),
          4.verticalSpace,
        ],
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:
                    "${context.tr(LocaleKeys.readingProgress_khitmaStartDate)} ",
                style: AppTextStyles.font12TextW500,
              ),
              TextSpan(
                text: khitmaStartDate.toStr(AppDate.ddMMyyyy, localized: true),
                style: AppTextStyles.font12TextW400,
              )
            ],
          ),
        ),
        10.verticalSpace,
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:
                    "${context.tr(LocaleKeys.readingProgress_estimatedEndDate)} ",
                style: AppTextStyles.font12TextW500,
              ),
              TextSpan(
                text: estimatedEndDate.toStr(AppDate.ddMMyyyy, localized: true),
                style: AppTextStyles.font12TextW400,
              )
            ],
          ),
        ),
      ],
    );
  }
}
