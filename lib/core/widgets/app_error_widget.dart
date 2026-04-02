import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
import '../../gen/translations/locale_keys.g.dart';
import '../theme/styles/app_text_style.dart';
import 'steps/app_steps_button.dart';

class AppErrorWidget extends StatelessWidget {
  final void Function()? retryFunc;
  const AppErrorWidget({super.key, this.retryFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(),
        SvgPicture.asset(Assets.images.connectionError.path),
        24.verticalSpace,
        Text(
          context.tr(LocaleKeys.errorPage_title),
          style: AppTextStyles.font24TextW600,
          textAlign: TextAlign.center,
        ),
        12.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            context.tr(LocaleKeys.errorPage_subTitle),
            style: AppTextStyles.font20TextW400OP8,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        AppStepsButton(
          icon: const SizedBox(),
          label: Text(context.tr(LocaleKeys.button_retry)),
          onPressed: retryFunc,
        )
      ],
    );
  }
}
