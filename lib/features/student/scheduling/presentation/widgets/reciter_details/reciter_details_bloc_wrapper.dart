import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/injection.dart';
import '../../../../../../core/utils/snackbar.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../data/models/requests/reciter_available_times_for_limit_specification_request.dart';
import '../../../data/models/requests/reciter_available_times_specification_request.dart';
import '../../../../subscription/presentation/bloc/subscription/subscription_cubit.dart';
import '../../bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../../bloc/reciter_details/reciter_details_cubit.dart';
import '../../bloc/reciter_favorite/reciter_favorite_cubit.dart';
import '../../bloc/student_schedule_session/student_schedule_session_cubit.dart';

class ReciterDetailsBlocWrapper extends StatelessWidget {
  final Widget child;
  final int reciterId;
  final bool isLiveSession;
  const ReciterDetailsBlocWrapper({
    super.key,
    required this.reciterId,
    required this.child,
    this.isLiveSession = false,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<ReciterDetailsCubit>()..getReciterById(reciterId),
        ),
        // API call to get reciter available times
        BlocProvider(
          create: (context) => isLiveSession
              ? (getIt<ReciterAvailableTimesCubit>()
                ..getReciterAvailableTimesForLimit(
                  ReciterAvailableTimesForLimitSpecificationRequest(
                    reciterId: reciterId,
                    limitByDays: 7,
                    includeQuarters: false,
                  ),
                  includesThirds: isLiveSession ? true : false,
                ))
              : (getIt<ReciterAvailableTimesCubit>()
                ..getReciterAvailableTimes(
                  ReciterAvailableTimesSpecificationRequest(
                    reciterId: reciterId,
                  ),
                )),
        ),
        BlocProvider(
          create: (context) => getIt<ReciterFavoriteCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<StudentScheduleSessionCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SubscriptionCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocListener(
            listeners: [
              BlocListener<ReciterFavoriteCubit, ReciterFavoriteState>(
                listener: (context, state) {
                  state.status.whenOrNull(
                    loading: () => showAppLoadingDialog(context),
                    failure: (error) => context.router.popForced(),
                    success: () {
                      context.router.popForced();
                      showSnackBar(
                        context,
                        context.tr(state.msg),
                        SnackBarStatus.success,
                      );
                      BlocProvider.of<ReciterDetailsCubit>(context)
                          .updateReciterIsFavorite(state.isFav);
                    },
                  );
                },
              ),
              BlocListener<StudentScheduleSessionCubit,
                  StudentScheduleSessionState>(
                listener: (context, state) {
                  state.status.whenOrNull(
                    loading: () => showAppLoadingDialog(context),
                    failure: (error) => context.router.maybePop(),
                    success: () {
                      context.router.popForced();
                      showAppModalBottomSheet(
                        mainBtnLabel: LocaleKeys.button_continue,
                        context: context,
                        mainOnPressed: () {
                          navigateToHomePage(context);
                          FacebookAppEvents().logViewContent();
                        },
                        subTitle: LocaleKeys.modalBottomSheet_subTitle_st5,
                        title: LocaleKeys.modalBottomSheet_title_alright,
                        imagePath: Assets.images.sucessPopup.path,
                      );
                    },
                  );
                },
              ),
              BlocListener<SubscriptionCubit, SubscriptionState>(
                listenWhen: (previous, current) =>
                    previous.status != current.status &&
                    previous.subscriptions.length ==
                        current.subscriptions.length,
                listener: (context, state) {
                  if (isLiveSession) {
                    state.status.whenOrNull(
                      success: () {
                        showAppModalBottomSheet(
                          mainBtnLabel: LocaleKeys.button_goToHomePage,
                          context: context,
                          mainOnPressed: () => navigateToHomePage(context),
                          subTitle: LocaleKeys
                              .subscription_testTime_livesessionDescription,
                          title: LocaleKeys
                              .subscription_testTime_liveSessionOption,
                          imagePath: Assets.images.sucessPopup.path,
                        );
                      },
                    );
                  }
                },
              ),
            ],
            child: child,
          );
        },
      ),
    );
  }
}
