import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entites/home_statistic.dart';
import 'statistics_line_item.dart';

class StatisticsLine extends StatelessWidget {
  final List<HomeStatistic> statistics;
  final int index;
  const StatisticsLine(
      {super.key, required this.statistics, required this.index});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: index != statistics.length - 2 ? 36.w : 0,
        ),
        child: Row(
          children: [
            Expanded(
              child: StatisticsLineItem(
                label: statistics[index].title,
                num: "${statistics[index].num}",
              ),
            ),
            if (index + 1 <
                statistics.length) // Check if there is a next element
              const VerticalDivider(
                color: Colors.white,
                thickness: 1,
              ),
            if (index + 1 <
                statistics.length) // Only add if the next element exists
              Expanded(
                child: StatisticsLineItem(
                  label: statistics[index + 1].title,
                  num: "${statistics[index + 1].num}",
                ),
              ),
          ],
        ),
      ),
    );
  }
}
