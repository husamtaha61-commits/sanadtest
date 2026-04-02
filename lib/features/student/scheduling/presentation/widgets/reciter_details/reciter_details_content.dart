import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/enums/app_enums.dart';
import '../../../../../../core/extenstions/Iterable.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/skeletons/fake_data/reciter_response_fake_data.dart';
import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/utils/snackbar.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../../core/widgets/reciter/reciter_description.dart';
import '../../../../../home/presentation/bloc/programs/program_cubit.dart';
import '../../../../../messaging/presentation/bloc/messaging/messaging_cubit.dart';
import '../../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../../rescheduling/presentation/bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../../bloc/reciter_details/reciter_details_cubit.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/widgets/app_elevated_button.dart';
import 'reciter_details_content/reciter_details_content_main_info.dart';
import 'reciter_details_content/reciter_details_content_nationality_container.dart';
import 'reciter_details_content/reciter_details_content_video_preview.dart';

class ReciterDetailsContent extends StatelessWidget {
  const ReciterDetailsContent({
    super.key,
  });

  Future<void> Function()? onClickContactReciter(
      BuildContext context, int reciterId) {
    final programs = context.read<ProgramCubit>().state.programs;
    final subscriptionStatus =
        context.read<UserCubit>().state.subscriptionStatus;
    final studentScheduleState = context.read<StudentMyScheduleCubit>().state;

    if (subscriptionStatus != SubscriptionStatus.approved) {
      return () async {
        showAppModalBottomSheet(
          mainBtnLabel: LocaleKeys.button_goToSubscriptions,
          context: context,
          subTitle: LocaleKeys.modalBottomSheet_subTitle_st3,
          title: LocaleKeys.modalBottomSheet_title_subscribe,
          isDismissible: true,
          titleStyle: AppTextStyles.font32GoldenOrangeW700,
          mainOnPressed: () => context.router.push(
            ProgramsListingRoute(
              program: programs.firstWhere(
                (element) =>
                    element.programType.id == Programs.sanadItqan.intValue,
              ),
            ),
          ),
        );
      };
    }

    if (studentScheduleState.reciterInfo == null) {
      return () async {
        showAppModalBottomSheet(
            mainBtnLabel: LocaleKeys.button_ok,
            context: context,
            subTitle: LocaleKeys.modalBottomSheet_subTitle_st11,
            title: LocaleKeys.modalBottomSheet_title_schedule,
            isDismissible: true,
            titleStyle: AppTextStyles.font32GoldenOrangeW700,
            mainOnPressed: () {
              context.router.maybePop();
            });
      };
    }
    if (studentScheduleState.reciterInfo?.id == reciterId) {
      return () async {
        final contactInfo = context
            .read<MessagingCubit>()
            .state
            .conversations
            .values
            .firstWhereOrNull((c) => c.otherParticipantInfo.id == reciterId);

        if (contactInfo != null) {
          context.router.push(MessageRoute(
              conversationId: contactInfo.id,
              otherParticipantInfo: contactInfo.otherParticipantInfo));
        } else {
          showSnackBar(
              context,
              context.tr(LocaleKeys.snackbar_reciterContactInfoNotFound),
              SnackBarStatus.error);
        }
      };
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final reciterDetailsCubit = context.read<ReciterDetailsCubit>();
    final userCubit = context.read<UserCubit>();
    final reciterDetailsIsLoading = reciterDetailsCubit.state.status is Loading;
    final contactOnClick = reciterDetailsIsLoading
        ? null
        : onClickContactReciter(context, reciterDetailsCubit.state.reciter!.id);

    return AppShadowContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (userCubit.state.subscriptionStatus ==
                  SubscriptionStatus.approved ||
              reciterDetailsCubit.state.reciter?.gender == "Male")
            const _VideoPreview(),
          Skeletonizer(
            enabled: reciterDetailsIsLoading,
            child: ReciterDetailsContentNationalityContainer(
              nationality: reciterDetailsIsLoading
                  ? BoneMock.name
                  : reciterDetailsCubit.state.reciter!.nationalityName,
              countryIsoCode: reciterDetailsIsLoading
                  ? BoneMock.name
                  : reciterDetailsCubit.state.reciter!.countryIsocode,
            ),
          ),
          16.verticalSpace,
          ReciterDetailsContentMainInfo(
            reciter: reciterDetailsIsLoading
                ? reciterResponseFakeData
                : reciterDetailsCubit.state.reciter!,
          ),
          16.verticalSpace,
          if (reciterDetailsCubit.state.reciter?.description != null)
            ReciterDescription(
                description: reciterDetailsCubit.state.reciter!.description!),
          16.verticalSpace,
          AppElevatedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            onPressed: contactOnClick,
            backgroundColor:
                contactOnClick == null ? null : AppColors.azureBlue,
            child: Text(
              context.tr(LocaleKeys
                  .student_scheduling_reciterDetails_availableTimes_contactReciter),
              style: AppTextStyles.font14WhiteW500,
            ),
          )
        ],
      ),
    );
  }
}

class _VideoPreview extends StatelessWidget {
  const _VideoPreview();

  @override
  Widget build(BuildContext context) {
    final reciterDetailsCubit = BlocProvider.of<ReciterDetailsCubit>(context);
    final reciterDetailsIsLoading = reciterDetailsCubit.state.status is Loading;

    return reciterDetailsIsLoading
        ? Skeletonizer(
            child: Container(
              width: double.infinity,
              height: 300.w,
              color: Colors.white,
            ),
          )
        : reciterDetailsCubit.state.reciter?.videoId != null
            ? Padding(
                padding: EdgeInsets.only(bottom: 12.w),
                child: BlocBuilder<ReciterDetailsCubit, ReciterDetailsState>(
                  builder: (context, state) =>
                      ReciterDetailsContentVideoPreview(
                    reciter: reciterDetailsIsLoading
                        ? reciterResponseFakeData
                        : reciterDetailsCubit.state.reciter!,
                  ),
                ),
              )
            : const SizedBox();
  }
}
