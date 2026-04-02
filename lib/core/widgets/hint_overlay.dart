import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../gen/assets.gen.dart';
import '../../gen/translations/locale_keys.g.dart';
import '../di/injection.dart';
import '../theme/styles/app_text_style.dart';


@RoutePage()
class HintOverlayPage extends StatelessWidget {
  const HintOverlayPage({super.key, required this.type});

  final HintType type;

  @override
  Widget build(BuildContext context) {
    type.setIsShown();
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(170),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    type.svg.path,
                    colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    context.tr(type.messageLocaleKey),
                    style: AppTextStyles.font16WhiteW600,
                  )
                ]
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: GestureDetector(
              onTap: () => context.router.maybePop(),
            ),
          ),
        ],
      ),
    );
  }
}

enum HintType {
  swipeLeftRight;

  SvgGenImage get svg => switch(this) {
    HintType.swipeLeftRight => Assets.icons.swipeLeftRight,
  };

  String get messageLocaleKey => switch(this) {
    HintType.swipeLeftRight => LocaleKeys.hintPage_swipeLeftRightSessions,
  };

  bool get isShown => getIt<StreamingSharedPreferences>()
      .getBool(name, defaultValue: false).getValue();


  void setIsShown() => getIt<StreamingSharedPreferences>().setBool(name, true);

}