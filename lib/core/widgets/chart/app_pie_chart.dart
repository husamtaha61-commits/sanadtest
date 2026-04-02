import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../theme/styles/app_text_style.dart';
import 'chart_data.dart';

class AppPieChart extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final int value;
  const AppPieChart({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width.w,
        height: height.w,
        child: SfCircularChart(
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
              widget: Text(
                '%$value',
                style: AppTextStyles.font24NavyBlueW700.copyWith(color: color),
              ),
            ),
          ],
          series: _getElevationDoughnutSeries(value),
        ),
      ),
    );
  }

  List<DoughnutSeries<ChartData, String>> _getElevationDoughnutSeries(
      int value) {
    return <DoughnutSeries<ChartData, String>>[
      DoughnutSeries<ChartData, String>(
        radius: "100%",
        innerRadius: "74%",
        dataSource: <ChartData>[
          ChartData(
            x: 'B',
            y: 100,
            pointColor: const Color(0xffE5ECF2),
          ),
        ],
        animationDuration: 0,
        xValueMapper: (ChartData data, _) => data.x as String,
        yValueMapper: (ChartData data, _) => data.y,
        pointColorMapper: (ChartData data, _) => data.pointColor,
        cornerStyle: CornerStyle.bothFlat,
      ),
      DoughnutSeries<ChartData, String>(
        radius: "100%",
        innerRadius: "74%",
        dataSource: <ChartData>[
          ChartData(
            x: 'A',
            y: value,
            pointColor: value == 0 ? const Color(0xffE5ECF2) : color,
          ),
          ChartData(
            x: 'B',
            y: 100 - value,
            pointColor: const Color(0xffE5ECF2),
          )
        ],
        animationDuration: 0,
        xValueMapper: (ChartData data, _) => data.x as String,
        yValueMapper: (ChartData data, _) => data.y,
        pointColorMapper: (ChartData data, _) => data.pointColor,
        cornerStyle: CornerStyle.bothCurve,
      ),
    ];
  }
}
