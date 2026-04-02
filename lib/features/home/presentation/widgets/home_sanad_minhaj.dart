import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';

class HomeSanadMinhaj extends StatelessWidget {
  const HomeSanadMinhaj({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 35.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            Assets.images.sanadMinhaj.path,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            context.tr(LocaleKeys.home_sanadMinhaj_st1),
            style: AppTextStyles.font16WhiteW700,
            textAlign: TextAlign.center,
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              context.tr(LocaleKeys.home_sanadMinhaj_st2),
              style: AppTextStyles.font12WhiteW400,
              textAlign: TextAlign.center,
            ),
          ),
          20.verticalSpace,
          AppElevatedButton(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            backgroundColor: Colors.transparent,
            fixedSize: const Size.fromWidth(double.infinity),
            foregroundColor: Colors.white,
            child: Text(context.tr(LocaleKeys.button_sanadMinhaj)),
          )
        ],
      ),
    );
  }
}
