import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/base_status.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../bloc/global_reciters_section/global_reciters_section_cubit.dart';

class HomeConnectingReciters extends StatelessWidget {
  const HomeConnectingReciters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalRecitersSectionCubit, GlobalRecitersSectionState>(
      builder: (context, state) {
        if (state.status is Success) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.globalRecitersSection!.sectionData.title,
                  style: AppTextStyles.font32TextW700,
                ),
                26.verticalSpace,
                Text(
                  state.globalRecitersSection!.sectionData.description,
                  style: AppTextStyles.font16TextW400,
                ),
                26.verticalSpace,
                AppElevatedButton(
                  onPressed: () =>
                      context.router.push(const ReciterListingRoute()),
                  backgroundColor: AppColors.goldenOrange,
                  fixedSize: Size.fromWidth(175.w),
                  child: Text(context.tr(LocaleKeys.button_recitersList)),
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
