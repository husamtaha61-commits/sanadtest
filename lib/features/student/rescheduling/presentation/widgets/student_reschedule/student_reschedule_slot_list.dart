import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StudentRescheduleSlotList extends StatelessWidget {
  final bool isLoading;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const StudentRescheduleSlotList({
    super.key,
    required this.isLoading,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
        height: 30.w,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
