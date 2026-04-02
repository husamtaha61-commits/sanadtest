import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_curve_back_button.dart';
import '../bloc/reciter_listing/reciter_listing_cubit.dart';
import '../widgets/my_available_times/my_available_times_periods_grid.dart';
import '../../../../../gen/translations/locale_keys.g.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/steps/app_steps_button.dart';
import '../widgets/my_available_times/my_available_times_days_grid.dart';

@RoutePage()
class MyAvailableTimePage extends StatelessWidget {
  const MyAvailableTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBlocWrapperScreen(
      child: _MyAvailableTimeContent(),
    );
  }
}

class _MyAvailableTimeContent extends StatelessWidget {
  const _MyAvailableTimeContent();

  @override
  Widget build(BuildContext context) {
    final reciterListingCubit = BlocProvider.of<ReciterListingCubit>(context);

    return BlocBuilder<ReciterListingCubit, ReciterListingState>(
      builder: (context, state) {
        return CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: AppPadding.pageTitlteBackBtn,
                    child: const AppCurveBackButton(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr(LocaleKeys
                              .student_scheduling_myAvailableTime_title),
                          style: AppTextStyles.font16TextW700,
                        ),
                        8.verticalSpace,
                        Text(
                          context.tr(LocaleKeys
                              .student_scheduling_myAvailableTime_subTitle),
                          style: AppTextStyles.font14GoldenOrangeW500,
                        ),
                        33.verticalSpace,
                        Text(
                          context.tr(LocaleKeys
                              .student_scheduling_myAvailableTime_days),
                          style: AppTextStyles.font16TextW600,
                        ),
                        8.verticalSpace,
                        MyAvailableTimesDaysGrid(
                          key: UniqueKey(),
                        ),
                        33.verticalSpace,
                        Text(
                          context.tr(LocaleKeys
                              .student_scheduling_myAvailableTime_times),
                          style: AppTextStyles.font16TextW600,
                        ),
                        4.verticalSpace,
                        Text(
                          context.tr(LocaleKeys
                              .student_scheduling_reciterDetails_availableTimes_noteStm2),
                          style: AppTextStyles.font12TextW400OP6,
                        ),
                        12.verticalSpace,
                        ...timePeriodsValues.map(
                          (timePeriods) {
                            return MyAvailableTimesPeriodsGrid(
                              timePeriods: timePeriods,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppStepsButton(
                    icon: Text(
                      context.tr(LocaleKeys.button_continue),
                      style: AppTextStyles.font14WhiteW500,
                    ),
                    label: const SizedBox(),
                    onPressed: () {
                      context.router.maybePop();
                      reciterListingCubit.pagingController.refresh();
                    },
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
