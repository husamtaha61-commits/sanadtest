import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../theme/styles/app_text_style.dart';

class AppStepsContainerText extends StatelessWidget {
  final String text;
  final bool isTitle;

  const AppStepsContainerText(
      {super.key, required this.text, this.isTitle = true});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(text),
      style:
          isTitle ? AppTextStyles.font36TextW700 : AppTextStyles.font14TextW400,
      textAlign: TextAlign.center,
    );
  }
}
