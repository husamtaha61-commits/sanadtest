import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/styles/app_shadows.dart';

class AppShadowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final double? height;
  final bool infinityWidth;
  final Clip clipBehavior;
  final List<BoxShadow>? boxShadow;
  final Color? color;

  const AppShadowContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.decoration,
    this.height,
    this.boxShadow,
    this.color,
    this.infinityWidth = true,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clipBehavior,
      width: infinityWidth ? double.infinity : null,
      margin: margin,
      height: height,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.w),
      decoration: decoration ??
          BoxDecoration(
            boxShadow: boxShadow ?? AppShadows.blur4BlackOP25,
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
      child: child,
    );
  }
}
