import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../gen/translations/locale_keys.g.dart';

class ReciterProfileStatistics extends StatelessWidget {
  const ReciterProfileStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 22.w),
      decoration: BoxDecoration(
        boxShadow: AppShadows.blur4BlackOP25,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr(LocaleKeys
                        .student_scheduling_reciterDetails_statistics_students),
                    style: AppTextStyles.font16TextW400,
                  ),
                  10.verticalSpace,
                  Container(
                    width: 90.w,
                    height: 4.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: const Color(0xff25BDE5),
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "76", // written by hand :!
                    style: AppTextStyles.font28TextW600,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr(LocaleKeys
                        .student_scheduling_reciterDetails_statistics_sessions),
                    style: AppTextStyles.font16TextW400,
                  ),
                  10.verticalSpace,
                  Container(
                    width: 90.w,
                    height: 4.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: const Color(0xff25BDE5),
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "923",
                    style: AppTextStyles.font28TextW600,
                  )
                ],
              ),
            ],
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr(LocaleKeys
                        .student_scheduling_reciterDetails_statistics_experience),
                    style: AppTextStyles.font16TextW400,
                  ),
                  10.verticalSpace,
                  Container(
                    width: 90.w,
                    height: 4.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: const Color(0xff25BDE5),
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "7",
                    style: AppTextStyles.font28TextW600,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr(LocaleKeys
                        .student_scheduling_reciterDetails_statistics_attendance),
                    style: AppTextStyles.font16TextW400,
                  ),
                  10.verticalSpace,
                  Container(
                    width: 90.w,
                    height: 4.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: const Color(0xff25BDE5),
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "%100",
                    style: AppTextStyles.font28TextW600,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
