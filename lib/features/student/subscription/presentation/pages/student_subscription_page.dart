import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_transform_flip_x.dart';
import '../../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../../core/widgets/steps/app_steps_container.dart';
import '../../../../../core/widgets/steps/app_steps_from.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../quran_page.dart';
import '../../../scheduling/presentation/bloc/reciter_listing/reciter_listing_cubit.dart';
import '../bloc/get_random_quran/get_random_quran_cubit.dart';
import '../bloc/subscription/subscription_cubit.dart';
import '../widgets/student_subscription_bloc_wrapper.dart';
import '../widgets/student_subscription_personal_info.dart';
import '../widgets/student_subscription_test_time.dart';

@RoutePage()
class StudentSubscriptionPage extends StatelessWidget {
  final int programId;
  final int initialStepIndex;
  final bool isResubmit;
  final bool isVideoRejection;
  final SubscriptionCubit subscriptionCubit;
  const StudentSubscriptionPage({
    super.key,
    required this.programId,
    this.initialStepIndex = 1,
    this.isResubmit = false,
    required this.isVideoRejection,
    required this.subscriptionCubit,
  });

  @override
  Widget build(BuildContext context) {
    return StudentSubscriptionBlocWrapper(
      programId: programId,
      initialStepIndex: initialStepIndex,
      isResubmit: isResubmit,
      subscriptionCubit: subscriptionCubit,
      child: _SubscriptionContent(
        isResubmit: isResubmit,
        isVideoRejection: isVideoRejection,
        initialStepIndex: isVideoRejection ? 3 : initialStepIndex,
      ),
    );
  }
}

class _SubscriptionContent extends StatefulWidget {
  final bool isResubmit;
  final bool isVideoRejection;
  final int initialStepIndex;
  const _SubscriptionContent({
    this.isResubmit = false,
    required this.isVideoRejection,
    required this.initialStepIndex,
  });

  @override
  State<_SubscriptionContent> createState() => _SubscriptionContentState();
}

