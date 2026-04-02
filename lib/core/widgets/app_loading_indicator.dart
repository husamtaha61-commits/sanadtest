import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/styles/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60.w,
        width: 60.w,
        child: const CircularProgressIndicator(
          color: AppColors.navyBlue,
        ),
      ),
    );
  }
}
