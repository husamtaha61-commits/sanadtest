import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';

class StudentRescheduleSuggestedSessionsItem extends StatelessWidget {
  final int index;
  final TimeData time;
  const StudentRescheduleSuggestedSessionsItem(
      {super.key, required this.index, required this.time});

  @override
  Widget build(BuildContext context) {
    final studentRescheduleRecuuringSessionsCubit =
        context.read<StudentRescheduleSessionsCubit>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0) ...[
                Text(context.tr(LocaleKeys.form_field_day),
                    style: AppTextStyles.font16NavyBlueW400),
                10.verticalSpace,
              ],
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    width: 1.w,
                    color: AppColors.textColor.withOpacity(0.2),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.w),
                child:
                    Text(time.userDayName, style: AppTextStyles.font14TextW400),
              ),
            ],
          ),
        ),
        10.horizontalSpace,
        Padding(
          padding: EdgeInsets.only(bottom: 10.w),
          child: Text("-", style: AppTextStyles.font16TextW400),
        ),
        10.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0) ...[
                Text(context.tr(LocaleKeys.form_field_time),
                    style: AppTextStyles.font16NavyBlueW400),
                10.verticalSpace,
              ],
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    width: 1.w,
                    color: AppColors.textColor.withOpacity(0.2),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.w),
                child: Text(
                  time.userTimeValue,
                  style: AppTextStyles.font14TextW400,
                ),
              ),
            ],
          ),
        ),
        13.horizontalSpace,
        InkWell(
          onTap: () => studentRescheduleRecuuringSessionsCubit
              .deleteSuggestedSession(time),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: const Color(0xffF22D2D),
            ),
            width: 40.w,
            height: 40.w,
            child: SvgPicture.asset(
              Assets.icons.cancel.path,
              width: 12.w,
              height: 12.w,
            ),
          ),
        ),
      ],
    );
  }
}
