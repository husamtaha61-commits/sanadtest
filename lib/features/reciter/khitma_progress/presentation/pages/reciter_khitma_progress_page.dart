import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_page_action_title.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../home/presentation/bloc/reciter_student/reciter_student_cubit.dart';
import '../../../../home/presentation/widgets/home_reciter/home_reciter_dashboard.dart';
import '../../../../shared/presentation/widgets/progress_pie_chart_statistics/progress_pie_chart_statistics.dart';
import '../../../../student/my_progress/domain/entites/statistics_item.dart';
import '../../../../student/my_progress/presentation/widgets/skeletons/student_my_progress_statistic_list_skeleton.dart';
import '../../../../student/my_progress/presentation/widgets/student_my_progress_statistic_item.dart';
import '../../../../student/rescheduling/presentation/bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../../../../student/rescheduling/presentation/widgets/student_my_schedule/student_my_schedule_calendar.dart';
import '../bloc/reciter_statistics/reciter_statistics_cubit.dart';
import '../widgets/reciter_khitma_progress_students_list.dart';

@RoutePage()
class ReciterKhitmaProgressPage extends StatefulWidget {
  const ReciterKhitmaProgressPage({super.key});

  @override
  State<ReciterKhitmaProgressPage> createState() => _ReciterKhitmaProgressPageState();
}

class _ReciterKhitmaProgressPageState extends State<ReciterKhitmaProgressPage> {
  @override
  void initState() {
    super.initState();
    context.read<ReciterStudentCubit>().getAllReciterStudents();
    context.read<StudentMyScheduleCubit>().getMySchedule();
  }

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: BlocProvider(
        create: (context) =>
            getIt<ReciterStatisticsCubit>()..getReciterStatistics(),
        child: const _ReciterKhitmaProgressContent(),
      ),
    );
  }
}

class _ReciterKhitmaProgressContent extends StatelessWidget {
  const _ReciterKhitmaProgressContent();

  @override
  Widget build(BuildContext context) {
    final statistics = {
      "numberOfKhitmat": StatisticsItem(
        imagePath: Assets.icons.khitmat.path,
        text: LocaleKeys.reciter_khitmaProgress_numberOfKhitmat,
      ),
      "numberOfAbsence": StatisticsItem(
        imagePath: Assets.icons.absence.path,
        text: LocaleKeys.reciter_khitmaProgress_numberOfAbsence,
      ),
      "numberOfSuspendedKhitmat": StatisticsItem(
        imagePath: Assets.icons.suspence.path,
        text: LocaleKeys.reciter_khitmaProgress_numberOfSuspendedKhitmat,
      ),
    };

    return SingleChildScrollView(
      child: Column(
        children: [
          const AppPageActionTitle(
            title: LocaleKeys.reciter_khitmaProgress_title,
            withPadding: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                40.verticalSpace,
                const ReciterKhitmaProgressStudentsList(),
                24.verticalSpace,
                const ReciterReadingProgress(
                  showReadingProgressTitle: false,
                  withReciterMoreOptions: true,
                  withReadingProgressDetails: true,
                ),
                24.verticalSpace,
                BlocBuilder<ReciterStatisticsCubit, ReciterStatisticsState>(
                  builder: (context, state) {
                    final isLoading = state.status is Loading;
                    if (isLoading) {
                      return const Skeletonizer(
                        enabled: true,
                        child: StudentMyProgressStatisticListSkeleton(),
                      );
                    }
                    if (state.status is Success) {
                      final reciterStatistics = state.reciterStatistics!;
                      final backendStatistics = {
                        "numberOfKhitmat": reciterStatistics.numberOfKhitmat,
                        "numberOfAbsence": reciterStatistics.numberOfAbsence,
                        "numberOfSuspendedKhitmat":
                            reciterStatistics.numberOfSuspendedKhitmat,
                      };

                      return Column(
                        children: backendStatistics.entries.map(
                          (entry) {
                            final StatisticsItem item = statistics[entry.key]!;
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
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
          36.verticalSpace,
          BlocBuilder<ReciterStatisticsCubit, ReciterStatisticsState>(
            builder: (context, state) => state.status.maybeWhen(
              orElse: () => const SizedBox(),
              success: () => Container(
                width: double.infinity,
                color: const Color(0xffF8F9FA),
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 50.w),
                child: Column(
                  children: [
                    ProgressPieChartStatisticsCard(
                      pieChartColor: AppColors.navyBlue,
                      pieChartHeight: 140,
                      pieChartWidth: 140,
                      subTitle: LocaleKeys
                          .reciter_khitmaProgress_completedSessionsDescription,
                      title:
                          LocaleKeys.reciter_khitmaProgress_completedSessions,
                      value:
                          state.reciterStatistics!.completedSessionsPercentage,
                    ),
                    24.verticalSpace,
                    ProgressPieChartStatisticsCard(
                      pieChartColor: AppColors.goldenOrange,
                      pieChartHeight: 140,
                      pieChartWidth: 140,
                      subTitle: LocaleKeys.reciter_khitmaProgress_availableTimeDescription,
                      title: LocaleKeys.reciter_khitmaProgress_availableTime,
                      value: state.reciterStatistics!.availableTimesPercentage,
                    )
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<StudentMyScheduleCubit, StudentMyScheduleState>(
            builder: (context, state) => Skeletonizer(
              enabled: state.status is Loading,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.w),
                child: const StudentMyScheduleCalendar(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
