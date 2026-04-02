import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_shadow_container.dart';

class SessionDetailsReciterConfirmationContainer extends StatelessWidget {
  final String stepTitle;
  final String title;
  final String stepNum;
  final Widget child;
  const SessionDetailsReciterConfirmationContainer({
    super.key,
    required this.stepTitle,
    required this.title,
    required this.stepNum,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AppShadowContainer(
      boxShadow: AppShadows.blur8BlackOP25,
      color: AppColors.lighterGrey2,
      padding: EdgeInsets.symmetric(vertical: 38.w, horizontal: 42.w),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.r),
              border: Border.all(
                width: 2,
                color: AppColors.goldenOrange,
              ),
            ),
            child: Text(
              stepNum,
              style: AppTextStyles.font30TextW400,
            ),
          ),
          12.verticalSpace,
          Text(
            context.tr(stepTitle),
            style: AppTextStyles.font12TextW400,
          ),
          36.verticalSpace,
          Text(
            context.tr(title),
            style: AppTextStyles.font20TextW600,
            textAlign: TextAlign.center,
          ),
          child,
        ],
      ),
    );
  }
}
