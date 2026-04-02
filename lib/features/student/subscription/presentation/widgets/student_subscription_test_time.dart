import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/constants/student_subscription_video_guide_lines.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../../../core/theme/styles/app_button_style.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_checkbox.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../core/widgets/camera/video_player_view.dart';
import '../../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../core/widgets/steps/app_steps_form_text.dart';
import '../../../../custom_video_preview.dart';
import '../../../scheduling/domain/entites/reciter.dart';
import '../../../scheduling/presentation/bloc/reciter_listing/reciter_listing_cubit.dart';
import '../../../scheduling/presentation/widgets/reciter_listing/reciter_listing_filters_options.dart';
import '../../../scheduling/presentation/widgets/reciter_listing/reciter_listing_reciters_list_item.dart';
import '../../../scheduling/presentation/widgets/reciter_listing/skeletons/reciter_listing_reciters_list_skeleton.dart';
import '../bloc/subscription/subscription_cubit.dart';

class StudentSubscriptionTestTime extends StatefulWidget {
  final void Function() openVideoCamera;
  final bool isVideoRejection;
  const StudentSubscriptionTestTime({
    super.key,
    required this.openVideoCamera,
    required this.isVideoRejection,
  });

  @override
  State<StudentSubscriptionTestTime> createState() =>
      _StudentSubscriptionTestTimeState();
}

class _StudentSubscriptionTestTimeState
    extends State<StudentSubscriptionTestTime> {
  @override
  Widget build(BuildContext context) {
    final subscriptionCubit = context.read<SubscriptionCubit>();
    String? videoURL =
        getIt<AppPreferences>().getUserCachedResponse().introVideoUrl;

    if (videoURL != null && videoURL.isNotEmpty) {
      subscriptionCubit.setVideoUrl(videoURL);
    }

    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppStepsFormText(
              text: LocaleKeys.subscription_testTime_title,
            ),
            25.verticalSpace,

            // 🔹 Tab Switcher
            Row(
              children: [
                Expanded(
                  child: _TabButton(
                    isSelected: subscriptionCubit.state.evaluationMethod == 1,
                    index: 0,
                    label: LocaleKeys.subscription_testTime_videoOption,
                    onPressed: () => subscriptionCubit.setEvaluationMethod(1),
                  ),
                ),
                if (!widget.isVideoRejection) ...[
                  10.horizontalSpace,
                  Expanded(
                    child: _TabButton(
                      isSelected: subscriptionCubit.state.evaluationMethod == 2,
                      index: 1,
                      label: LocaleKeys.subscription_testTime_liveSessionOption,
                      onPressed: () => subscriptionCubit.setEvaluationMethod(2),
                    ),
                  ),
                ],
              ],
            ),

            30.verticalSpace,
            if (subscriptionCubit.state.evaluationMethod == 1)
              _VideoSection(
                state: state,
                subscriptionCubit: subscriptionCubit,
                openVideoCamera: widget.openVideoCamera,
                isVideoRejection: widget.isVideoRejection,
              )
            else
              const _LiveSessionSection(),
          ],
        );
      },
    );
  }
}

class _VideoSection extends StatelessWidget {
  final SubscriptionState state;
  final SubscriptionCubit subscriptionCubit;
  final VoidCallback openVideoCamera;
  final bool isVideoRejection;
  const _VideoSection({
    required this.state,
    required this.subscriptionCubit,
    required this.openVideoCamera,
    required this.isVideoRejection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.subscription_testTime_st1),
          style: AppTextStyles.font15TextW400,
        ),
        30.verticalSpace,
        AppCheckbox(
          onChanged: subscriptionCubit.setCheckBoxVideo,
          value: state.isCheckedVideo,
          child: Text.rich(
            TextSpan(
              style: AppTextStyles.font12TextW400,
              children: [
                TextSpan(
                    text: context.tr(LocaleKeys.subscription_testTime_guideP1)),
                TextSpan(
                    text: context.tr(LocaleKeys.subscription_testTime_guideP2)),
                TextSpan(
                    text: context.tr(LocaleKeys.subscription_testTime_guideP3)),
              ],
            ),
          ),
        ),
        20.verticalSpace,
        AppCheckbox(
          onChanged: subscriptionCubit.setCheckVidRecord,
          value: state.isCheckedVidRecord,
          child: Text(
            context.tr(LocaleKeys.subscription_testTime_recordingConsent),
            style: AppTextStyles.font12TextW400,
          ),
        ),
        20.verticalSpace,
        const _VideoGuideLines(),
        32.verticalSpace,

