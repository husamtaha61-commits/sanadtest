import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_transform_flip_x.dart';
import '../../../../../core/widgets/steps/app_steps_container.dart';
import '../../../../../core/widgets/steps/app_steps_from.dart';
import '../bloc/reciter_submit_job/reciter_submit_job_cubit.dart';

import '../../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../widgets/reciter_submit_job/reciter_submit_job_bloc_wrapper.dart';
import '../widgets/reciter_submit_job/reciter_submit_job_personal_info.dart';
import '../widgets/reciter_submit_job/reciter_submit_job_certificates.dart';
import '../widgets/reciter_submit_job/reciter_submit_job_upload_your_id.dart';

final stepItems = [
  {
    "imagePath": Assets.icons.person.path,
    "label": LocaleKeys.reciter_submitJob_step1,
  },
  {
    "imagePath": Assets.icons.idCard.path,
    "label": LocaleKeys.reciter_submitJob_step2,
  },
  {
    "imagePath": Assets.icons.certificates.path,
    "label": LocaleKeys.reciter_submitJob_step3,
  },
];

@RoutePage()
class ReciterSubmitJobPage extends StatelessWidget {
  const ReciterSubmitJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReciterSubmitJobBlocWrapper(child: _ReciterSubmitJobContent());
  }
}

class _ReciterSubmitJobContent extends StatelessWidget {
  const _ReciterSubmitJobContent();

  @override
  Widget build(BuildContext context) {
    final reciterSubmitJobCubit = context.read<ReciterSubmitJobCubit>();

    return BlocBuilder<ReciterSubmitJobCubit, ReciterSubmitJobState>(
      builder: (context, state) {
        return PopScope(
          canPop: state.activeIndex == 1,
          onPopInvokedWithResult: (didPop, result) {
            if (state.activeIndex == 1) {
              context.router.popForced();
            } else {
              reciterSubmitJobCubit.back();
            }
          },
          child: AppStepsContainer(
            programTitle: LocaleKeys.reciter_submitJob_title,
            items: stepItems,
            activeIndex: reciterSubmitJobCubit.state.activeIndex,
            backFunction: () => state.activeIndex == 1 ? context.router.popForced() : reciterSubmitJobCubit.back(),
            sliverFillChild: _CurrentButton(
              activeIndex: reciterSubmitJobCubit.state.activeIndex,
            ),
            children: [
              AppStepsForm(
                formKey: reciterSubmitJobCubit.formKey,
                child: _CurrentStep(
                  activeIndex: reciterSubmitJobCubit.state.activeIndex,
                ),
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
      return const ReciterSubmitJobPersonalInfo();
    } else if (activeIndex == 2) {
      return const ReciterSubmitJobUploadYourId();
    } else {
      return const ReciterSubmitJobCertificates();
    }
  }
}

class _CurrentButton extends StatelessWidget {
  final int activeIndex;
  const _CurrentButton({required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    final reciterSubmitJobCubit = context.read<ReciterSubmitJobCubit>();

    if ([1, 2].contains(activeIndex)) {
      return AppStepsButton(
        icon: Text(
          context.tr(LocaleKeys.button_next),
          style: AppTextStyles.font14WhiteW500,
        ),
        label: AppTransformFlipX(
          child: SvgPicture.asset(
            Assets.icons.arrowRight.path,
            width: 14.w,
            height: 14.w,
          ),
        ),
        onPressed: () {
          activeIndex == 1
              ? reciterSubmitJobCubit.validatePersonalInfo()
              : reciterSubmitJobCubit.validateUploadYourId();
        },
      );
    } else {
      return AppStepsButton(
        label: Text(
          context.tr(LocaleKeys.button_submit),
          style: AppTextStyles.font14WhiteW500,
        ),
        icon: const SizedBox(),
        onPressed: reciterSubmitJobCubit.register,
      );
    }
  }
}
