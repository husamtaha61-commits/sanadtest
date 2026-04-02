import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/utils/app_form_validator.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/form_fields/password_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../data/models/requests/user_reset_password_request.dart';
import '../bloc/auth/auth_cubit.dart';
import '../widgets/action_text.dart';
import '../widgets/auth_bloc_wrapper.dart';
import '../widgets/auth_container.dart';
import '../widgets/auth_form.dart';

@RoutePage()
class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return AuthBlocWrapper(
      success: () {
        context.router.replaceAll([LoginRoute()], updateExistingRoutes: false);
        showGlobalSnackBar(
            LocaleKeys.snackbar_passwordReset, SnackBarStatus.success);
      },
      child: const AuthContainer(
        child: _CreateNewPasswordForm(),
      ),
    );
  }
}

class _CreateNewPasswordForm extends StatefulWidget {
  const _CreateNewPasswordForm();

  @override
  State<_CreateNewPasswordForm> createState() => _CreateNewPasswordFormState();
}

class _CreateNewPasswordFormState extends State<_CreateNewPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isObsecuredPassword = true;
  bool isObsecuredConfirmPassword = true;

  void save() {
    if (formKey.currentState!.validate()) {
      final authCubit = context.read<AuthCubit>();
      authCubit.resetPassword(
        UserResetPasswordRequest(
            email: authCubit.state.email,
            password: password.text,
            confirmPassword: confirmPassword.text,
            resetToken: authCubit.state.resetToken),
      );
    }
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: LocaleKeys.createNewPassword_form_title,
      formKey: formKey,
      children: [
        36.verticalSpace,
        SvgPicture.asset(
          Assets.images.createPassword.path,
          width: 150.w,
          height: 150.w,
        ),
        40.verticalSpace,
        Text(
          context.tr(LocaleKeys.createNewPassword_form_st1),
          style: AppTextStyles.font16TextW400OP8,
        ),
        28.verticalSpace,
        PasswordTextField(
          label: AppFormFields.password,
          textEditingController: password,
          onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        ),
        8.verticalSpace,
        PasswordTextField(
          label: AppFormFields.confirmPassword,
          textEditingController: confirmPassword,
          validator: (value) => AppFormValidator.validateField(
              AppFormFields.confirmPassword, value, password.text),
        ),
        38.verticalSpace,
        AppElevatedButton(
          onPressed: save,
          backgroundColor: AppColors.goldenOrange,
          child: Text(
            context.tr(LocaleKeys.button_save),
            style: AppTextStyles.font14WhiteW500,
          ),
        ),
        24.verticalSpace,
        ActionText(
          text: LocaleKeys.createNewPassword_form_actionText.tr(),
          onTap: () {
            context.read<AuthCubit>().signout();
            context.router
                .replaceAll([LoginRoute()], updateExistingRoutes: false);
          },
        )
      ],
    );
  }
}
