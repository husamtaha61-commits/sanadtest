import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_page_title.dart';
import '../../../../core/widgets/app_shadow_container.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';

class HomeQuranRecitation extends StatelessWidget {
  const HomeQuranRecitation({super.key});

  @override
  Widget build(BuildContext context) {
    final quranRecitation = [
      {
        "step": LocaleKeys.home_quranRecitation_step1_title.tr(),
        "title": LocaleKeys.home_quranRecitation_step1_subTitle.tr(),
        "imagePath": Assets.images.quranRecitation1.path,
        "isDone": true,
      },
      {
        "step": LocaleKeys.home_quranRecitation_step2_title.tr(),
        "title": LocaleKeys.home_quranRecitation_step2_subTitle.tr(),
        "imagePath": Assets.images.quranRecitation2.path,
        "isDone": false,
      },
      {
        "step": LocaleKeys.home_quranRecitation_step3_title.tr(),
        "title": LocaleKeys.home_quranRecitation_step3_subTitle.tr(),
        "imagePath": Assets.images.quranRecitation3.path,
        "isDone": false,
      },
      {
        "step": LocaleKeys.home_quranRecitation_step4_title.tr(),
        "title": LocaleKeys.home_quranRecitation_step4_subTitle.tr(),
        "imagePath": Assets.images.quranRecitation4.path,
        "isDone": false,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const AppPageTitle(title: LocaleKeys.home_quranRecitation_title),
          38.verticalSpace,
          ...quranRecitation
              .asMap()
              .map(
                (index, item) => MapEntry(
                  index,
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: index != quranRecitation.length - 1 ? 10.w : 0),
                    child: AppShadowContainer(
                      padding: EdgeInsets.zero,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10.w,
                            right: 10.w,
                            child: SvgPicture.asset(
                              item["isDone"] as bool
                                  ? Assets.icons.squareCheck.path
                                  : Assets.icons.squareUncheck.path,
                              width: 30.w,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 34.w,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  item["imagePath"] as String,
                                  width: 70.w,
                                ),
                                12.horizontalSpace,
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5.w),
                                        child: Text(
                                          "${index + 1}. ${item["step"] as String}",
                                          style: AppTextStyles.font20TextW600,
                                        ),
                                      ),
                                      Text(
                                        item["title"] as String,
                                        style: AppTextStyles.font12TextW400,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .values,
        ],
      ),
    );
  }
}
