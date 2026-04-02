import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/models/base_status.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../core/widgets/app_shadow_container.dart';
import '../../../../core/widgets/form_fields/password_text_field.dart';
import '../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../bloc/account_settings/account_settings_cubit.dart';

@RoutePage()
class AccountChangePasswordPage extends StatelessWidget {
  const AccountChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<AccountSettingsCubit>();

    return AppBlocWrapperScreen<AccountSettingsCubit, AccountSettingsState>(
      bloc: cubit,
      blocListener: BlocListener<AccountSettingsCubit, AccountSettingsState>(
        listenWhen: (previous, current) =>
            previous.status != current.status &&
            current.status == const BaseStatus.success() &&
            current.backendMessage.isNotEmpty,
        listener: (context, state) {
          showAppModalBottomSheet(
            isDismissible: true,
            mainBtnLabel: context.tr(LocaleKeys.button_ok),
            context: context,
            mainOnPressed: () {
              context.router.popForced();
              context.router.popForced();
            },
            title: context.tr(LocaleKeys.accountSettings_changePassword_title),
            subTitle: state.backendMessage,
            imagePath: Assets.images.sucessPopup.path,
          );
        },
      ),
      child: AccountChangePasswordContent(cubit: cubit),
    );
  }
}

class AccountChangePasswordContent extends StatefulWidget {
  final AccountSettingsCubit cubit;
  const AccountChangePasswordContent({super.key, required this.cubit});

  @override
  State<AccountChangePasswordContent> createState() =>
      _AccountChangePasswordContentState();
}

class _AccountChangePasswordContentState
    extends State<AccountChangePasswordContent> {
  @override
  Widget build(BuildContext context) {
    final accountSettingsCubit = context.read<AccountSettingsCubit>();

    return BlocBuilder<AccountSettingsCubit, AccountSettingsState>(
      builder: (context, state) {
        return AppCustomScrollView(
          appPageHeader: AppPageHeader.subtitle,
          title: LocaleKeys.accountSettings_changePassword_title,
          bottomChildren: [
            AppStepsButton(
              onPressed: () {
                final form = accountSettingsCubit.formKey.currentState;
                if (form == null) return;

                FocusScope.of(context).unfocus();
                if (!form.validate()) return;
                accountSettingsCubit.changePassword();
              },
              icon: state.status.maybeWhen(
                loading: () => const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                orElse: () => const SizedBox(),
              ),
              label: Text(context.tr(LocaleKeys.button_save)),
            ),
          ],
          children: [
            20.verticalSpace,
            AppShadowContainer(
              child: Form(
                key: accountSettingsCubit.formKey,
                child: Column(
                  children: [
                    PasswordTextField(
                      label: AppFormFields.oldPassword,
                      textEditingController: accountSettingsCubit.oldPassword,
                    ),
                    PasswordTextField(
                      label: AppFormFields.newPassword,
                      textEditingController: accountSettingsCubit.newPassword,
                    ),
                    PasswordTextField(
                      label: AppFormFields.confirmPassword,
                      textEditingController:
                          accountSettingsCubit.confirmPassword,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return context
                              .tr(LocaleKeys.form_error_requiredField);
                        }
                        if (value != accountSettingsCubit.newPassword.text) {
                          return 'Passwords do not match.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
