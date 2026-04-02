import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/app_divider.dart';
import '../../../../../core/widgets/app_price.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../domain/entites/program.dart';

class OurProgramsCard extends StatelessWidget {
  final Program program;
  const OurProgramsCard({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) => Container(
        decoration: BoxDecoration(
          boxShadow: AppShadows.blur4BlackOP25,
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      program.programType.name,
                      style: AppTextStyles.font20TextW600,
                    ),
                    5.verticalSpace,
                    const AppDivider(width: 50)
                  ],
                ),
                SvgPicture.asset(
                  Assets.icons.verse.path,
                  width: 31.w,
                  height: 28.w,
                )
              ],
            ),
            8.verticalSpace,
            Text(
              "${program.numberOfSessions} ${context.tr(LocaleKeys.home_ourPrograms_sessions)}",
              style: AppTextStyles.font14TextW500,
            ),
            22.verticalSpace,
            AppPrice(
              price: program.price,
            ),
            24.verticalSpace,
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 4.w),
              shrinkWrap: true,
              itemCount: program.programDescription.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: SvgPicture.asset(Assets.icons.checkOrange.path),
                    ),
                    10.horizontalSpace,
                    Flexible(
                      child: Text(
                        program.programDescription[index].name,
                        style: AppTextStyles.font12TextW400,
                      ),
                    )
                  ],
                ),
              ),
            ),
            13.verticalSpace,
            AppElevatedButton(
              child: Text(context.tr(LocaleKeys.button_moreDetails)),
              onPressed: () =>
                  context.router.push(ProgramsListingRoute(program: program)),
            )
          ],
        ),
      ),
    );
  }
}
