import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/styles/app_colors.dart';

class AppErrorMsg extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  const AppErrorMsg({super.key, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 6.w, top: 6.w),
      child: Text(
        text,
        style: TextStyle(color: AppColors.errorColor, fontSize: 12.sp),
      ),
    );
  }
}
