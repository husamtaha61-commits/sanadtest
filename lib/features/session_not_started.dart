import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/theme/styles/app_text_style.dart';
import '../core/widgets/app_bloc_wrapper_screen.dart';
import '../core/widgets/app_elevated_button.dart';
import '../gen/assets.gen.dart';
import '../gen/translations/locale_keys.g.dart';

@RoutePage()
class SessionNotStartedScreen extends StatelessWidget {
  const SessionNotStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.clock.path),
                  5.horizontalSpace,
                  Text(
                          LocaleKeys
                              .student_scheduling_sessionDetails_sessionEndedTitle,
                          style: AppTextStyles.font24TextW600)
                      .tr(),
                ],
              ),
              21.verticalSpace,
              Text(
                      LocaleKeys
                          .student_scheduling_sessionDetails_sessionEndedMessage,
                      style: AppTextStyles.font16darkNavyBlueW400,
                      textAlign: TextAlign.center)
                  .tr(),
              40.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  backgroundColor: const Color(0xFF003D7A),
                  child: Text(LocaleKeys.button_ok,
                          style: AppTextStyles.font16WhiteW400)
                      .tr(),
                  onPressed: () {
                    context.router.maybePop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
