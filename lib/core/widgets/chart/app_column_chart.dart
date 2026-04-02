import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../theme/styles/app_text_style.dart';
import 'chart_data.dart';

class AppColumnChart extends StatelessWidget {
  final Color barColor;
  final List<ChartData> chartData;
  const AppColumnChart(
      {super.key, required this.barColor, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return _buildDefaultColumnChart();
  }

  SfCartesianChart _buildDefaultColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        axisLine: const AxisLine(color: Color(0xff8C94AD)),
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        labelStyle: AppTextStyles.font10NavyBlueW400.copyWith(color: barColor),
        initialVisibleMinimum: 0,
        initialVisibleMaximum: 5,
      ),
      primaryYAxis: NumericAxis(
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        labelStyle: AppTextStyles.font10NavyBlueW400.copyWith(color: barColor),
      ),
      zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
      series: _getDefaultColumnSeries(),
    );
  }

  List<ColumnSeries<ChartData, String>> _getDefaultColumnSeries() {
    return <ColumnSeries<ChartData, String>>[
      ColumnSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData sales, _) => sales.x as String,
        yValueMapper: (ChartData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(
          isVisible: false,
          textStyle: TextStyle(fontSize: 10),
        ),
        color: barColor,
        width: 0.5,
        borderRadius: BorderRadius.circular(3.r),
      )
    ];
  }
}
