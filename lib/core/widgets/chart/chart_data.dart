import 'package:flutter/material.dart';

class ChartData {
  ChartData({this.x, this.y, this.pointColor});

  // Holds x value of the datapoint
  final dynamic x;

  // Holds y value of the datapoint
  final num? y;

  // Holds point color of the datapoint
  final Color? pointColor;
}
