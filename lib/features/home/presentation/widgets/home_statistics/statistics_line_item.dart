import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/styles/app_text_style.dart';

class StatisticsLineItem extends StatelessWidget {
  final String num;
  final String label;
  const StatisticsLineItem({super.key, required this.num, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          num,
          style: MediaQuery.of(context).size.width > 400
              ? AppTextStyles.font40WhiteW600
              : AppTextStyles.font32WhiteW600,
          textAlign: TextAlign.center,
        ),
        5.verticalSpace,
        Text(
          context.tr(label),
          style: AppTextStyles.font15GoldenOrangeW400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
