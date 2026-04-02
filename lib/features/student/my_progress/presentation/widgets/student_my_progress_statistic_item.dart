import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../core/theme/styles/app_text_style.dart';

class StudentMyProgressStatisticItem extends StatelessWidget {
  final String imagePath;
  final int num;
  final String title;
  const StudentMyProgressStatisticItem(
      {super.key,
      required this.imagePath,
      required this.num,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        boxShadow: AppShadows.blur2BlackOP25,
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            color: const Color(0xffE5ECF2),
            child: SvgPicture.asset(
              imagePath,
              width: 20.w,
              height: 20.w,
            ),
          ),
          8.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(title),
                style: AppTextStyles.font12navyBlueW400,
              ),
              6.verticalSpace,
              Text(
                num.toString(),
                style: AppTextStyles.font20GoldenOrange600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
