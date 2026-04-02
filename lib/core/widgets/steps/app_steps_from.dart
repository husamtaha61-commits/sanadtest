import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_shadow_container.dart';

class AppStepsForm extends StatelessWidget {
  final Key formKey;
  final Widget child;

  const AppStepsForm({
    super.key,
    required this.formKey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AppShadowContainer(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      child: Form(key: formKey, child: child),
    );
  }
}
