import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/translations/locale_keys.g.dart';
import '../../theme/styles/app_colors.dart';
import '../../theme/styles/app_text_style.dart';
import '../app_elevated_button.dart';

class AppFilterDrawerActionButtons extends StatelessWidget {
  final void Function() onReset;
  final void Function() onApply;

  const AppFilterDrawerActionButtons(
      {super.key, required this.onReset, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 24.w,
        ),
        child: Row(
          children: [
            Expanded(
              child: AppElevatedButton(
                fixedSize: Size(double.infinity, 40.w),
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide(
                    color: AppColors.navyBlue,
                  ),
                ),
                overlayColor: AppColors.dividerGrey.withAlpha(80),
                onPressed: () {
                  onReset();
                  // Scaffold.of(context).closeEndDrawer();
                },
                child: Text(
                  context.tr(LocaleKeys.button_reset),
                  style: AppTextStyles.font15NavyBlueW400,
                ),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: AppElevatedButton(
                fixedSize: Size(double.infinity, 40.w),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                onPressed: () {
                  onApply();
                  Scaffold.of(context).closeEndDrawer();
                },
                child: Text(
                  context.tr(LocaleKeys.button_apply),
                  style: AppTextStyles.font15WhiteW400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
