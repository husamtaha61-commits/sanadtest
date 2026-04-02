import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/form_fields/email_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../data/models/requests/user_send_otp_request.dart';
import '../bloc/auth/auth_cubit.dart';
import '../widgets/action_text.dart';
import '../widgets/auth_bloc_wrapper.dart';
import '../widgets/auth_container.dart';
import '../widgets/auth_form.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBlocWrapper(
      success: () => context.router.push(const VerificationRoute()),
      child: const AuthContainer(child: _ForgotPasswordForm()),
    );
  }
}

class _ForgotPasswordForm extends StatefulWidget {
  const _ForgotPasswordForm();

  @override
  State<_ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<_ForgotPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();

  void send() {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().sendOtp(UserSendOtpRequest(email: email.text), true);
    }
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: LocaleKeys.forgotPassword_form_title,
      formKey: formKey,
      children: [
        36.verticalSpace,
        SvgPicture.asset(
          Assets.images.forgotPassword.path,
          width: 155.w,
          height: 155.w,
        ),
        40.verticalSpace,
        Text(
          context.tr(LocaleKeys.forgotPassword_form_st1),
          style: AppTextStyles.font16TextW400OP8,
        ),
        28.verticalSpace,
        EmailTextField(textEditingController: email),
        38.verticalSpace,
        AppElevatedButton(
          onPressed: send,
          backgroundColor: AppColors.goldenOrange,
          child: Text(
            context.tr(LocaleKeys.button_send),
            style: AppTextStyles.font15WhiteW400,
          ),
        ),
        24.verticalSpace,
        ActionText(
          text: context.tr(LocaleKeys.forgotPassword_form_actionText),
          onTap: () {
            context.router.removeLast();
          },
        )
      ],
    );
  }
}
