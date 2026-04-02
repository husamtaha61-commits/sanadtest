import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProgramsSessionLiveIndicator extends StatelessWidget {
  const MyProgramsSessionLiveIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -3.w,
      left: -5.w,
      child: Container(
        width: 10.w,
        height: 10.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          color: Colors.red,
        ),
      ),
    );
  }
}
