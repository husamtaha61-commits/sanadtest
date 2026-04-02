import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/styles/app_text_style.dart';

class ActionText extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const ActionText({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: AppTextStyles.font14TextW400
                .copyWith(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
