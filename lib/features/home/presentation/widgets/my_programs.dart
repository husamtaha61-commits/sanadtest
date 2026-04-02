import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/extenstions/string.dart';
import '../../../../core/models/base_status.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/theme/styles/app_shadows.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_shadow_container.dart';
import '../../../../core/widgets/pictures/app_network_image.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../shared/presentation/widgets/reading_progress/reading_progress_details.dart';
import '../../../shared/presentation/widgets/reading_progress/reading_progress_grid.dart';
import '../../../student/rescheduling/presentation/bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../../../student/rescheduling/presentation/pages/student_update_schedule_page.dart';
import '../bloc/SanadMinhaj/sanad_minhaj_progress_cubit.dart';
import '../bloc/student_progress/student_progress_cubit.dart';
import 'meeting_provider.dart';
import 'my_programs/my_programs_session_list.dart';

class MyPrograms extends StatefulWidget {
  final String title;
  const MyPrograms({super.key, required this.title});

  @override
  State<MyPrograms> createState() => _MyProgramsState();
}

class _MyProgramsState extends State<MyPrograms> {
  @override
  void initState() {
    super.initState();
    context.read<StudentMyScheduleCubit>().getMySchedule();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SanadMinhajProgressCubit>().getSanadMinhajProgress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MeetingProvider(
      child: BlocBuilder<StudentProgressCubit, StudentProgressState>(
        builder: (context, state) => state.status.maybeWhen(
          orElse: () => const SizedBox(),
          success: () {
            final studentProgress = state.studentProgress!;
            return Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AppShadowContainer(
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          40.verticalSpace,
                          // Container(
                          //   width: double.infinity,
                          //   padding: EdgeInsets.all(12.w),
                          //   color: const Color(0xff52B332).withOpacity(.37),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       SizedBox(
                          //         width: double.infinity,
                          //         child: Wrap(
                          //           crossAxisAlignment:
                          //               WrapCrossAlignment.center,
                          //           alignment: WrapAlignment.spaceBetween,
                          //           children: [
                          //             Text.rich(
                          //               TextSpan(
                          //                 children: [
                          //                   TextSpan(
                          //                     text: studentProgress
                          //                         .program.programType.name,
                          //                     style:
                          //                         AppTextStyles.font16TextW600,
                          //                   ),
                          //                   TextSpan(
                          //                     text: " (Khitma 1)",
                          //                     style:
                          //                         AppTextStyles.font14TextW400,
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //             Text(
                          //               "View Certificate",
                          //               style: AppTextStyles.font12navyBlueW500
                          //                   .copyWith(
                          //                 decoration: TextDecoration.underline,
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       12.verticalSpace,
                          //       Text(
                          //         "${context.tr(LocaleKeys.readingProgress_recitation)} ${studentProgress.recitations[0].name}",
                          //         style: AppTextStyles.font12navyBlueW400,
                          //       ),
                          //       12.verticalSpace,
                          //       Text(
                          //         "Reciter : Lorem Ipsum",
                          //         style: AppTextStyles.font12navyBlueW500,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // 16.verticalSpace,
                          Text(
                            studentProgress.program.programType.name,
                            style: AppTextStyles.font16TextW600,
                          ),
                          8.verticalSpace,
                          Text(
                            "${context.tr(LocaleKeys.readingProgress_recitation)} ${studentProgress.recitations[0].name}",
                            style: AppTextStyles.font12TextW400,
                          ),
                          20.verticalSpace,
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: AppNetworkImage(
                                  imageId: studentProgress
                                      .reciterInfo.profileImageId,
                                  imageSize: 90,
                                  memCache: 293,
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(12.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: const Color.fromRGBO(
                                        182, 198, 201, 0.1),
                                  ),
                                  child: Text(
                                    "${studentProgress.reciterInfo.firstName.toCapitalize()} ${studentProgress.reciterInfo.lastName.toCapitalize()}",
                                    style: AppTextStyles.font12TextW500OP8
                                        .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          25.verticalSpace,
                          ReadingProgressDetails(
                            khitmaStartDate:
                                studentProgress.readingProgress.khitmaStartDate,
                            estimatedEndDate:
                                studentProgress.readingProgress.khitmaStartDate,
                          ),
                          16.verticalSpace,
                          ReadingProgressGrid(
                            readingProgress: studentProgress.readingProgress,
                          ),
                          34.verticalSpace,
                          BlocBuilder<StudentMyScheduleCubit,
                              StudentMyScheduleState>(
                            builder: (context, state) {
                              return state.status.maybeWhen(
                                orElse: () => const SizedBox(),
                                success: () {
                                  final completedSessionsCount = state
                                      .sessionResponse
                                      .where(
                                        (session) =>
                                            session.status.id ==
                                            SessionStatus.completed.intValue,
                                      )
                                      .length;

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        LocaleKeys
                                            .readingProgress_completedSessions,
                                        style: AppTextStyles.font16TextW600,
                                      ).tr(),
                                      20.verticalSpace,
                                      Text(
                                        context.tr(
                                          LocaleKeys
                                              .home_myPrograms_sessionsCompleted,
                                          args: [
                                            completedSessionsCount.toString(),
                                            state.sessionResponse.length
                                                .toString()
                                          ],
                                        ),
                                      ),
                                      MyProgramsSessionList(
                                          sessions: state.sessionResponse),
                                      BlocBuilder<SanadMinhajProgressCubit,
                                          SanadMinhajProgressState>(
                                        builder: (context, sanadState) {
                                          return sanadState.status.maybeWhen(
                                            success: () {
                                              final sortedCourses =
                                                  sanadState.courses.toList()
                                                    ..sort((a, b) => a.courseId
                                                        .compareTo(b.courseId));

                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  16.verticalSpace,
                                                  Text(
                                                    LocaleKeys
                                                        .home_sanadMinhaj_progress
                                                        .tr(),
                                                    style: AppTextStyles
                                                        .font16TextW600,
                                                  ),
                                                  12.verticalSpace,
                                                  ...sortedCourses
                                                      .map((course) {
                                                    final sessions = sanadState
                                                                .sessionsByCourseId[
                                                            course.courseId] ??
                                                        [];
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(course.courseTitle,
                                                            style: AppTextStyles
                                                                .font16TextW600),
                                                        10.verticalSpace,
                                                        Text(
                                                          context.tr(
                                                            LocaleKeys
                                                                .home_myPrograms_sessionsCompleted,
                                                            args: [
                                                              course
                                                                  .stepsCompleted
                                                                  .toString(),
                                                              course.stepsTotal
                                                                  .toString()
                                                            ],
                                                          ),
                                                        ),
                                                        10.verticalSpace,
                                                        MyProgramsSessionList(
                                                            sessions: sessions,
                                                            isClickable: false),
                                                        20.verticalSpace,
                                                      ],
                                                    );
                                                  }),
                                                ],
                                              );
                                            },
                                            loading: () => const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            failure: (error) =>
                                                Text(error ?? "Error"),
                                            orElse: () => const SizedBox(),
                                          );
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -36.w,
                      left: 30.w,
                      child: Container(
                        width: 73.w,
                        height: 73.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: AppShadows.blur4BlackOP25,
                        ),
                        child: SvgPicture.asset(
                          Assets.images.logo.path,
                          width: 48.w,
                          height: 48.w,
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                AppElevatedButton(
                  child: Text(
                    context.tr(LocaleKeys.button_updateSchedule),
                  ),
                  onPressed: () => context.router.pushWidget(
                    BlocBuilder<StudentMyScheduleCubit, StudentMyScheduleState>(
                      builder: (context, state) {
                        if (state.status is Success) {
                          return const StudentUpdateSchedulePage();
                        } else {
                          return const AppBlocWrapperScreen(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    AppElevatedButton(
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      backgroundColor: const Color(0xffE5ECF2),
                      fixedSize: Size.fromWidth(50.w),
                      child: SvgPicture.asset(
                        Assets.icons.quran.path,
                        width: 20.w,
                        height: 20.w,
                      ),
                      onPressed: () => context.router.push(FullRoute(
                        url: AppConfig.shared.quranPageUrl,
                      )),
                    ),
                    5.horizontalSpace,
                    if (getIt<AppPreferences>()
                            .getUserCachedResponse()
                            .programId ==
                        2)
                      Expanded(
                        child: AppElevatedButton(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          backgroundColor: const Color(0xffE5ECF2),
                          child: Text(
                            LocaleKeys.button_skillsAndNotes,
                            style: AppTextStyles.font15NavyBlueW400,
                          ).tr(),
                          onPressed: () => context.router.push(SkillsNotesRoute(
                              studentId: context.read<UserCubit>().state.id)),
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
