import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';

class AvailableTimesGridTitle extends StatelessWidget {
  final String title;
  const AvailableTimesGridTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.tr(title),
          style: AppTextStyles.font14navyBlueW500,
        ),
        Divider(
          thickness: 7.w,
          color: AppColors.navyBlue,
        ),
      ],
    );
  }
}
