import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/styles/app_shadows.dart';

class AppStepsButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? icon;
  final Widget label;
  final Color? backgroundColor;

  const AppStepsButton({
    super.key,
    this.onPressed,
    this.icon,
    required this.label,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(27.r),
            topRight: Radius.circular(27.r),
          ),
          boxShadow: AppShadows.blur50BlackOP10OffsetDy4,
          color: Colors.white),
      padding: EdgeInsets.symmetric(
        horizontal: 27.w,
        vertical: 32,
      ),
      width: double.infinity,
      child: ElevatedButton.icon(
        label: label,
        onPressed: onPressed,
        icon: icon,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      ),
    );
  }
}
