import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/theme/styles/app_shadows.dart';

class ReciterDetailsActionIcon extends StatelessWidget {
  final String imagePath;
  final Function() onTap;
  final Color color;
  const ReciterDetailsActionIcon({
    super.key,
    required this.imagePath,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35.w,
        height: 35.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: AppShadows.blur4BlackOP25,
        ),
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            width: 16.w,
            height: 16.w,
          ),
        ),
      ),
    );
  }
}
