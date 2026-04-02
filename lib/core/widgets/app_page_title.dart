import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/styles/app_text_style.dart';
import 'app_divider.dart';

class AppPageTitle extends StatelessWidget {
  final String title;
  final bool isTranslated;
  const AppPageTitle(
      {super.key, required this.title, this.isTranslated = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isTranslated ? title : context.tr(title),
          style: AppTextStyles.font28BlackW700,
          textAlign: TextAlign.center,
        ),
        7.verticalSpace,
        const AppDivider(),
      ],
    );
  }
}
