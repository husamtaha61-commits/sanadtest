import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_pin_code_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../data/models/requests/user_email_verify_request.dart';
import '../../data/models/requests/user_send_otp_request.dart';
import '../bloc/auth/auth_cubit.dart';
import '../widgets/action_text.dart';
import '../widgets/auth_bloc_wrapper.dart';
import '../widgets/auth_container.dart';
import '../widgets/auth_form.dart';

@RoutePage()
class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
 
  @override
  Widget build(BuildContext context) {
    return AuthBlocWrapper(
      success: () async {
        final authCubit = context.read<AuthCubit>();
        final authState = authCubit.state;

        if (authState.isForgotPasswordMode) {
          context.router.push(const CreateNewPasswordRoute());
        } 
        else {
          final userCubit = context.read<UserCubit>();

          userCubit.updateUserSettings();
          await userCubit.getUserInfo();

          if (context.mounted) {
            navigateToHomePage(context, handleCustomRouting: true);
            FacebookAppEvents().logViewContent();
          }
        }
      },
      child: const AuthContainer(child: _VerificationForm()),
    );
  }
}

class _VerificationForm extends StatefulWidget {
  const _VerificationForm();

  @override
  State<_VerificationForm> createState() => _VerificationFormState();
}


class _VerificationFormState extends State<_VerificationForm> {
  final formKey = GlobalKey<FormState>();
  final otp = TextEditingController();
  bool canVerify = false;

  void verify() {
    final authCubit = context.read<AuthCubit>();
    final authState = authCubit.state;

    final request = UserEmailVerifiyRequest(
      email: authState.email,
      otp: otp.text,
    );

    if (authState.isForgotPasswordMode) {
      authCubit.validateOtp(request);
    } else {
      authCubit.verifyEmail(request);
    }
  }


  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    final isForgotPasswordMode = authCubit.state.isForgotPasswordMode;
    return AuthForm(
      title: LocaleKeys.verification_form_title,
      formKey: formKey,
      children: [
        36.verticalSpace,
        SvgPicture.asset(
          Assets.images.verifiyEmail.path,
          width: 150.w,
          height: 150.w,
        ),
        40.verticalSpace,
        Text(
          '${context.tr(LocaleKeys.verification_form_st1)} ${authCubit.state.email}',
          style: AppTextStyles.font16TextW400OP8,
        ),
        28.verticalSpace,
        AppPinCodeTextField(
          appContext: context,
          controller: otp,
          onChanged: (value) {
            otp.text = value;
            setState(() => canVerify = otp.text.length == 6);
          },
        ),
        8.verticalSpace,
        Row(
          children: [
            Text('Didn’t receive the code?', style: AppTextStyles.font14BlueDarkW400),
            TextButton(
              onPressed: () {
                context.read<AuthCubit>().sendOtp(
                  UserSendOtpRequest(email: authCubit.state.email), false
                );
              },
              child: Text('RESEND', style: AppTextStyles.font14navyBlueW500),
            ),

          ],
        ),
        50.verticalSpace,
        AppElevatedButton(
          onPressed: canVerify ? verify : null,
          backgroundColor: canVerify ? AppColors.goldenOrange : null,
          child: Text(
            context.tr(LocaleKeys.button_verify),
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        24.verticalSpace,
        ActionText(
          text: context.tr(
            isForgotPasswordMode
                ? LocaleKeys.forgotPassword_form_actionText
                : LocaleKeys.verification_form_actionText,
          ),
          onTap: () {
            authCubit.signout();
            context.router
                .replaceAll([LoginRoute()], updateExistingRoutes: false);
          },
        ),
      ],
    );
  }
}
