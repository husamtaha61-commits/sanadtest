import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSliverSizedBox extends StatelessWidget {
  final double height;
  const AppSliverSizedBox({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height.w,
      ),
    );
  }
}
