import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/entities/time_periods.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../bloc/reciter_listing/reciter_listing_cubit.dart';

class MyAvailableTimesPeriodsGrid extends StatelessWidget {
  final TimePeriods timePeriods;

  const MyAvailableTimesPeriodsGrid({
    super.key,
    required this.timePeriods,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.w, left: 3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(timePeriods.name),
            style: AppTextStyles.font12TextW300,
          ),
          8.verticalSpace,
          Row(
              children: timePeriods.periods.map(
            (period) {
              bool isLast = period.id == timePeriods.periods.last.id;

              return Padding(
                padding: EdgeInsets.only(right: isLast ? 0 : 8.w),
                child: _PeriodItem(
                  period: period,
                ),
              );
            },
          ).toList()),
        ],
      ),
    );
  }
}

class _PeriodItem extends StatelessWidget {
  final Period period;

  const _PeriodItem({
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    final reciterListingCubit = BlocProvider.of<ReciterListingCubit>(context);

    return GestureDetector(
      onTap: () => reciterListingCubit.addTime(period.id),
      child: Container(
        width: 109.w,
        height: 55.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(
              119,
              116,
              132,
              0.4,
            ),
          ),
          borderRadius: BorderRadius.circular(4.r),
          color: reciterListingCubit.selectedPeriods.contains(period.id)
              ? const Color.fromRGBO(182, 198, 201, 0.25)
              : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              period.imagePath,
              width: 18.w,
              height: 18.w,
            ),
            4.verticalSpace,
            Text(
              period.range,
              style: AppTextStyles.font12TextW400.copyWith(
                color: const Color(0xff777484),
              ),
            )
          ],
        ),
      ),
    );
  }
}
