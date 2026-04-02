import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/snackbar.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../bloc/session_confirmation/session_confirmation_cubit.dart';
import '../../bloc/session_details/session_details_cubit.dart';
import 'session_details_reciter_confirmation_container.dart';

class SessionDetailsReciterConfirmationStep2 extends StatelessWidget {
  final String sessionId;
  const SessionDetailsReciterConfirmationStep2(
      {super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionConfirmationCubit, SessionConfirmationState>(
      listener: (context, state) {
        state.status.whenOrNull(
          loading: () => showAppLoadingDialog(context),
          failure: (error) => context.router.popForced(),
          success: () {
            context.router.popForced();
            showGlobalSnackBar(
              state.actionValue!
                  ? LocaleKeys.snackbar_completeSession
                  : LocaleKeys.snackbar_incompleteSession,
              SnackBarStatus.success,
            );
            context.read<SessionDetailsCubit>().getSessionDetails(sessionId);
          },
        );
      },
      child: BlocBuilder<SessionConfirmationCubit, SessionConfirmationState>(
        builder: (context, state) {
          final sessionConfirmationCubit =
              context.read<SessionConfirmationCubit>();

          return SessionDetailsReciterConfirmationContainer(
            stepTitle:
                LocaleKeys.sessionDetails_sessionConfirmation_step2_stepTitle,
            title: LocaleKeys.sessionDetails_sessionConfirmation_step2_title,
            stepNum: "2",
            child: Column(
              children: [
                36.verticalSpace,
                AlignedGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.w,
                  crossAxisSpacing: 20.w,
                  itemCount: state.pages.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      side: BorderSide(
                        color: AppColors.textColor.withOpacity(0.2),
                        width: 1.5,
                      ),
                      value: state.pages[index].isChecked,
                      onChanged: (val) {
                        sessionConfirmationCubit.updatePages(
                          state.pages[index].value,
                          state.pages[index].isChecked,
                        );
                      },
                      title: Text(
                          "${context.tr(LocaleKeys.readingProgress_page)} ${state.pages[index].value}",
                          style: AppTextStyles.font16TextW400),
                    );
                  },
                ),
                20.verticalSpace,
                AppElevatedButton(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side:
                        BorderSide(color: AppColors.textColor.withOpacity(0.6)),
                  ),
                  backgroundColor: AppColors.lighterGrey2,
                  fixedSize: const Size.fromWidth(double.infinity),
                  onPressed: () => sessionConfirmationCubit.addPage(sessionId),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        width: 12.w,
                        height: 12.w,
                        Assets.icons.add.path,
                        colorFilter: ColorFilter.mode(
                          AppColors.textColor.withOpacity(0.6),
                          BlendMode.srcIn,
                        ),
                      ),
                      4.horizontalSpace,
                      Text(
                        context.tr(LocaleKeys.button_addPage),
                        style: AppTextStyles.font14TextW400OP6,
                      )
                    ],
                  ),
                ),
                20.verticalSpace,
                AppElevatedButton(
                  padding: EdgeInsets.zero,
                  fixedSize: Size(160.w, 40.w),
                  onPressed: state.pages.any((page) => page.isChecked)
                      ? () => sessionConfirmationCubit.confirmSession(sessionId)
                      : null,
                  child: Text(context.tr(LocaleKeys.button_confirm)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
