import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_page_action_title.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../home/presentation/widgets/my_programs.dart';
import '../../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../../../shared/presentation/widgets/progress_pie_chart_statistics/progress_pie_chart_statistics.dart';
import '../../../rescheduling/presentation/bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../../../rescheduling/presentation/widgets/student_my_schedule/student_my_schedule_calendar.dart';
import '../../domain/entites/statistics_item.dart';
import '../bloc/student_statistics/student_statistics_cubit.dart';
import '../widgets/student_my_progress_statistic_card.dart';
import '../widgets/student_my_progress_statistic_item.dart';

@RoutePage()
class StudentMyProgressPage extends StatelessWidget {
  const StudentMyProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lookUpState = context.read<LookupCubit>().state;
    context.read<StudentMyScheduleCubit>().getMySchedule();
    return BlocProvider(
      create: (context) => getIt<StudentStatisticsCubit>()
        ..initValues(lookUpState.averageIntervals.first)
        ..getStudentStatistics(),
      lazy: false,
      child: AppBlocWrapperScreen(
        child: _StudentMyProgressContent(),
      ),
    );
  }
}

class _StudentMyProgressContent extends StatelessWidget {
  _StudentMyProgressContent();
  final statistics = {
    if (getIt<AppPreferences>().getUserCachedResponse().programId != null &&
        getIt<AppPreferences>().getUserCachedResponse().programId == 2)
      "passedSkills": StatisticsItem(
        imagePath: Assets.icons.circularCheckBlue.path,
        text: LocaleKeys.student_myProgress_NumberOfPassedSkills,
      ),
    if (getIt<AppPreferences>().getUserCachedResponse().programId != null &&
        getIt<AppPreferences>().getUserCachedResponse().programId == 2)
      "unPassedSkills": StatisticsItem(
        imagePath: Assets.icons.circukarWrongBlue.path,
        text: LocaleKeys.student_myProgress_NumberOfUnpassedSkills,
      ),
    "absence": StatisticsItem(
      imagePath: Assets.icons.absence.path,
      text: LocaleKeys.student_myProgress_NumberOfAbsence,
    ),
    "cancelledSessions": StatisticsItem(
      imagePath: Assets.icons.cancelledSession.path,
      text: LocaleKeys.student_myProgress_NumberOfCancelledSessions,
    ),
    "lateness": StatisticsItem(
      imagePath: Assets.icons.lateness.path,
      text: LocaleKeys.student_myProgress_NumberOfLatenessMinutes,
    )
  };

  @override
  Widget build(BuildContext context) {
    final lookUpState = context.read<LookupCubit>().state;
    final studentStatisticsCubit = context.read<StudentStatisticsCubit>();

    return SingleChildScrollView(
      child: Column(
        children: [
          const AppPageActionTitle(
            withPadding: true,
            title: LocaleKeys.student_myProgress_title,
          ),
          64.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const MyPrograms(
              title: LocaleKeys.student_myProgress_title,
            ),
          ),
          44.verticalSpace,
          BlocBuilder<StudentStatisticsCubit, StudentStatisticsState>(
              builder: (context, state) {
            final isLoading = state.status is Loading;
            if (isLoading || state.status is Success) {
              return Skeletonizer(
                enabled: isLoading,
                child: Container(
                  width: double.infinity,
                  color: const Color(0xffF8F9FA),
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 50.w),
                  child: Column(
                    children: [
                      ProgressPieChartStatisticsCard(
                        pieChartColor: AppColors.navyBlue,
                        pieChartHeight: 140,
                        pieChartWidth: 140,
                        subTitle:
                            LocaleKeys.student_myProgress_pagesDescription,
                        title: LocaleKeys.student_myProgress_pages,
                        value: isLoading
                            ? 0
                            : state.studentStatistics!.pagesPercentageProgress,
                      ),
                      24.verticalSpace,
                      ProgressPieChartStatisticsCard(
                        pieChartColor: AppColors.goldenOrange,
                        pieChartHeight: 140,
                        pieChartWidth: 140,
                        subTitle:
                            LocaleKeys.student_myProgress_sessionsDescription,
                        title: LocaleKeys.student_myProgress_sessions,
                        value: isLoading
                            ? 0
                            : state
                                .studentStatistics!.sessionsPercentageProgress,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
          BlocBuilder<StudentStatisticsCubit, StudentStatisticsState>(
            builder: (context, state) {
              final studentStatistics = state.studentStatistics;
              final backendStatistics = {
                if (getIt<AppPreferences>().getUserCachedResponse().programId !=
                        null &&
                    getIt<AppPreferences>().getUserCachedResponse().programId ==
                        2)
                  "passedSkills": studentStatistics?.numberOfPassedSkills ?? 0,
                if (getIt<AppPreferences>().getUserCachedResponse().programId !=
                        null &&
                    getIt<AppPreferences>().getUserCachedResponse().programId ==
                        2)
                  "unPassedSkills":
                      studentStatistics?.numberOfUnpassedSkills ?? 0,
                "absence": studentStatistics?.numberOfAbsence ?? 0,
                "cancelledSessions":
                    studentStatistics?.numberOfCancelledSessions ?? 0,
                "lateness": studentStatistics?.numberOfLatenessMinutes ?? 0,
              };
              final averageOfReadingMinutes =
                  state.studentStatistics?.averageOfReadingMinutes ?? [];
              final averageOfCompletedPages =
                  state.studentStatistics?.averageOfCompletedPages ?? [];

              if (state.status is Loading || state.status is Success) {
                return Skeletonizer(
                  enabled: state.status is Loading,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 50.w),
                          child: Column(
                            children: backendStatistics.entries.map(
                              (entry) {
                                final StatisticsItem item =
                                    statistics[entry.key]!;
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 12.w),
                                  child: StudentMyProgressStatisticItem(
                                    imagePath: item.imagePath,
                                    num: entry.value,
                                    title: item.text,
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        10.verticalSpace,
                        StudentMyProgressStatisticCard(
                          title: LocaleKeys
                              .student_myProgress_AverageOfReadingMinutes,
                          barColor: AppColors.navyBlue,
                          items: lookUpState.averageIntervals
                              .map((e) => e)
                              .toList(),
                          onItemSelected: (value) {
                            studentStatisticsCubit
                                .setReadingMinutesAverageInterval(value);
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              studentStatisticsCubit.getStudentStatistics,
                            );
                          },
                          selectedItem: studentStatisticsCubit
                              .readingMinutesAverageInterval!,
                          chartValues: averageOfReadingMinutes,
                        ),
                        12.verticalSpace,
                        StudentMyProgressStatisticCard(
                          title: LocaleKeys
                              .student_myProgress_AverageOfCompletedPagesInSession,
                          barColor: AppColors.goldenOrange,
                          items: lookUpState.averageIntervals
                              .map((e) => e)
                              .toList(),
                          onItemSelected: (value) {
                            studentStatisticsCubit
                                .setCompletedPagesAverageInterval(value);
                            Future.delayed(
                              const Duration(seconds: 1),
                              studentStatisticsCubit.getStudentStatistics,
                            );
                          },
                          selectedItem: studentStatisticsCubit
                              .completedPagesAverageInterval!,
                          chartValues: averageOfCompletedPages,
                        ),
                        36.verticalSpace,
                        BlocBuilder<StudentMyScheduleCubit,
                            StudentMyScheduleState>(
                          builder: (context, state) => Skeletonizer(
                            enabled: state.status is Loading,
                            child: const StudentMyScheduleCalendar(),
                          ),
                        ),
                        16.verticalSpace
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
