import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/admin_config_manager.dart';
import '../../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../../core/widgets/app_error_widget.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../home/presentation/bloc/programs/program_cubit.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../rescheduling/presentation/bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../../../subscription/data/models/responses/get_student_subscribition_response.dart';
import '../../../subscription/presentation/bloc/subscription/subscription_cubit.dart';
import '../../data/models/requests/reciter_available_times_for_limit_specification_request.dart';
import '../../data/models/requests/reciter_available_times_specification_request.dart';
import '../bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../bloc/student_schedule_session/student_schedule_session_cubit.dart';
import '../widgets/reciter_details/reciter_details_available_times.dart';
import '../widgets/reciter_details/reciter_details_bloc_wrapper.dart';
import '../widgets/reciter_details/reciter_details_title.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/steps/app_steps_button.dart';
import '../bloc/reciter_details/reciter_details_cubit.dart';
import '../widgets/reciter_details/reciter_details_content.dart';

@RoutePage()
class ReciterDetailsPage extends StatefulWidget {
  final int reciterId;
  final bool isLiveSession;
  final SubscriptionCubit? subscriptionCubit;

  const ReciterDetailsPage({
    super.key,
    @PathParam('id') required this.reciterId,
    this.isLiveSession = false,
    this.subscriptionCubit,
  });

  @override
  State<ReciterDetailsPage> createState() => _ReciterDetailsPageState();
}

class _ReciterDetailsPageState extends State<ReciterDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<StudentMyScheduleCubit>().getMySchedule();
    context.read<UserCubit>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: ReciterDetailsBlocWrapper(
        reciterId: widget.reciterId,
        isLiveSession: widget.isLiveSession,
        child: widget.subscriptionCubit != null
            ? BlocProvider.value(
                value: widget.subscriptionCubit!,
                child: _buildReciterDetailsContent(),
              )
            : _buildReciterDetailsContent(),
      ),
    );
  }

  Widget _buildReciterDetailsContent() {
    return BlocBuilder<ReciterDetailsCubit, ReciterDetailsState>(
      builder: (context, reciterDetailsState) {
        return BlocBuilder<ReciterAvailableTimesCubit,
            ReciterAvailableTimesState>(
          builder: (context, reciterAvailableTimesState) {
            return BlocBuilder<UserCubit, UserState>(
              builder: (context, userState) {
                return _ReciterDetailsContent(
                  isLiveSession: widget.isLiveSession,
                  reciterId: widget.reciterId,
                  reciterAvailableTimesState: reciterAvailableTimesState,
                  reciterDetailsState: reciterDetailsState,
                  userState: userState,
                );
              },
            );
          },
        );
      },
    );
  }
}

class _ReciterDetailsContent extends StatelessWidget {
  final int reciterId;
  final ReciterAvailableTimesState reciterAvailableTimesState;
  final ReciterDetailsState reciterDetailsState;
  final UserState userState;
  final bool isLiveSession;

  const _ReciterDetailsContent({
    required this.reciterId,
    required this.reciterAvailableTimesState,
    required this.reciterDetailsState,
    required this.userState,
    required this.isLiveSession,
  });

  @override
  Widget build(BuildContext context) {
    if (reciterDetailsState.status is Failure ||
        reciterAvailableTimesState is Failure ||
        userState.status is Failure) {
      return AppErrorWidget(
        retryFunc: () {
          context.read<ReciterDetailsCubit>().getReciterById(reciterId);
          isLiveSession
              ? context
                  .read<ReciterAvailableTimesCubit>()
                  .getReciterAvailableTimesForLimit(
                      ReciterAvailableTimesForLimitSpecificationRequest(
                    reciterId: reciterId,
                    limitByDays: 7,
                    includeQuarters: false,
                  ))
              : context
                  .read<ReciterAvailableTimesCubit>()
                  .getReciterAvailableTimes(
                      ReciterAvailableTimesSpecificationRequest(
                          reciterId: reciterId));
        },
      );
    } else {
      return AppCustomScrollView(
        appPageHeader: AppPageHeader.none,
        padding: EdgeInsets.zero,
        bottomChildren: [
          _ScheduleButton(
            reciterId: reciterId,
            isLiveSession: isLiveSession,
          ),
        ],
        children: [
          Padding(
            padding: AppPadding.pageTitlteBackBtn,
            child: ReciterDetailsTitle(
              reciterId: reciterId,
              status: reciterDetailsState.status,
              videoId: reciterDetailsState.reciter?.videoId,
              isFav: reciterDetailsState.reciter?.isFavorite,
            ),
          ),
          Padding(
            padding: AppPadding.customScrollView,
            child: Column(
              children: [
                10.verticalSpace,
                Skeletonizer(
                  enabled: reciterDetailsState.status is Loading,
                  child: const ReciterDetailsContent(),
                ),
                20.verticalSpace,
                if (reciterAvailableTimesState is! Loading)
                  ReciterDetailsAvailableTimes(isLiveSession: isLiveSession),
                18.verticalSpace,
              ],
            ),
          ),
        ],
      );
    }
  }
}

