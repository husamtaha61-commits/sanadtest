import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../bloc/session_confirmation/session_confirmation_cubit.dart';
import 'session_details_reciter_confirmation_container.dart';

class SessionDetailsReciterConfirmationStep1 extends StatelessWidget {
  const SessionDetailsReciterConfirmationStep1(
      {super.key, required this.sessionId});

  final String sessionId;

  @override
  Widget build(BuildContext context) {
    return SessionDetailsReciterConfirmationContainer(
      stepTitle: LocaleKeys.sessionDetails_sessionConfirmation_step1_stepTitle,
      title: LocaleKeys.sessionDetails_sessionConfirmation_step1_title,
      stepNum: "1",
      child: Column(
        children: [
          8.verticalSpace,
          Text(
            context.tr(
                LocaleKeys.sessionDetails_sessionConfirmation_step1_subTitle),
            style: AppTextStyles.font12navyBlueW400,
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppElevatedButton(
                elevation: 0,
                fixedSize: Size.fromWidth(105.w),
                backgroundColor: AppColors.navyBlue.withOpacity(0.1),
                child: Text(
                  context.tr(LocaleKeys.button_no),
                  style: AppTextStyles.font15NavyBlueW400,
                ),
                onPressed: () => context
                    .read<SessionConfirmationCubit>()
                    .sessionConfirmationNextStep(false),
              ),
              12.horizontalSpace,
              AppElevatedButton(
                fixedSize: Size.fromWidth(105.w),
                onPressed: () => context
                    .read<SessionConfirmationCubit>()
                    .sessionConfirmationNextStep(true),
                child: Text(context.tr(LocaleKeys.button_yes)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