class _SubscriptionContentState extends State<_SubscriptionContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    final subscriptionCubit = context.read<SubscriptionCubit>();
    subscriptionCubit.setActiveIndex(widget.initialStepIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Map<String, String>> _getStepItems() {
    // Remove "Upload Your ID" section entirely.
    if (widget.isResubmit && widget.isVideoRejection) {
      // Resubmit due to video rejection -> only video step
      return [
        {
          "imagePath": Assets.icons.video.path,
          "label": LocaleKeys.subscription_program_step3,
        }
      ];
    } else {
      // Normal or resubmit (not video rejection) -> Personal Info + Test Time
      return [
        {
          "imagePath": Assets.icons.person.path,
          "label": LocaleKeys.subscription_program_step1,
        },
        {
          "imagePath": Assets.icons.video.path,
          "label": LocaleKeys.subscription_program_step3,
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionCubit = context.read<SubscriptionCubit>();
    final getRandomQuranCubit = context.read<GetRandomQuranCubit>();
    final totalPartsTime =
        getRandomQuranCubit.state.quranTemplate!.minutesToCompleteReading;

    void openVideoCam() {
      openVideoCamera(
        context: context,
        timerCount: Duration(minutes: totalPartsTime),
        timerCountInString: formatTime(totalPartsTime),
        withTimer: true,
        setVideo: subscriptionCubit.setVideo,
        children: _buildVideoCameraContent(context),
        blocValue: context.read<GetRandomQuranCubit>(),
        cameraBottom: MediaQuery.of(context).size.height / 3,
        withDecoration: true,
        minTimeToStopRecording: 1,
        setStartRecording: getRandomQuranCubit.setStartRecording,
        isAudioOnlyMode: subscriptionCubit.state.isCheckedVidRecord,
      );
    }

    return BlocProvider(
      create: (context) => getIt<ReciterListingCubit>(),
      child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, state) {
          final subscriptionIsLoading = state.status is Loading;

          return PopScope(
            canPop: Platform.isIOS,
            onPopInvokedWithResult: (didPop, result) {
              if (widget.isVideoRejection) {
                context.router.popForced();
              } else if (state.activeIndex <= 1) {
                context.router.popForced();
              } else if (!subscriptionIsLoading) {
                subscriptionCubit.back(context);
              }
            },
            child: AppStepsContainer(
              programTitle: state.programId == Programs.sanadItqan.intValue
                  ? LocaleKeys.subscription_program_sanadItqan
                  : LocaleKeys.subscription_program_sanadIjazah,
              programSubtitle: LocaleKeys.subscription_program_subTitle,
              items: _getStepItems(),
              // With ID step removed, only two steps remain: 1 (Personal) and 2 (Video)
              activeIndex: widget.isVideoRejection
                  ? 1
                  : subscriptionCubit.state.activeIndex,
              backFunction: subscriptionIsLoading
                  ? () {}
                  : () => subscriptionCubit.back(context,
                      isVideoRejection: widget.isVideoRejection),
              sliverFillChild: _CurrentButton(
                isResubmit: widget.isResubmit,
                isVideoRejection: widget.isVideoRejection,
                activeIndex: subscriptionCubit.state.activeIndex,
                openVideoCamera: openVideoCam,
                isLoading: subscriptionIsLoading,
              ),
              children: [
                AppStepsForm(
                  formKey: subscriptionCubit.formKey,
                  child: subscriptionIsLoading
                      ? Center(
                          child: Column(
                            children: [
                              100.verticalSpace,
                              RotationTransition(
                                turns: _controller,
                                child: SvgPicture.asset(
                                    Assets.images.loadingIndicator.path),
                              ),
                              100.verticalSpace,
                              Text(
                                context.tr(LocaleKeys.form_uploadingTitle),
                                style: AppTextStyles.font24NavyBlueW600,
                              ),
                              Text(
                                context.tr(
                                  LocaleKeys.form_uploadingSubtitle,
                                  args: [
                                    "${(state.sentBytes / state.totalBytes.toDouble() * 100).toInt()}"
                                  ],
                                ),
                                style: AppTextStyles.font14navyBlueW500,
                              ),
                            ],
                          ),
                        )
                      : _CurrentStep(
                          activeIndex: state.activeIndex,
                          openVideoCamera: openVideoCam,
                          isResubmit: widget.isResubmit,
                          isVideoRejection: widget.isVideoRejection,
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CurrentStep extends StatelessWidget {
  final int activeIndex;
  final void Function() openVideoCamera;
  final bool isResubmit;
  final bool isVideoRejection;

  const _CurrentStep({
    required this.activeIndex,
    required this.openVideoCamera,
    required this.isResubmit,
    required this.isVideoRejection,
  });

  @override
  Widget build(BuildContext context) {
    // ID step removed: only Personal Info (step 1) and Test Time (step 2)
    if (isResubmit && isVideoRejection) {
      return StudentSubscriptionTestTime(
        isVideoRejection: isVideoRejection,
        openVideoCamera: openVideoCamera,
      );
    }

    if (activeIndex == 1) return const StudentSubscriptionPersonalInfo();
    return StudentSubscriptionTestTime(
      isVideoRejection: isVideoRejection,
      openVideoCamera: openVideoCamera,
    );
  }
}

class _CurrentButton extends StatelessWidget {
  final int activeIndex;
  final void Function() openVideoCamera;
  final bool isLoading;
  final bool isResubmit;
  final bool isVideoRejection;

  const _CurrentButton({
    required this.activeIndex,
    required this.openVideoCamera,
    required this.isLoading,
    this.isResubmit = false,
    this.isVideoRejection = false,
  });

  @override
  Widget build(BuildContext context) {
    final subscriptionCubit = context.read<SubscriptionCubit>();

    // Hide button when evaluationMethod == 2 (WhatsApp) and we are on video step (index 2)
    // For video rejection resubmit flow, the only step has index 1, so condition won't hide unintentionally.
    final evaluationMethod = subscriptionCubit.state.evaluationMethod;
    if (evaluationMethod == 2 && activeIndex == 2) {
      return const SizedBox();
    }

    int lastStepIndex;
    // Only two steps when ID is removed
    if (isResubmit && isVideoRejection) {
      lastStepIndex = 1; // Only video step
    } else {
      lastStepIndex = 2; // Personal info -> video
    }

    // Resubmit & not video rejection
    if (isResubmit && !isVideoRejection) {
      final onLastStep = activeIndex == lastStepIndex;
      return BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, state) {
          return AppStepsButton(
            icon: Text(
              context.tr(onLastStep
                  ? LocaleKeys.button_submit
                  : LocaleKeys.button_next),
              style: AppTextStyles.font15WhiteW400,
            ),
            label: AppTransformFlipX(
              child: SvgPicture.asset(
                Assets.icons.arrowRight.path,
                width: 14.w,
                height: 14.w,
              ),
            ),
            onPressed: () {
              if (activeIndex == 1) {
                subscriptionCubit.validatePersonalInfo();
              } else {
                // Last step (video) -> submit
                subscriptionCubit.updatSubscribtion();
              }
            },
          );
        },
      );
    }

    // Resubmit & video rejection
    if (isResubmit && isVideoRejection) {
      return BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, state) {
          final hasVideo = state.video != null ||
              (state.videoUrl != null && state.videoUrl!.isNotEmpty);
          return AppStepsButton(
            label: Text(
              context.tr(!hasVideo
                  ? LocaleKeys.button_record
                  : LocaleKeys.button_submit),
              style: AppTextStyles.font15WhiteW400,
            ),
            icon: !hasVideo
                ? SvgPicture.asset(
                    Assets.icons.videoOutlined.path,
                    width: 20.w,
                    height: 12.w,
                  )
                : const SizedBox(),
            onPressed: !state.isCheckedVideo || isLoading
                ? null
                : !hasVideo
                    ? () => openVideoCamera()
                    : () => subscriptionCubit.updatSubscribtion(),
            backgroundColor:
                hasVideo ? AppColors.navyBlue : AppColors.goldenOrange,
          );
        },
      );
    }

    // Normal flow: step 1 (Personal Info) then step 2 (Video)
    if (activeIndex == 1) {
      return BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, state) {
          return AppStepsButton(
            icon: Text(
              context.tr(LocaleKeys.button_next),
              style: AppTextStyles.font15WhiteW400,
            ),
            label: AppTransformFlipX(
              child: SvgPicture.asset(
                Assets.icons.arrowRight.path,
                width: 14.w,
                height: 14.w,
              ),
            ),
            onPressed: () {
              subscriptionCubit.validatePersonalInfo();
            },
          );
        },
      );
    }

    // Video step (step 2) in normal flow (will not render if evaluationMethod==2 due to early return above)
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        final hasVideo = state.video != null;
        return AppStepsButton(
          label: Text(
            context.tr(!hasVideo
                ? LocaleKeys.button_record
                : LocaleKeys.button_submit),
            style: AppTextStyles.font15WhiteW400,
          ),
          icon: !hasVideo
              ? SvgPicture.asset(
                  Assets.icons.videoOutlined.path,
                  width: 20.w,
                  height: 12.w,
                )
              : const SizedBox(),
              // ...............................................> 
          onPressed: !state.isCheckedVideo || isLoading
              ? null
              : !hasVideo
                  ? () => openVideoCamera()
                  : () => subscriptionCubit.subscribe(),
          backgroundColor:
              hasVideo ? AppColors.navyBlue : AppColors.goldenOrange,
        );
      },
    );
  }
}

List<Widget> _buildVideoCameraContent(BuildContext context) {
  return [
    BlocBuilder<GetRandomQuranCubit, GetRandomQuranState>(
      builder: (context, getRandomQuranState) {
        final quranTemplate = getRandomQuranState.quranTemplate;
        return Positioned(
          top: MediaQuery.of(context).padding.top + 51.w,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: Colors.black.withAlpha(100),
            ),
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 7.w),
            child: Text(
              "${context.tr(LocaleKeys.subscription_testTime_surah)} ${quranTemplate!.chapterName} ${context.tr(LocaleKeys.subscription_testTime_verses)} ${quranTemplate.fromVerse}-${quranTemplate.toVerse}",
              style: AppTextStyles.font16WhiteW400,
            ),
          ),
        );
      },
    ),
    BlocBuilder<GetRandomQuranCubit, GetRandomQuranState>(
      builder: (context, state) {
        return Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          top: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height / 3),
          child: Quran(quranTemplate: state.quranTemplate!),
        );
      },
    ),
  ];
}