        // 🔹 Video Player / Buttons
        if (state.videoUrl != null &&
            state.videoUrl!.isNotEmpty &&
            state.video == null &&
            isVideoRejection)
          VideoPlayerView(
            url: state.videoUrl!,
            dataSourceType: DataSourceType.network,
          ),
        if (state.videoUrl != null &&
            state.videoUrl!.isNotEmpty &&
            state.video == null)
          20.verticalSpace,
        if (state.videoUrl != null &&
            state.videoUrl!.isNotEmpty &&
            state.video == null &&
            isVideoRejection)
          AppStepsButton(
            label: Text(
              context.tr(LocaleKeys.button_reRecord),
              style: AppTextStyles.font15WhiteW400,
            ),
            onPressed: state.isCheckedVideo ? openVideoCamera : null,
            icon: SvgPicture.asset(Assets.icons.videoOutlined.path),
          ),
        if (state.video != null)
          StyledVideoPlayer(
            key: ValueKey(state.video!.path),
            path: state.video!.path,
          ),
      ],
    );
  }
}

class _LiveSessionSection extends StatelessWidget {
  const _LiveSessionSection();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(LocaleKeys.subscription_testTime_livesessionDescription),
            style: AppTextStyles.font14TextW400,
          ),
          23.verticalSpace,
          const ReciterListingFiltersOptions(),
          16.verticalSpace,
          const SubscribtionListingRecitersList(),
        ],
      ),
    );
  }
}

class SubscribtionListingRecitersList extends StatefulWidget {
  const SubscribtionListingRecitersList({super.key});

  @override
  State<SubscribtionListingRecitersList> createState() =>
      _SubscribtionListingRecitersListState();
}

class _SubscribtionListingRecitersListState
    extends State<SubscribtionListingRecitersList> {
  @override
  void initState() {
    super.initState();

    final reciterListingCubit = context.read<ReciterListingCubit>();
    reciterListingCubit.pagingController.addPageRequestListener((pageKey) {
      reciterListingCubit.getRecitersByPage(
          pageKey, true, context.read<SubscriptionCubit>().gender?.id ?? 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final reciterListingCubit = context.read<ReciterListingCubit>();

    return Expanded(
      child: BlocBuilder<ReciterListingCubit, ReciterListingState>(
        builder: (context, state) {
          // Show skeleton while loading
          if (state.status
              .maybeWhen(loading: () => true, orElse: () => false)) {
            return const ReciterListingRecitersListSkeleton();
          }

          return PagedListView<int, Reciter>(
            pagingController: reciterListingCubit.pagingController,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            builderDelegate: PagedChildBuilderDelegate<Reciter>(
              noItemsFoundIndicatorBuilder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    30.verticalSpace,
                    Text(
                      context.tr(LocaleKeys.itemNotFound_title),
                      style: AppTextStyles.font20TextW400,
                    ),
                    10.verticalSpace,
                    Text(context.tr(LocaleKeys.itemNotFound_subTitle)),
                  ],
                );
              },
              itemBuilder: (context, item, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: 15.w, left: 15.w, right: 15.w, top: 15.w),
                  child: ReciterListingRecitersListItem(
                    isLiveSession: true,
                    reciter: item,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _VideoGuideLines extends StatelessWidget {
  const _VideoGuideLines();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(LocaleKeys.subscription_evaluationTestGuidelines_title),
            style: AppTextStyles.font20TextW700,
          ),
          8.verticalSpace,
          Text(
            LocaleKeys.subscription_evaluationTestGuidelines_subTitle,
            style: AppTextStyles.font16GoldenOrangeW500,
          ).tr(),
          ...studentSubscriptionVideoGuideLines.map(
            (guide) {
              return Padding(
                padding: EdgeInsets.only(top: 20.w),
                child: Row(
                  children: [
                    SvgPicture.asset(guide['imagePath'] as String),
                    12.horizontalSpace,
                    Flexible(
                      child: Text(
                        guide['text'] as String,
                        style: AppTextStyles.font12TextW400,
                      ).tr(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final bool isSelected;
  final int index;
  final String label;
  final Function() onPressed;

  const _TabButton({
    required this.isSelected,
    required this.index,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? AppElevatedButton(
            onPressed: onPressed,
            backgroundColor: AppColors.goldenOrange,
            child: Text(
              context.tr(label),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
            ),
          )
        : AppShadowContainer(
            height: buttonHeight,
            padding: EdgeInsets.zero,
            child: AppElevatedButton(
              elevation: 0,
              onPressed: onPressed,
              backgroundColor: Colors.white,
              foregroundColor: AppColors.textColor,
              child: Text(
                context.tr(label),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
              ),
            ),
          );
  }
}
