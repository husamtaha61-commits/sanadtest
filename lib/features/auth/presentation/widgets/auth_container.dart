import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../gen/assets.gen.dart';
import 'lang_dropdown.dart';

class AuthContainer extends StatelessWidget {
  final Widget child;
  final bool needLangMenu;
  const AuthContainer(
      {super.key, required this.child, this.needLangMenu = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _ImageBg(),
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.only(
            top: 5.w,
            left: 20.w,
            right: 20.w,
            bottom: 30.w,
          ),
          child: Column(
            children: [
              if (needLangMenu)
                const Align(
                  alignment: Alignment.centerRight,
                  child: LangDropdown(),
                ),
              const _Logo(),
              40.verticalSpace,
              child,
            ],
          ),
        ),
      ],
    );
  }
}

class _ImageBg extends StatelessWidget {
  const _ImageBg();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.images.authBg.path,
      alignment: Alignment.topCenter,
      fit: BoxFit.cover,
      width: double.infinity,
      colorFilter: const ColorFilter.mode(AppColors.navyBlue, BlendMode.color),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      key: ValueKey(context.locale), // To rebuild when the lang is changed
      getIt<AppPreferences>().isAr
          ? Assets.images.logoAr.path
          : Assets.images.logoEn.path,
      width: 209.w,
      height: 73.w,
    );
  }
}
