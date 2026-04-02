import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/base_status.dart';
import '../../../../../core/skeletons/fake_data/reading_progress_fake_data.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_page_title.dart';
import '../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../reciter/khitma_progress/presentation/widgets/reciter_khitma_progress_students_list.dart';
import '../../../../shared/presentation/widgets/reading_progress/reading_progress.dart';
import '../../bloc/reciter_student/reciter_student_cubit.dart';
import '../../bloc/student_progress/student_progress_cubit.dart';
import '../my_programs/my_programs_session_list.dart';

class HomeReciterDashboard extends StatelessWidget {
  const HomeReciterDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const AppPageTitle(title: LocaleKeys.home_dashboard_title),
          45.verticalSpace,
          const AppShadowContainer(
            child: ReciterKhitmaProgressStudentsList(),
          ),
          18.verticalSpace,
          const ReciterReadingProgress(),
        ],
      ),
    );
  }
}

class ReciterReadingProgress extends StatelessWidget {
  final bool withReciterMoreOptions;
  final bool withReadingProgressDetails;
  final bool showReadingProgressTitle;

  const ReciterReadingProgress({
    super.key,
    this.withReciterMoreOptions = false,
    this.withReadingProgressDetails = false,
    this.showReadingProgressTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReciterStudentCubit, ReciterStudentState>(
      builder: (context, reciterStudentState) =>
      reciterStudentState.activeStudentId != -1
          ? AppShadowContainer(
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  BlocBuilder<StudentProgressCubit, StudentProgressState>(
                    builder: (context, state) {
                      final isLoading = state.status is Loading;
                      if (state.status is Loading || state.status is Success) {
                        return Skeletonizer(
                          enabled: isLoading,
                          child: ReadingProgressSection(
                            showReadingProgressTitle: showReadingProgressTitle,
                            withReciterMoreOptions: withReciterMoreOptions,
                            withReadingProgressDetials:
                                withReadingProgressDetails,
                            readingProgress: isLoading
                                ? readingProgressFakeData
                                : state.studentProgress!.readingProgress,
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  35.verticalSpace,
                  BlocBuilder<StudentProgressCubit, StudentProgressState>(
                    builder: (context, state) {
                      return state.status.maybeWhen(
                        orElse: () => const SizedBox(),
                        success: () {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.tr(LocaleKeys
                                    .readingProgress_completedSessions),
                                style: AppTextStyles.font16TextW600,
                              ),
                              20.verticalSpace,
                              Text(
                                context.tr(
                                  LocaleKeys.home_myPrograms_sessionsCompleted,
                                  args: [
                                    state
                                        .studentProgress!.completedSessionsCount
                                        .toString(),
                                    state.studentProgress!.sessions.length
                                        .toString()
                                  ],
                                ),
                              ),
                              MyProgramsSessionList(
                                sessions: state.studentProgress!.sessions,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}
