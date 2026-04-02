import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../theme/styles/app_text_style.dart';

class AppStepsFormText extends StatelessWidget {
  final String text;
  final bool isSubTitle;
  const AppStepsFormText(
      {super.key, required this.text, this.isSubTitle = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(text),
      style: isSubTitle
          ? AppTextStyles.font14TextW400
          : AppTextStyles.font16GoldenOrangeW600,
    );
  }
}
