import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';

class StudentRescheduleSlotItem extends StatelessWidget {
  final void Function() onTap;
  final bool isSelected;
  final String text;

  const StudentRescheduleSlotItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: BoxConstraints(minWidth: 80.w),
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color:
                isSelected ? AppColors.goldenOrange : const Color(0x18003D7A),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.font12navyBlueW400.copyWith(
                color: isSelected ? Colors.white : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
