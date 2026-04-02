import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/styles/app_text_style.dart';

class AuthFormFooter extends StatelessWidget {
  final String text;
  final String actionText;
  final void Function() onTap;

  const AuthFormFooter(
      {super.key,
      required this.text,
      required this.actionText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: context.tr(text),
              style: AppTextStyles.font12TextW400,
            ),
            TextSpan(
              text: context.tr(actionText),
              style: AppTextStyles.font12NavyBlueW700,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
