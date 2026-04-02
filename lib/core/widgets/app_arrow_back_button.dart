import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
import '../../gen/translations/locale_keys.g.dart';
import 'app_transform_flip_x.dart';

class AppArrowBackButton extends StatelessWidget {
  final void Function()? onPressed;
  const AppArrowBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: context.tr(LocaleKeys.button_back),
      onPressed: onPressed ?? context.router.maybePop,
      icon: AppTransformFlipX(
        child: SvgPicture.asset(
          Assets.icons.arrowLeft.path,
          width: 18.w,
          height: 18.w,
        ),
      ),
    );
  }
}
