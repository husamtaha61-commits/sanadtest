import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/styles/app_text_style.dart';
import 'app_divider.dart';

class AppPageSubtitle extends StatelessWidget {
  final String title;
  final double dividerWidth;
  const AppPageSubtitle({
    super.key,
    required this.title,
    this.dividerWidth = 128,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(title),
            style: AppTextStyles.font24BlackW700,
          ),
          7.verticalSpace,
          AppDivider(
            width: dividerWidth.w,
            height: 4.w,
          ),
        ],
      ),
    );
  }
}
