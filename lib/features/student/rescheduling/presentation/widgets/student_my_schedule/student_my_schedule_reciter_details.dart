import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/extenstions/Iterable.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/skeletons/fake_data/reciter_response_fake_data.dart';
import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/utils/snackbar.dart';
import '../../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../../core/widgets/reciter/reciter_description.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../main/presentation/bloc/navbar/navbar_cubit.dart';
import '../../../../../main/presentation/widgets/main/main_bottom_navbar.dart';
import '../../../../../messaging/presentation/bloc/messaging/messaging_cubit.dart';
import '../../../../scheduling/presentation/widgets/reciter_details/reciter_details_content/reciter_details_content_main_info.dart';
import '../../../../scheduling/presentation/widgets/reciter_details/reciter_details_content/reciter_details_content_nationality_container.dart';
import '../../../../scheduling/presentation/widgets/reciter_details/reciter_details_content/reciter_details_content_video_preview.dart';
import '../../bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';

class StudentMyScheduleReciterDetails extends StatelessWidget {
  const StudentMyScheduleReciterDetails({
    super.key,
  });

  contactReciterOnTap(BuildContext context, int reciterId ) {
    final contactInfo = context
        .read<MessagingCubit>().state.conversations.values
        .firstWhereOrNull((c) =>
    c.otherParticipantInfo.id == reciterId
    );

    if (contactInfo != null) {
      context.router.push(
          MessageRoute(
              conversationId: contactInfo.id,
              otherParticipantInfo: contactInfo.otherParticipantInfo
          )
      );
    } else {
      context.router.popUntilRouteWithName(MainRoute.name);
      context.read<NavbarCubit>().updateIndex(NavBarItem.chat.index);
      showSnackBar(
          context,
          context.tr(LocaleKeys.snackbar_reciterContactInfoNotFound),
          SnackBarStatus.error
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final studentMyScheduleCubit = context.read<StudentMyScheduleCubit>();
    final studentMyScheduleIsLoading =
        studentMyScheduleCubit.state.status is Loading;

    return AppShadowContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _VideoPreview(),
          Skeletonizer(
            enabled: studentMyScheduleIsLoading,
            child: ReciterDetailsContentNationalityContainer(
              nationality: studentMyScheduleIsLoading
                  ? BoneMock.name
                  : studentMyScheduleCubit.state.reciterInfo!.nationalityName,
              countryIsoCode: studentMyScheduleIsLoading
                  ? BoneMock.name
                  : studentMyScheduleCubit.state.reciterInfo!.countryIsocode,
            ),
          ),
          16.verticalSpace,
          ReciterDetailsContentMainInfo(
            reciter: studentMyScheduleIsLoading
                ? reciterResponseFakeData
                : studentMyScheduleCubit.state.reciterInfo!,
          ),
          16.verticalSpace,
          if (studentMyScheduleCubit.state.reciterInfo?.description != null)
            ReciterDescription(
                description: studentMyScheduleCubit.state.reciterInfo!.description!
            ),
          16.verticalSpace,
          AppElevatedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            onPressed: studentMyScheduleIsLoading ? null :
                () => contactReciterOnTap(context, studentMyScheduleCubit.state.reciterInfo!.id),
            backgroundColor: AppColors.azureBlue,
            child: Text(
              context.tr(
                LocaleKeys
                    .student_scheduling_reciterDetails_availableTimes_contactReciter,
              ),
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
    final studentMyScheduleCubit = context.read<StudentMyScheduleCubit>();
    final studentMyScheduleIsLoading =
        studentMyScheduleCubit.state.status is Loading;

    return studentMyScheduleIsLoading
        ? Skeletonizer(
            child: Container(
              width: double.infinity,
              height: 300.w,
              color: Colors.white,
            ),
          )
        : studentMyScheduleCubit.state.reciterInfo?.videoId != null
            ? Padding(
                padding: EdgeInsets.only(bottom: 12.w),
                child:
                    BlocBuilder<StudentMyScheduleCubit, StudentMyScheduleState>(
                  builder: (context, state) =>
                      ReciterDetailsContentVideoPreview(
                    reciter: studentMyScheduleIsLoading
                        ? reciterResponseFakeData
                        : studentMyScheduleCubit.state.reciterInfo!,
                  ),
                ),
              )
            : const SizedBox();
  }
}
