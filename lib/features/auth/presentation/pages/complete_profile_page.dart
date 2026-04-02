import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/analytics_service.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/utils/app_date.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/form_fields/date_text_field.dart';
import '../../../../core/widgets/form_fields/email_text_field.dart';
import '../../../../core/widgets/form_fields/name_text_field.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../data/models/requests/user_complete_login_by_social_request.dart';
import '../bloc/auth/auth_cubit.dart';
import '../widgets/auth_bloc_wrapper.dart';
import '../widgets/auth_container.dart';
import '../widgets/auth_form.dart';

@RoutePage()
class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({
    super.key,
  });

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<AuthCubit>().signout();
      },
      child: AuthBlocWrapper(
        success: () async {
          await context.read<UserCubit>().getUserInfo();
          if (context.mounted) {
            navigateToHomePage(context, handleCustomRouting: true);

            // Log Facebook analytics
            FacebookAppEvents().logViewContent();
            AnalyticsService.instance.logEvent(
              'complete_profile',
              parameters: {
                'first_name': context.read<AuthCubit>().state.firstName,
                'last_name': context.read<AuthCubit>().state.lastName,
              },
            );
          }
        },
        child: const AuthContainer(child: _CompleteProfileForm()),
      ),
    );
  }
}

class _CompleteProfileForm extends StatefulWidget {
  const _CompleteProfileForm();

  @override
  State<_CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<_CompleteProfileForm> {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final dateOfBirth = TextEditingController();

  void completeProfile() {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().completeLoginBySocial(
            UserCompleteLoginBySocialRequest(
              firstName: firstName.text.trim(),
              lastName: lastName.text.trim(),
              dateOfBirth: AppDate.appToBEDate(dateOfBirth.text),
            ),
          );
    }
  }

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthCubit>().state;
    firstName.text = authState.firstName;
    lastName.text = authState.lastName;
    dateOfBirth.text = authState.dateOfBirth;
    email.text = authState.email;
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    dateOfBirth.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: LocaleKeys.completeProfile_form_title,
      formKey: formKey,
      children: [
        30.verticalSpace,
        NameTextField(
          label: AppFormFields.firstName,
          textEditingController: firstName,
        ),
        18.verticalSpace,
        DateTextField(
          useBirthOfDateValidator: true,
          label: LocaleKeys.form_field_dateOfBirth,
          minimumAge: 13,
          textEditingController: dateOfBirth,
        ),
        18.verticalSpace,
        EmailTextField(
          textEditingController: email,
          enabled: false,
          filled: true,
          fillColor: AppColors.grey.withAlpha(51),
        ),
        30.verticalSpace,
        AppElevatedButton(
          backgroundColor: AppColors.goldenOrange,
          onPressed: completeProfile,
          child: Text(
            context.tr(LocaleKeys.button_continue),
            style: AppTextStyles.font15WhiteW400,
          ),
        ),
      ],
    );
  }
}
