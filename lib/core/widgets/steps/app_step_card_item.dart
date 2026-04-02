import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/styles/app_colors.dart';
import '../../theme/styles/app_text_style.dart';

class AppStepCardItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isActive;

  const AppStepCardItem({
    super.key,
    required this.imagePath,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          width: double.infinity,
          padding:
              EdgeInsets.only(top: 25.w, bottom: 12.w, right: 4.w, left: 4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: isActive ? AppColors.navyBlue : AppColors.lighterGrey2,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            softWrap: true,
            style: isActive
                ? AppTextStyles.font10WhiteW500
                : AppTextStyles.font10TextW500,
          ),
        ),
        FractionalTranslation(
          translation: const Offset(0.0, -0.5),
          child: Align(
            child: CircleAvatar(
              radius: 27.r,
              backgroundColor:
                  isActive ? AppColors.navyBlue : AppColors.lighterGrey2,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 17.r,
                child: SvgPicture.asset(
                  imagePath,
                  colorFilter: ColorFilter.mode(
                    isActive ? AppColors.goldenOrange : AppColors.textColor,
                    BlendMode.srcIn,
                  ),
                  width: 14.w,
                  height: 14.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
