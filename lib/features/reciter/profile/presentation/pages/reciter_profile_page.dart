import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../../core/widgets/app_error_widget.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../../student/scheduling/data/models/requests/reciter_available_times_specification_request.dart';
import '../../../../student/scheduling/presentation/bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../../../../student/scheduling/presentation/bloc/reciter_details/reciter_details_cubit.dart';
import '../widgets/reciter_available_times.dart';
import '../widgets/reciter_profile_content.dart';
import '../widgets/reciter_profile_statistics.dart';

@RoutePage()
class ReciterProfilePage extends StatelessWidget {
  const ReciterProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final reciterId = context.read<UserCubit>().state.id;
    return AppBlocWrapperScreen(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<ReciterDetailsCubit>()..getReciterById(reciterId),
          ),
          BlocProvider(
            create: (context) => getIt<ReciterAvailableTimesCubit>()
              ..getReciterAvailableTimes(
                ReciterAvailableTimesSpecificationRequest(reciterId: reciterId),
              )
              ..getProgramAvailableTimes(),
          ),
        ],
        child: const _ReciterProfileContent(),
      ),
    );
  }
}

class _ReciterProfileContent extends StatelessWidget {
  const _ReciterProfileContent();

  @override
  Widget build(BuildContext context) {
    final reciterId = context.read<UserCubit>().state.id;

    return BlocBuilder<ReciterDetailsCubit, ReciterDetailsState>(
      builder: (context, reciterDetailsState) {
        return BlocBuilder<ReciterAvailableTimesCubit,
            ReciterAvailableTimesState>(
          builder: (context, reciterAvailableTimesState) {
            if (reciterDetailsState.status is Failure ||
                reciterAvailableTimesState is Failure) {
              return AppErrorWidget(
                retryFunc: () {
                  context.read<ReciterDetailsCubit>().getReciterById(reciterId);
                  context
                      .read<ReciterAvailableTimesCubit>()
                      .getReciterAvailableTimes(
                        ReciterAvailableTimesSpecificationRequest(
                          reciterId: reciterId,
                        ),
                      );
                },
              );
            } else {
              final cubit = context.read<ReciterAvailableTimesCubit>();

              return AppCustomScrollView(
                appPageHeader: AppPageHeader.subtitle,
                title: LocaleKeys.student_scheduling_reciterDetails_title,
                bottomChildren: [
                  BlocBuilder<ReciterAvailableTimesCubit,
                      ReciterAvailableTimesState>(builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(27.r),
                            topRight: Radius.circular(27.r),
                          ),
                          boxShadow: AppShadows.blur50BlackOP10OffsetDy4,
                          color: Colors.white),
                      padding: EdgeInsets.symmetric(
                        horizontal: 27.w,
                        vertical: 32,
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          ElevatedButton.icon(
                              onPressed: () async {
                                if (state.isEditingAvailability) {
                                  final didChange =
                                      await cubit.changeReciterAvailability();
                                  cubit.setIsEditingAvailability(false);

                                  await showAppModalBottomSheet(
                                    context: context,
                                    title: didChange
                                        ? LocaleKeys
                                            .modalBottomSheet_title_alright
                                        : LocaleKeys
                                            .modalBottomSheet_title_conflict,
                                    subTitle: didChange
                                        ? LocaleKeys
                                            .modalBottomSheet_subTitle_st14
                                        : LocaleKeys
                                            .modalBottomSheet_subTitle_st15,
                                    mainBtnLabel: didChange
                                        ? LocaleKeys.button_continue
                                        : LocaleKeys.button_requestChange,
                                    mainOnPressed: () {
                                      context.maybePop();
                                      if (!didChange) {
                                        context.router.push(
                                            const ReciterKhitmaProgressRoute());
                                      }
                                    },
                                    secBtnLabel: didChange
                                        ? null
                                        : LocaleKeys.button_cancel,
                                    secOnPressed: didChange
                                        ? null
                                        : context.router.maybePop,
                                    isDismissible: true,
                                    imagePath: Assets.images.questionPopup.path,
                                  );
                                  if (didChange) {
                                    cubit.getReciterAvailableTimes(
                                        ReciterAvailableTimesSpecificationRequest(
                                      reciterId: reciterId,
                                    ));
                                  }
                                } else {
                                  cubit.setIsEditingAvailability(true);
                                }
                              },
                              label: Text(state.isEditingAvailability
                                      ? LocaleKeys.button_save
                                      : LocaleKeys.button_editAvailability)
                                  .tr()),
                          if (state.isEditingAvailability)
                            Padding(
                              padding: EdgeInsets.only(top: 10.w),
                              child: SizedBox(
                                width: double.infinity,
                                child: OutlinedButton.icon(
                                  label:
                                      const Text(LocaleKeys.button_cancel).tr(),
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  onPressed: () {
                                    cubit.setIsEditingAvailability(false);
                                  },
                                ),
                              ),
                            )
                        ],
                      ),
                    );
                  })
                ],
                children: [
                  10.verticalSpace,
                  Skeletonizer(
                    enabled: reciterDetailsState.status is Loading,
                    child: const ReciterProfileContent(),
                  ),
                  16.verticalSpace,
                  const ReciterProfileStatistics(),
                  20.verticalSpace,
                  const ReciterAvailableTimes(),

                  ///
                  18.verticalSpace,
                ],
              );
            }
          },
        );
      },
    );
  }
}
