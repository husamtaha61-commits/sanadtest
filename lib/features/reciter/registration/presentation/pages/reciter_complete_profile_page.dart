import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/widgets/app_transform_flip_x.dart';
import '../../../../auth/presentation/bloc/auth/auth_cubit.dart';
import '../widgets/reciter_complete_profile/reciter_complete_profile_available_times.dart';

import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../../core/widgets/steps/app_steps_button_container.dart';
import '../../../../../core/widgets/steps/app_steps_container.dart';
import '../../../../../core/widgets/steps/app_steps_from.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../bloc/reciter_complete_profile/reciter_complete_profile_cubit.dart';
import '../widgets/reciter_complete_profile/reciter_complete_profile_bloc_wrapper.dart';
import '../widgets/reciter_complete_profile/reciter_complete_profile_introductory_video.dart';
import '../widgets/reciter_complete_profile/reciter_complete_profile_payment_information.dart';
import '../widgets/reciter_complete_profile/reciter_complete_profile_profile_completion.dart';

final stepItems = [
  {
    "imagePath": Assets.icons.person.path,
    "label": LocaleKeys.reciter_completeProfile_step1,
  },
  {
    "imagePath": Assets.icons.video.path,
    "label": LocaleKeys.reciter_completeProfile_step2,
  },
  {
    "imagePath": Assets.icons.payment.path,
    "label": LocaleKeys.reciter_completeProfile_step3,
  },
  {
    "imagePath": Assets.icons.time.path,
    "label": LocaleKeys.reciter_completeProfile_step4,
  },
];

@RoutePage()
class ReciterCompleteProfilePage extends StatelessWidget {
  const ReciterCompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReciterCompleteProfileBlocWrapper(
      child: _ReciterCompleteProfileContent(),
    );
  }
}

class _ReciterCompleteProfileContent extends StatelessWidget {
  const _ReciterCompleteProfileContent();

  @override
  Widget build(BuildContext context) {
    final reciterCompleteProfileCubit =
        context.read<ReciterCompleteProfileCubit>();

    return BlocBuilder<ReciterCompleteProfileCubit,
        ReciterCompleteProfileState>(
      builder: (context, state) {
        return PopScope(
          canPop: state.activeIndex == 1,
          onPopInvokedWithResult: (didPop, result) {
            context.read<AuthCubit>().signout();
            if (state.activeIndex == 1) {
              context.router.popForced();
            } else {
              reciterCompleteProfileCubit.back();
            }
          },
          child: AppStepsContainer(
            programTitle: LocaleKeys.reciter_completeProfile_title,
            items: stepItems,
            activeIndex: reciterCompleteProfileCubit.state.activeIndex,
            backFunction: (){
              context.read<AuthCubit>().signout();
              state.activeIndex == 1 ? context.router.popForced() : reciterCompleteProfileCubit.back();
            },
            sliverFillChild: _CurrentButton(
                activeIndex: reciterCompleteProfileCubit.state.activeIndex),
            children: [
              AppStepsForm(
                formKey: reciterCompleteProfileCubit.formKey,
                child: _CurrentStep(
                    activeIndex: reciterCompleteProfileCubit.state.activeIndex),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CurrentStep extends StatelessWidget {
  final int activeIndex;
  const _CurrentStep({required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    if (activeIndex == 1) {
      return const ReciterCompleteProfileProfileCompletion();
    } else if (activeIndex == 2) {
      return const ReciterCompleteProfileIntroductoryVideo();
    } else if (activeIndex == 3) {
      return const ReciterCompleteProfilePaymentInformation();
    } else {
      return const ReciterCompleteProfileAvailableTimes();
    }
  }
}

class _CurrentButton extends StatelessWidget {
  final int activeIndex;
  const _CurrentButton({required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    final reciterCompleteProfileCubit =
        BlocProvider.of<ReciterCompleteProfileCubit>(context);

    if (activeIndex == 1) {
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
        onPressed: reciterCompleteProfileCubit.validatePersonalInfo,
      );
    } else if ([2, 3].contains(activeIndex)) {
      return AppStepsButtonContainer(
        children: [
          ElevatedButton.icon(
            onPressed: activeIndex == 2
                ? reciterCompleteProfileCubit.validateIntroductoryVideo
                : reciterCompleteProfileCubit.validatePaymentInformation,
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
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColors.navyBlue),
          ),
          16.verticalSpace,
          ElevatedButton.icon(
            onPressed: activeIndex == 2
                ? reciterCompleteProfileCubit.skipIntroductoryVideo
                : reciterCompleteProfileCubit.skipPaymentInformation,
            icon: const SizedBox(),
            label: Text(
              context.tr(LocaleKeys.button_skip),
              style: AppTextStyles.font15NavyBlueW400,
            ),
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              elevation: 0,
              backgroundColor: const Color(0xFFE6ECF2),
            ),
          ),
        ],
      );
    } else {
      return AppStepsButton(
        icon: Text(
          context.tr(LocaleKeys.button_submit),
          style: AppTextStyles.font15WhiteW400,
        ),
        label: const SizedBox(),
        onPressed: () => reciterCompleteProfileCubit
            .submit(context.read<AuthCubit>().state.resetToken),
      );
    }
  }
}
