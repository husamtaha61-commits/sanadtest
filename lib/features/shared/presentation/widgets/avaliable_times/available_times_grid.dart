import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';

class AvailableTimesGrid extends StatelessWidget {
  final String dayName;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  const AvailableTimesGrid(
      {super.key,
      required this.dayName,
      required this.itemCount,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dayName,
          style: AppTextStyles.font16TextW400OP6,
        ),
        4.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.goldenOrange,
            borderRadius: BorderRadius.circular(100.r),
          ),
          width: 100.w,
          height: 3.5.w,
        ),
        12.verticalSpace,
        AlignedGridView.count(
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 4.w,
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        )
      ],
    );
  }
}
