import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/styles/app_colors.dart';

class AppDivider extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const AppDivider({
    super.key,
     this.width = 103,
     this.height= 6,
     this.borderRadius=8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        color: AppColors.goldenOrange,
      ),
    );
  }
}
