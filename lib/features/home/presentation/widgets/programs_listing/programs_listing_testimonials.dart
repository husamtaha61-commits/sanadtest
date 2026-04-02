import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_divider.dart';
import '../../../../../gen/assets.gen.dart';

class ProgramsListingTestimonials extends StatelessWidget {
  const ProgramsListingTestimonials({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index == 2 ? 0 : 32.w),
          child: Container(
            padding: EdgeInsets.only(
                top: 35.w, bottom: 30.w, right: 18.w, left: 18.w),
            width: 200,
            decoration: BoxDecoration(
              boxShadow: AppShadows.blur30BlackOP06ffsetDy12,
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE8E8E8)),
            ),
            child: Column(
              children: [
                SvgPicture.asset(Assets.icons.goldenComma.path),
                20.verticalSpace,
                Text(
                  "“Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s”",
                  style: AppTextStyles.font14TextW400OP8,
                  textAlign: TextAlign.center,
                ),
                24.verticalSpace,
                const AppDivider(width: 54, borderRadius: 0),
                11.verticalSpace,
                CircleAvatar(
                  backgroundColor: AppColors.navyBlue,
                  radius: 30.w,
                ),
                8.verticalSpace,
                Text(
                  "Mohammed nour".toUpperCase(),
                  style: AppTextStyles.font10TextW300OP8,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
