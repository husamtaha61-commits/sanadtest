import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/utils/admin_config_manager.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/app_error_msg.dart';
import '../../../../../../core/widgets/steps/app_steps_form_text.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../../core/widgets/camera/video_player_view.dart';
import '../../bloc/reciter_complete_profile/reciter_complete_profile_cubit.dart';

final videoSteps = [
  LocaleKeys.reciter_completeProfile_introductoryVideo_video_step1,
  LocaleKeys.reciter_completeProfile_introductoryVideo_video_step2,
  LocaleKeys.reciter_completeProfile_introductoryVideo_video_step3
];

final videoCameraStps = [
  LocaleKeys.reciter_completeProfile_introductoryVideo_video_stp1,
  LocaleKeys.reciter_completeProfile_introductoryVideo_video_stp2,
  LocaleKeys.reciter_completeProfile_introductoryVideo_video_stp3,
];

class ReciterCompleteProfileIntroductoryVideo extends StatelessWidget {
  const ReciterCompleteProfileIntroductoryVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final reciterCompleteProfileCubit =
        context.read<ReciterCompleteProfileCubit>();

    return BlocBuilder<ReciterCompleteProfileCubit,
        ReciterCompleteProfileState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppStepsFormText(
              text: LocaleKeys.reciter_completeProfile_introductoryVideo_title,
            ),
            21.verticalSpace,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: context.tr(LocaleKeys
                        .reciter_completeProfile_introductoryVideo_st1),
                    style: AppTextStyles.font14TextW400,
                  ),
                  TextSpan(
                    text:
                        ' ${context.tr(LocaleKeys.reciter_completeProfile_introductoryVideo_st2)}',
                    style: AppTextStyles.font14TextW400OP6,
                  ),
                ],
              ),
            ),
            42.verticalSpace,
            state.video != null
                ? VideoPlayerView(
                    url: state.video!.path,
                    dataSourceType: DataSourceType.file,
                    aspectRatio: 1 / 1,
                  )
                : Image.asset(
                    Assets.images.videoPreview.path,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            25.verticalSpace,
            Text(
              context.tr(LocaleKeys
                  .reciter_completeProfile_introductoryVideo_video_title),
              style: AppTextStyles.font15NavyBlueW700,
            ),
            18.verticalSpace,
            ...videoSteps.map(
              (videoStep) => Padding(
                padding: EdgeInsets.only(bottom: 13.w),
                child: Row(
                  children: [
                    Container(
                      width: 5.w,
                      height: 5.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5.w),
                        color: AppColors.textColor,
                      ),
                    ),
                    10.horizontalSpace,
                    Text(
                      context.tr(videoStep),
                      style: AppTextStyles.font14TextW400,
                    ),
                  ],
                ),
              ),
            ),
            15.verticalSpace,
            ElevatedButton.icon(
              onPressed: () => openVideoCamera(
                context: context,
                timerCount: const Duration(minutes: 3),
                timerCountInString: "00:3:00",
                withTimer: true,
                setVideo: reciterCompleteProfileCubit.setVideo,
                children: _buildVideoCameraContent(context),
                minTimeToStopRecording: AdminConfigManager.getAdminConfig()
                    .minLengthForReciterVideoInMinutes,
              ),
              icon: SvgPicture.asset(
                Assets.icons.videoOutlined.path,
                width: 20.w,
                height: 12.w,
              ),
              label: Text(
                context.tr(
                  state.video == null
                      ? LocaleKeys.button_record
                      : LocaleKeys.button_reRecord,
                ),
                style: AppTextStyles.font15WhiteW400,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.goldenOrange,
                fixedSize: Size(167.w, 40.w),
              ),
            ),
            if (reciterCompleteProfileCubit.errorMsg['video']!.isNotEmpty)
              AppErrorMsg(text: reciterCompleteProfileCubit.errorMsg['video']!)
          ],
        );
      },
    );
  }

  List<Widget> _buildVideoCameraContent(BuildContext context) {
    return [
      Positioned(
        bottom: 31.w,
        left: 10.w,
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: videoCameraStps
                .map(
                  (item) => Padding(
                    padding: EdgeInsets.only(bottom: 10.w),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Text(
                        context.tr(item),
                        style: AppTextStyles.font10WhiteW400,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      )
    ];
  }
}
