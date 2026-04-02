import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../../core/widgets/steps/app_steps_button_container.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';

class StudentMyScheduleButtons extends StatelessWidget {
  const StudentMyScheduleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStepsButtonContainer(
      children: [
        AppElevatedButton(
          onPressed: () => context.router.push(StudentUpdateScheduleRoute()),
          child: Text(
            context.tr(LocaleKeys.button_updateSchedule),
            style: AppTextStyles.font14WhiteW500,
          ),
        ),
        16.verticalSpace,
        ElevatedButton(
          onPressed: () => context.router.push(const StudentAddExtraSessionRoute()),
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            elevation: 0,
            backgroundColor: const Color.fromRGBO(0, 61, 122, 0.1),
            textStyle: AppTextStyles.font14WhiteW500,
          ),
          child: Text(
            context.tr(LocaleKeys.button_extraSession),
            style: AppTextStyles.font15NavyBlueW400,
          ),
        ),
      ],
    );
  }
}
