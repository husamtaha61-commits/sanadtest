import 'package:auto_route/auto_route.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extenstions/string.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/utils/app_date.dart';
import '../../../../core/utils/app_form_validator.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/form_fields/date_text_field.dart';
import '../../../../core/widgets/form_fields/email_text_field.dart';
import '../../../../core/widgets/form_fields/name_text_field.dart';
import '../../../../core/widgets/form_fields/password_text_field.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../data/models/requests/user_signup_request.dart';
import '../bloc/auth/auth_cubit.dart';
import '../widgets/auth_become_a_reciter_action_text.dart';
import '../widgets/auth_bloc_wrapper.dart';
import '../widgets/auth_container.dart';
import '../widgets/auth_divider.dart';
import '../widgets/auth_form.dart';
import '../widgets/auth_form_footer.dart';
import '../widgets/auth_form_text.dart';
import '../widgets/auth_social_links.dart';

@RoutePage()
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return AuthBlocWrapper(
      success: () async {
        final authState = context.read<AuthCubit>().state;

        if (!authState.isVerified) {
          context.router.push(const VerificationRoute());
          // For signup by email
        } else {
          context.read<UserCubit>().updateUserSettings();
          if (!authState.isLoginCompleted) {
            context.router.push(const CompleteProfileRoute());
            // For signup by social [new user]
          } else {
            navigateToHomePage(context, handleCustomRouting: true);
            FacebookAppEvents().logViewContent();
            // For signup by social [exist user]
          }
        }
      },
      child: const AuthContainer(
        needLangMenu: true,
        child: _RegistrationForm(),
      ),
    );
  }
}

class _RegistrationForm extends StatefulWidget {
  const _RegistrationForm();

  @override
  State<_RegistrationForm> createState() => __RegistrationFormState();
}

class __RegistrationFormState extends State<_RegistrationForm> {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool parantalConsentChecked = false;
  bool needsParentalConsent = false;
  bool isSignUpClicked = false;

  void signUp() {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().signUpByEmail(
            UserSignupRequest(
              firstName: firstName.text.trim(),
              lastName: lastName.text.trim(),
              dateOfBirth: AppDate.appToBEDate(dateOfBirth.text),
              email: email.text.trim(),
              password: password.text,
              confirmPassword: confirmPassword.text,
            ),
          );
    }
  }

   bool _validateParentalConsent() {
    if (needsParentalConsent && !parantalConsentChecked) {
      return false;
    }
    return true;
  }


  @override
  void initState() {
    super.initState();
    dateOfBirth.addListener(_onDateChanged);
  }

  void _onDateChanged() {
    final dob = dateOfBirth.text.toDate(AppDate.ddMMyyyy);
    if (dob == null) return;

    final now = DateTime.now();
    final age = now.year - dob.year - ((now.month < dob.month || (now.month == dob.month && now.day < dob.day)) ? 1 : 0);
    setState(() {
      needsParentalConsent = age >= 13 && age <= 16;
    });
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    dateOfBirth.removeListener(_onDateChanged);
    dateOfBirth.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: LocaleKeys.registration_form_title,
      titleStyle: AppTextStyles.font32TextW700,
      formKey: formKey,
      children: [
        17.verticalSpace,
        const AuthSocialLinks(),
        14.verticalSpace,
        const AuthFormText(
          text: LocaleKeys.registration_form_st1,
          isSubTitle: true,
        ),
        48.verticalSpace,
        NameTextField(
            label: AppFormFields.firstName, textEditingController: firstName),
        18.verticalSpace,
        NameTextField(
            label: AppFormFields.lastName, textEditingController: lastName),
        18.verticalSpace,
        DateTextField(
          useBirthOfDateValidator: true,
          label: LocaleKeys.form_field_dateOfBirth,
          textEditingController: dateOfBirth,
          minimumAge: 13,
        ),
        if (needsParentalConsent)
          ...[
            18.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.w,
                      width: 20.w,
                      child: Checkbox(
                        value: parantalConsentChecked,
                        side: WidgetStateBorderSide.resolveWith(
                          (states) => const BorderSide(color: AppColors.textColor),
                        ),
                        onChanged: (bool? value) {
                          setState(() {
                            parantalConsentChecked = value ?? false;
                          });
                        },
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: Text(
                        tr(LocaleKeys.form_field_parentalApproval),
                        style: AppTextStyles.font15NavyBlueW400,
                      ),
                    ),
                  ],
                ),
                if (!parantalConsentChecked && isSignUpClicked)
                  ...[
                    6.verticalSpace,
                    Text(
                      tr(LocaleKeys.form_field_parentalConsent),
                      style: TextStyle(color: AppColors.errorColor, fontSize: 12.sp),
                    ),
                  ]           
              ],
            ),
          ],
        18.verticalSpace,
        EmailTextField(textEditingController: email),
        18.verticalSpace,
        PasswordTextField(
          label: AppFormFields.password,
          textEditingController: password,
          onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        ),
        18.verticalSpace,
        PasswordTextField(
          label: AppFormFields.confirmPassword,
          textEditingController: confirmPassword,
          textInputAction: TextInputAction.done,
          validator: (value) => AppFormValidator.validateField(
              AppFormFields.confirmPassword, value, password.text),
        ),
        30.verticalSpace,
        AppElevatedButton(
          backgroundColor: AppColors.goldenOrange,
           onPressed: () {
            final isFormValid = formKey.currentState!.validate();
            final isConsentValid = _validateParentalConsent();

            if (isFormValid && isConsentValid) {
              signUp();
            } else {
              setState(() {
                isSignUpClicked = true;
              });
            }
          },
          child: Text(
            context.tr(LocaleKeys.button_signUp),
            style: AppTextStyles.font14WhiteW500,
          ),
        ),
        26.verticalSpace,
        AuthFormFooter(
          text: LocaleKeys.registration_form_st2p1,
          actionText: LocaleKeys.registration_form_st2p2,
          onTap: context.router.removeLast,
        ),
        16.verticalSpace,
        const AuthDivider(),
        16.verticalSpace,
        const AuthBecomeAReciterActionText()
      ],
    );
  }
}
