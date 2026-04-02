import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_shadow_container.dart';
import 'auth_form_text.dart';

class AuthForm extends StatelessWidget {
  final Key formKey;
  final List<Widget> children;
  final String title;
  final TextStyle? titleStyle;
  const AuthForm(
      {super.key,
      required this.formKey,
      required this.children,
      required this.title,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return AppShadowContainer(
      padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AuthFormText(
              text: title,
              style: titleStyle,
            ),
            ...children
          ],
        ),
      ),
    );
  }
}
