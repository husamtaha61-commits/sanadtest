import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
import '../theme/styles/app_colors.dart';

class AppFilterBoxProperties extends StatelessWidget {
  const AppFilterBoxProperties({
    super.key,
    this.showBorder = true,
    this.iconSize = 20,
    this.iconColor
  });

  final bool showBorder;
  final double iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: showBorder ? AppColors.textColor.withAlpha(50) : Colors.transparent,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: IconButton(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        onPressed: Scaffold.of(context).openEndDrawer,
        icon: SvgPicture.asset(
          Assets.icons.filters.path,
          width: iconSize.w,
          height: iconSize.w,
          colorFilter:iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
        ),
      ),
    );
  }
}
