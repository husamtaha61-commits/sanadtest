import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/entities/base_field.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../core/widgets/chart/app_column_chart.dart';
import '../../../../../core/widgets/chart/chart_data.dart';
import '../../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../domain/entites/student_statistics.dart';

class StudentMyProgressStatisticCard extends StatelessWidget {
  final String title;
  final Color barColor;
  final void Function(BaseField?) onItemSelected;
  final BaseField selectedItem;
  final FutureOr<List<BaseField>> items;
  final List<AverageStatistics> chartValues;

  List<ChartData> _getChartData() {
    late bool isShortList;
    bool isWeekly = selectedItem.id == 1;
    if (isWeekly) {
      isShortList = chartValues.length < 4;
    } else {
      isShortList = chartValues.length < 12;
    }
    final valuesList = isShortList
        ? chartValues
        : chartValues.sublist(
            isWeekly ? chartValues.length - 4 : chartValues.length - 12);

    final chartData = valuesList.map((entry) {

      return ChartData(
        x: isWeekly ? LocaleKeys.student_myProgress_week.tr(args: [entry.intervalLabel]) : entry.intervalLabel,
        y: entry.average,
      );
    }).toList();
    return chartData;
  }

  const StudentMyProgressStatisticCard(
      {super.key,
      required this.title,
      required this.barColor,
      required this.onItemSelected,
      required this.selectedItem,
      required this.items,
      required this.chartValues});

  @override
  Widget build(BuildContext context) {
    final chartData = _getChartData();
    return AppShadowContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  context.tr(title),
                  style: AppTextStyles.font16NavyBlueW600,
                ),
              ),
              10.horizontalSpace,
              Container(
                constraints: BoxConstraints(maxWidth: 120.w),
                child: AppSingleMenu<BaseField>(
                  items: items,
                  itemAsString: (item) => item.name,
                  selectedItem: selectedItem,
                  onItemSelected: onItemSelected,
                  selectedItemName: selectedItem.name,
                  fieldName: '',
                ),
              ),
            ],
          ),
          4.verticalSpace,
          Text(
              chartData.isEmpty
                  ? "0"
                  : (chartData
                              .map((e) => e.y!)
                              .reduce((value, element) => value + element) /
                          (chartData.length))
                      .toStringAsFixed(2),
              style: AppTextStyles.font18TextW600),
          28.verticalSpace,
          AppColumnChart(
            barColor: barColor,
            chartData: chartData,
          ),
        ],
      ),
    );
  }
}
