import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../core/widgets/app_shadow_container.dart';
import '../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../auth/presentation/bloc/auth/auth_cubit.dart';
import '../bloc/account_settings/account_settings_cubit.dart';

@RoutePage()
class AccountDeletionPage extends StatelessWidget {
  const AccountDeletionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: BlocProvider(
        create: (context) => getIt<AccountSettingsCubit>(),
        child: Builder(builder: (ctx) {
          return BlocListener<AccountSettingsCubit, AccountSettingsState>(
            listener: (ctx, state) => state.status.whenOrNull(
              loading: () => showAppLoadingDialog(ctx),
              failure: (error) => ctx.router.popForced(),
              success: () async {
                ctx.router.popForced();
                if (isStudentRole(context)) {
                  await context.read<AuthCubit>().signout(
                        context: context,
                        isRebuild: true,
                        showSnackbarFn: () => showGlobalSnackBar(
                          LocaleKeys.snackbar_accountDeletion,
                          SnackBarStatus.success,
                        ),
                      );
                } else {
                  context.router.popUntilRoot();
                  showGlobalSnackBar(
                    LocaleKeys.modalBottomSheet_subTitle_st19,
                    SnackBarStatus.success,
                  );
                }
                return null;
              },
            ),
            child: AppCustomScrollView(
              appPageHeader: AppPageHeader.subtitle,
              title: LocaleKeys.accountSettings_accountDeletion_title,
              bottomChildren: [
                AppStepsButton(
                  onPressed: () => showAppModalBottomSheet(
                    isDismissible: true,
                    mainBtnLabel: LocaleKeys.button_delete,
                    secBtnLabel: LocaleKeys.button_cancel,
                    context: ctx,
                    secOnPressed: ctx.router.popForced,
                    mainOnPressed: () {
                      ctx.router.popForced();
                      isStudentRole(ctx)
                          ? ctx.read<AccountSettingsCubit>().deleteAccount()
                          : ctx
                              .read<AccountSettingsCubit>()
                              .reciterDeleteAccountRequest();
                    },
                    title: LocaleKeys.modalBottomSheet_title_deleteAccount,
                    subTitle: LocaleKeys.modalBottomSheet_subTitle_st10,
                    imagePath: Assets.images.deleteAccount.path,
                  ),
                  backgroundColor: AppColors.errorColor,
                  icon: const SizedBox(),
                  label: Text(ctx.tr(LocaleKeys.button_deleteAccount)),
                )
              ],
              children: [
                20.verticalSpace,
                AppShadowContainer(
                  child: Text(
                    ctx.tr(LocaleKeys.accountSettings_accountDeletion_stm1),
                    style: AppTextStyles.font16TextW400OP8,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
