import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/styles/app_text_style.dart';

class MenuSectionTile extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Widget? icon;
  const MenuSectionTile(
      {super.key, required this.title, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 32.w),
        width: double.infinity,
        child: Row(
          children: [
            if (icon != null) ...[
              icon!,
              12.horizontalSpace,
            ],
            Text(
              context.tr(title),
              style: AppTextStyles.font18TextW500,
            ),
          ],
        ),
      ),
    );
  }
}
