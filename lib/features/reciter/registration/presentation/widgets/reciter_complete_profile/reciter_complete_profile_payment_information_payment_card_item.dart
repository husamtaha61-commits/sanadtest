import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';

class ReciterCompleteProfilePaymentInformationPaymentCardItem
    extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  const ReciterCompleteProfilePaymentInformationPaymentCardItem({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: AppShadows.blur4BlackOP25,
          borderRadius: BorderRadius.circular(8.r),
          border: isActive
              ? Border.all(
                  color: AppColors.goldenOrange,
                  width: 2.w,
                )
              : Border.all(
                  color: Colors.transparent,
                  width: 2.w,
                ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              imagePath,
              width: 20.w,
              height: 20.w,
            ),
            8.verticalSpace,
            SizedBox(
              width: 75.w,
              child: Text(
                label,
                style: AppTextStyles.font14BlackW600,
                softWrap: true,
              ).tr(),
            )
          ],
        ),
      ),
    );
  }
}
