import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../gen/translations/locale_keys.g.dart';

class ReadingProgressTitle extends StatelessWidget {
  const ReadingProgressTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(LocaleKeys.readingProgress_title),
      style: AppTextStyles.font16TextW600,
    );
  }
}