class _ScheduleButton extends StatefulWidget {
  final int reciterId;
  final bool isLiveSession;
  const _ScheduleButton({required this.reciterId, required this.isLiveSession});

  @override
  State<_ScheduleButton> createState() => _ScheduleButtonState();
}

class _ScheduleButtonState extends State<_ScheduleButton> {
  List<SubscriptionModel> subscriptions = [];

  @override
  void initState() {
    super.initState();
    _loadSubscriptions();
  }

  Future<void> _loadSubscriptions() async {
    final cubit = context.read<SubscriptionCubit>();
    await cubit.loadSubscriptions();

    setState(() {
      subscriptions = cubit.state.subscriptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserCubit>().state;
    final scheduleCubit = context.watch<StudentScheduleSessionCubit>();

    final bool isScheduleEmpty = widget.isLiveSession
        ? scheduleCubit.pickedDateForOneTime.isEmpty ||
            scheduleCubit.pickedDayIdForOneTime == -1
        : scheduleCubit.selectedWeeklyScheduleTimes.isEmpty;
    final bool isDisabled = userState.hasActiveSchedule ||
        isScheduleEmpty ||
        (subscriptions.isEmpty && !widget.isLiveSession);

    return AppStepsButton(
      icon: const SizedBox(),
      label: Text(
        LocaleKeys.button_setSchedule,
        style: AppTextStyles.font14WhiteW500,
      ).tr(),
      onPressed: isDisabled
          ? null
          : () {
              final studentScheduleSessionCubit =
                  context.read<StudentScheduleSessionCubit>();
              final subscriptionCubit = context.read<SubscriptionCubit>();

              // -------------------- LIVE SESSION FLOW --------------------
              if (widget.isLiveSession) {
                subscriptionCubit.setEvaluationMethod(3);
                if (userState.userInfo?.programId != null) {
                  subscriptionCubit
                      .setProgramId(userState.userInfo!.programId!);
                }

                if (studentScheduleSessionCubit
                        .pickedDateForOneTime.isNotEmpty &&
                    studentScheduleSessionCubit.pickedDayIdForOneTime != -1) {
                  subscriptionCubit.setScheduleDetails(
                    recieverId: widget.reciterId,
                    suggestionTime:
                        studentScheduleSessionCubit.pickedDateTimeForOneTime,
                    dayId: studentScheduleSessionCubit.pickedDayIdForOneTime,
                  );
                  subscriptionCubit.subscribe();
                }
                return;
              }
              // -------------------- NORMAL SUBSCRIPTION FLOW --------------------
              if (userState.subscriptionStatus == SubscriptionStatus.approved) {
                final isPaid = subscriptions.any((inst) => inst.paid == true);
                final selectedNum = studentScheduleSessionCubit
                    .reciterAvailableTimesSelectedNum;

                if (isPaid) {
                  if (AdminConfigManager.isStudentSessionCountValid(
                      selectedNum)) {
                    studentScheduleSessionCubit
                        .scheduleSession(widget.reciterId);
                  } else {
                    showAppModalBottomSheet(
                      mainBtnLabel: LocaleKeys.button_back,
                      context: context,
                      subTitle:
                          AdminConfigManager.studentSessionCountErrorMsg(),
                      title: LocaleKeys.modalBottomSheet_title_schedule,
                      isDismissible: true,
                      titleStyle: AppTextStyles.font32GoldenOrangeW700,
                      mainOnPressed: context.router.popForced,
                    );
                  }
                } else {
                  showAppModalBottomSheet(
                    isDismissible: true,
                    mainBtnLabel: LocaleKeys.button_continue,
                    context: context,
                    mainOnPressed: () {
                      context.router.push(const SubscriptionRoute());
                    },
                    title: "Payment",
                    subTitle: "Please pay the fees before choosing a reciter",
                    imagePath: Assets.images.deleteAccount.path,
                  );
                }
              } else {
                final programs = context.read<ProgramCubit>().state.programs;
                showAppModalBottomSheet(
                  mainBtnLabel: LocaleKeys.button_goToSubscriptions,
                  context: context,
                  subTitle: LocaleKeys.modalBottomSheet_subTitle_st4,
                  title: LocaleKeys.modalBottomSheet_title_subscribe,
                  isDismissible: true,
                  titleStyle: AppTextStyles.font32GoldenOrangeW700,
                  mainOnPressed: () => context.router.push(
                    ProgramsListingRoute(
                      program: programs.firstWhere(
                        (element) =>
                            element.programType.id ==
                            Programs.sanadItqan.intValue,
                      ),
                    ),
                  ),
                );
              }
            },
    );
  }
}
