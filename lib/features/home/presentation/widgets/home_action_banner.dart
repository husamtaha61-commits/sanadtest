import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/models/base_status.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../notification/domain/entites/action_center.dart';
import '../../../notification/presentation/bloc/action_center/action_center_cubit.dart';
import '../../../notification/presentation/widgets/notification/action_center_section.dart';

class HomeActionBanner extends StatelessWidget {
  const HomeActionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionCenterCubit, ActionCenterState>(
      builder: (context, state) {
        if (state.status is Success && state.actions.isNotEmpty) {
          final ActionCenter firstAction = state.actions[0];
          return Container(
            padding: EdgeInsets.only(
              top: 12.w,
              bottom: 12.w,
              right: 10.w,
              left: 15.w,
            ),
            width: double.infinity,
            color: const Color(0xffFDE6AE),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.navyBlue,
                    borderRadius: BorderRadius.circular((32 / 2).w),
                  ),
                  width: 32.w,
                  height: 32.w,
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.icons.exclamationMark.path,
                      width: 16.w,
                      height: 16.w,
                    ),
                  ),
                ),
                14.horizontalSpace,
                Flexible(
                  child: GestureDetector(
                    onTap: () => navigateToScreenFromActionCenter(
                      context,
                      firstAction,
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: firstAction.message,
                            style: AppTextStyles.font12TextW400,
                          ),
                          // WidgetSpan(child: SizedBox(width: 6.w)),
                          // TextSpan(
                          //   text: "Go to Payment",
                          //   style: AppTextStyles.font16TextW700
                          //       .copyWith(decoration: TextDecoration.underline),
                          //   recognizer: TapGestureRecognizer()..onTap = () {},
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
