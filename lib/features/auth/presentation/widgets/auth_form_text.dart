import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/styles/app_text_style.dart';

class AuthFormText extends StatelessWidget {
  final String text;
  final bool isSubTitle;
  final TextStyle? style;

  const AuthFormText(
      {super.key, required this.text, this.style, this.isSubTitle = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(text),
      style: style ??
          (isSubTitle
              ? AppTextStyles.font12TextW400OP8
              : AppTextStyles.font24TextW700),
      textAlign: TextAlign.center,
    );
  }
}
