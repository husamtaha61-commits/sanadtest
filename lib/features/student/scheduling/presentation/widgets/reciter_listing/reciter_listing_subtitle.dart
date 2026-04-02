import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';

class ReciterListingSubTitle extends StatelessWidget {
  const ReciterListingSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(LocaleKeys.student_scheduling_reciterListing_subTitle),
      style: AppTextStyles.font16TextW600,
    );
  }
}
