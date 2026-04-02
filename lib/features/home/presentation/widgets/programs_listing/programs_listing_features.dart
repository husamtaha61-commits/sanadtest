import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_price.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../domain/entites/program.dart';

class ProgramsListingFeatures extends StatelessWidget {
  final Program program;
  const ProgramsListingFeatures({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8E8E8)),
      ),
      child: Column(
        children: [
          60.verticalSpace,
          Text(
            program.programType.name,
            style: AppTextStyles.font24NavyBlueW700,
          ),
          28.verticalSpace,
          Text(
            program.programSubTitle.name,
            style: AppTextStyles.font16TextW500,
          ),
          40.verticalSpace,
          AppPrice(
            price: program.price,
          ),
          15.verticalSpace,
          Text(
            "${context.tr(LocaleKeys.home_ourPrograms_sessions)} ${program.numberOfSessions}",
            style: AppTextStyles.font16TextW500,
          ),
          56.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(LocaleKeys.home_programingList_features),
                style: AppTextStyles.font16TextW600,
              ),
              42.verticalSpace,
              ...program.programDescription.map(
                (feature) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 28.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.circularTrue.path,
                          width: 18.w,
                        ),
                        8.horizontalSpace,
                        Flexible(
                          child: Text(
                            feature.name,
                            style: AppTextStyles.font14TextW400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
