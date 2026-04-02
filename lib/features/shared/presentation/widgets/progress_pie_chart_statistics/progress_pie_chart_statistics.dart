import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_divider.dart';
import '../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../core/widgets/chart/app_pie_chart.dart';

class ProgressPieChartStatisticsCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final double pieChartWidth;
  final double pieChartHeight;
  final Color pieChartColor;
  final int value;
  const ProgressPieChartStatisticsCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.pieChartWidth,
    required this.pieChartHeight,
    required this.pieChartColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return AppShadowContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Content(
            title: title,
            subTitle: subTitle,
          ),
          10.horizontalSpace,
          AppPieChart(
            width: pieChartWidth,
            height: pieChartHeight,
            color: pieChartColor,
            value: value,
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String title;
  final String subTitle;

  const _Content({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(title),
                style: AppTextStyles.font14BlackW700,
              ),
              4.verticalSpace,
              const AppDivider(
                width: 40,
                height: 3,
              ),
            ],
          ),
          15.verticalSpace,
          Text(
            context.tr(subTitle),
            style: AppTextStyles.font12TextW400OP8,
          )
        ],
      ),
    );
  }
}
