import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_page_title.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../domain/entites/home_section.dart';
import '../bloc/home_sections/home_sections_cubit.dart';
import '../bloc/student_progress/student_progress_cubit.dart';
import 'home_announcements.dart';
import 'home_global_reciters_section.dart';
import 'home_quran_recitation.dart';
import 'home_slider.dart';
import 'my_programs.dart';
import 'home_our_programs.dart';
import 'home_self_learning.dart';
import 'week_sessions.dart';

class HomeStudent extends StatefulWidget {
  const HomeStudent({super.key});

  @override
  State<HomeStudent> createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudent> {
  @override
  void initState() {
    super.initState();

    final state = context.read<UserCubit>().state;
    if (state.hasActiveSchedule) {
      context.read<StudentProgressCubit>().getStudentProgress(state.id);
    }
    context.read<HomeSectionsCubit>().getHomeSections();
  }

  Widget _buildSectionWidget(SectionType sectionType, bool hasActiveSchedule) {
    switch (sectionType) {
      case SectionType.slider:
        return Column(
          children: [
            const HomeSlider(),
            55.verticalSpace,
          ],
        );
      case SectionType.dashboard:
        return const SizedBox.shrink();

      case SectionType.announcement:
        return Column(
          children: [
            const HomeAnnouncements(),
            46.verticalSpace,
          ],
        );
      case SectionType.progress:
        if (!hasActiveSchedule) return const SizedBox.shrink();
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  const AppPageTitle(
                    title: LocaleKeys.student_myProgress_title,
                  ),
                  64.verticalSpace,
                  const MyPrograms(
                    title: LocaleKeys.home_myPrograms_title,
                  )
                ],
              ),
            ),
            50.verticalSpace,
          ],
        );
      case SectionType.session:
        return Column(
          children: [
            const WeekSessions(),
            20.verticalSpace,
          ],
        );
      case SectionType.program:
        return Column(
          children: [
            Column(
              children: [
                const AppPageTitle(title: LocaleKeys.home_ourPrograms_title),
                15.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    context.tr(LocaleKeys.home_ourPrograms_description),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font12TextW400,
                  ),
                ),
                20.verticalSpace,
                const HomeOurPrograms(),
              ],
            ),
            50.verticalSpace,
          ],
        );
      case SectionType.selfLearning:
        return Column(
          children: [
            const HomeSelfLearning(),
            55.verticalSpace,
          ],
        );
      case SectionType.recitation:
        return Column(
          children: [
            const HomeQuranRecitation(),
            30.verticalSpace,
          ],
        );
      case SectionType.statistics:
        return Column(
          children: [
            const HomeGlobalRecitersSection(),
            40.verticalSpace,
          ],
        );
    }
  }

  Widget _buildDefaultLayout(bool hasActiveSchedule) {
    return Column(
      children: [
        const HomeSlider(),
        55.verticalSpace,
        const HomeGlobalRecitersSection(),
        40.verticalSpace,
        const HomeAnnouncements(),
        46.verticalSpace,
        if (hasActiveSchedule) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                const AppPageTitle(
                  title: LocaleKeys.student_myProgress_title,
                ),
                64.verticalSpace,
                const MyPrograms(
                  title: LocaleKeys.home_myPrograms_title,
                )
              ],
            ),
          ),
        ],
        50.verticalSpace,
        const WeekSessions(),
        20.verticalSpace,
        Column(
          children: [
            const AppPageTitle(title: LocaleKeys.home_ourPrograms_title),
            15.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                context.tr(LocaleKeys.home_ourPrograms_description),
                textAlign: TextAlign.center,
                style: AppTextStyles.font12TextW400,
              ),
            ),
            20.verticalSpace,
            const HomeOurPrograms(),
          ],
        ),
        50.verticalSpace,
        const HomeSelfLearning(),
        55.verticalSpace,
        const HomeQuranRecitation(),
        30.verticalSpace,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasActiveSchedule = context.read<UserCubit>().state.hasActiveSchedule;

    return BlocBuilder<HomeSectionsCubit, HomeSectionsState>(
      builder: (context, state) {
        final isLoading = state.status.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final sectionOrder = state.status.maybeWhen(
          success: () => context.read<HomeSectionsCubit>().getSectionOrder(),
          orElse: () => <SectionType>[],
        );
        if (isLoading || sectionOrder.isEmpty) {
          return _buildDefaultLayout(hasActiveSchedule);
        }

        return Column(
          children: [
            ...sectionOrder.map((sectionType) =>
                _buildSectionWidget(sectionType, hasActiveSchedule)),
          ],
        );
      },
    );
  }
}
