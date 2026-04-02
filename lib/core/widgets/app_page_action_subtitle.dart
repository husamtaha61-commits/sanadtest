import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';
import '../theme/styles/app_text_style.dart';
import 'app_curve_back_button.dart';

class AppPageActionSubtitle extends StatelessWidget {
  final String subTitle;
  final bool withPadding;
  final bool isTranslated;

  const AppPageActionSubtitle(
      {super.key,
      required this.subTitle,
      this.withPadding = false,
      this.isTranslated = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: withPadding ? AppPadding.pageTitlteBackBtn : EdgeInsets.zero,
      child: Row(
        children: [
          const AppCurveBackButton(),
          2.horizontalSpace,
          Text(
            _resolveText(context),
            style: AppTextStyles.font16TextW700,
          ),
        ],
      ),
    );
  }

  String _resolveText(BuildContext context) {
    if (isTranslated) return subTitle;
    try {
      // If subTitle is a leaf translation key this will return a String.
      // If a non-leaf key (i.e., a namespace) or wrong type is provided,
      // easy_localization may throw a type error; fall back to raw text.
      return context.tr(subTitle);
    } catch (_) {
      return subTitle;
    }
  }
}
