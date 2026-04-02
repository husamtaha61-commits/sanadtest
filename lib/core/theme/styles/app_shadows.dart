import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppShadows {
  static List<BoxShadow> blur50BlackOP10OffsetDy4 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 50.r,
      offset: const Offset(0, -4),
    )
  ];

  static List<BoxShadow> blur30BlackOP06ffsetDy12 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 30.r,
      offset: const Offset(0, -12),
    )
  ];

  static List<BoxShadow> blur4BlackOP25 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 4.r,
    )
  ];

  static List<BoxShadow> blur2BlackOP25 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 2.r,
    )
  ];

    static List<BoxShadow> blur8BlackOP25 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 8.r,
    )
  ];

  static List<BoxShadow> blur12GoldenOrangeOP25 = [
    BoxShadow(
      color: AppColors.goldenOrange.withOpacity(0.25),
      blurRadius: 12.r,
    )
  ];
}
