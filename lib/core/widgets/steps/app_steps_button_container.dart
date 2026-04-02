import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/styles/app_shadows.dart';

class AppStepsButtonContainer extends StatelessWidget {
  final List<Widget> children;
  const AppStepsButtonContainer({super.key, required this.children});

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
      child: Column(
        children: children,
      ),
    );
  }
}
