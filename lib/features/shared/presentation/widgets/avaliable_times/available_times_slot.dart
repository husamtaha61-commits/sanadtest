import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extenstions/string.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/app_date.dart';

class AvailableTimesSlot extends StatelessWidget {
  final bool isSelected;
  final bool isDisabled;
  final String timeValue;
  const AvailableTimesSlot({
    super.key,
    this.isSelected = false,
    this.isDisabled = false,
    required this.timeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 30.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isDisabled
            ? const Color(0xff99a3b0).withAlpha(25)
            : isSelected
                ? AppColors.goldenOrange
                : const Color(0xffE5ECF2),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        timeValue.formatDate(AppDate.HHmm, AppDate.Hmm, localized: true),
        style: isDisabled
            ? TextStyle(
                color: const Color(0xff99a3b0).withAlpha(100),
                fontSize: 15.sp,
              )
            : AppTextStyles.font15NavyBlueW400,
      ),
    );
  }
}
