import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/app_error_msg.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../core/utils/app_form_validator.dart';
import '../../../../../../core/widgets/app_checkbox.dart';
import '../../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../../core/widgets/form_fields/password_text_field.dart';
import '../../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../bloc/reciter_complete_profile/reciter_complete_profile_cubit.dart';
import '../../../../../../gen/assets.gen.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../core/services/image_picker_service.dart';
import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/widgets/steps/app_steps_form_text.dart';
import '../../../../../../gen/fonts.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';

class ReciterCompleteProfileProfileCompletion extends StatelessWidget {
  const ReciterCompleteProfileProfileCompletion({super.key});

  @override
  Widget build(BuildContext context) {
    final reciterCompleteProfileCubit =
        context.read<ReciterCompleteProfileCubit>();

    return BlocBuilder<ReciterCompleteProfileCubit,
        ReciterCompleteProfileState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _WelcomeCard(),
            32.verticalSpace,
            const AppStepsFormText(
                text:
                    LocaleKeys.reciter_completeProfile_profileCompletion_title),
            12.verticalSpace,
            const AppStepsFormText(
              text: LocaleKeys.reciter_completeProfile_profileCompletion_st1,
              isSubTitle: true,
            ),
            16.verticalSpace,
            _CheckboxWithText(
              value: state.isChecked1,
              onChanged: (value) =>
                  reciterCompleteProfileCubit.setCheckbox1(value),
              errorMsg: reciterCompleteProfileCubit.errorMsg['isChecked1']!,
              textPart1:
                  LocaleKeys.reciter_completeProfile_profileCompletion_guide1P1,
              textPart2:
                  LocaleKeys.reciter_completeProfile_profileCompletion_guide1P2,
              url: "https://www.sanadquran.com/ar/teacher-policies",
              context: context,
            ),
            10.verticalSpace,
            _CheckboxWithText(
              value: state.isChecked2,
              onChanged: (value) =>
                  reciterCompleteProfileCubit.setCheckbox2(value),
              errorMsg: reciterCompleteProfileCubit.errorMsg['isChecked2']!,
              textPart1:
                  LocaleKeys.reciter_completeProfile_profileCompletion_guide2P1,
              textPart2:
                  LocaleKeys.reciter_completeProfile_profileCompletion_guide2P2,
              url: "https://www.sanadquran.com/ar/teachers-guide",
              context: context,
            ),
            20.verticalSpace,
            _ProfilePicture(
              errorMsg: reciterCompleteProfileCubit.errorMsg['profilePicture']!,
              setImage: reciterCompleteProfileCubit.setImage,
              profilePicture: state.profilePicture,
            ),
            35.verticalSpace,
            Text(
              context.tr(LocaleKeys
                  .reciter_completeProfile_profileCompletion_description),
              style: AppTextStyles.font16TextW600,
            ),
            AppTextFormField(
              maxLines: 4,
              maxLength: 200,
              textEditingController: reciterCompleteProfileCubit.description,
              validator: (value) {
                if (isEmpty(value)) {
                  return context.tr(LocaleKeys.form_error_requiredField);
                }
                return null;
              },
            ),
            8.verticalSpace,
            Text(
              context.tr(LocaleKeys
                  .reciter_completeProfile_profileCompletion_passowrdTitle),
              style: AppTextStyles.font16TextW600,
            ),
            6.verticalSpace,
            PasswordTextField(
              label: AppFormFields.password,
              textEditingController: reciterCompleteProfileCubit.password,
            ),
            24.verticalSpace,
            PasswordTextField(
              label: AppFormFields.confirmPassword,
              textEditingController:
                  reciterCompleteProfileCubit.confirmPassword,
              validator: (value) => AppFormValidator.validateField(
                AppFormFields.confirmPassword,
                value,
                reciterCompleteProfileCubit.password.text,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard();

  @override
  Widget build(BuildContext context) {
    final userState = context.read<UserCubit>().state;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(21.r),
            child: SvgPicture.asset(
              Assets.images.boxBgGradient.path,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context
                    .tr(LocaleKeys.reciter_completeProfile_welcomeCard_welcome),
                style: AppTextStyles.font32WhiteW400,
              ),
              9.verticalSpace,
              Text(
                '${userState.firstName} ${userState.middleName}',
                style: TextStyle(
                  fontFamily: FontFamily.whisper,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SvgPicture.asset(Assets.images.divider.path),
              30.verticalSpace,
              Row(
                children: [
                  Container(
                    width: 7.w,
                    height: 7.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5.w),
                      color: Colors.white,
                    ),
                  ),
                  10.horizontalSpace,
                  Flexible(
                    child: Text(
                      // "${context.tr(LocaleKeys.reciter_submitJob_certificates_recitationDocument)} Hafs 'an 'Asim",
                      "The recitation of Hafs 'an 'Asim",
                      style: AppTextStyles.font14WhiteW400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  final XFile? profilePicture;
  final String errorMsg;
  final void Function(XFile) setImage;
  const _ProfilePicture(
      {this.profilePicture, required this.errorMsg, required this.setImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: profilePicture != null
                    ? Image.file(
                        File(profilePicture!.path),
                        width: 75.w,
                        height: 90.w,
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset(
                        Assets.images.avatar.path,
                        fit: BoxFit.cover,
                        width: 75.w,
                        height: 90.w,
                      ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(LocaleKeys
                          .reciter_completeProfile_profileCompletion_profilePicture_title),
                      style: AppTextStyles.font16TextW600,
                    ),
                    4.verticalSpace,
                    Text(
                      context.tr(LocaleKeys
                          .reciter_completeProfile_profileCompletion_profilePicture_st1),
                      style: AppTextStyles.font12TextW400,
                      softWrap: true,
                    ),
                    10.verticalSpace,
                    AppElevatedButton(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      onPressed: () async {
                        final imageFile = await getIt<ImagePickerService>()
                            .pickImage(context);
                        if (imageFile != null) {
                          setImage(imageFile);
                        }
                      },
                      fixedSize: Size(double.infinity, 30.w),
                      backgroundColor: AppColors.goldenOrange,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            Assets.icons.uploadWhite.path,
                            width: 12.w,
                            height: 12.w,
                          ),
                          10.horizontalSpace,
                          Text(
                            context.tr(LocaleKeys.button_uploadImage),
                            style: AppTextStyles.font12WhiteW400,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (errorMsg.isNotEmpty) AppErrorMsg(text: errorMsg)
      ],
    );
  }
}

class _CheckboxWithText extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String errorMsg;
  final String textPart1;
  final String textPart2;
  final String url;
  final BuildContext context;

  const _CheckboxWithText({
    required this.value,
    required this.onChanged,
    required this.errorMsg,
    required this.textPart1,
    required this.textPart2,
    required this.url,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return AppCheckbox(
      value: value,
      onChanged: onChanged,
      errorMsg: errorMsg,
      child: Text.rich(
        TextSpan(
          style: AppTextStyles.font12TextW400,
          children: [
            TextSpan(
              text: this.context.tr(textPart1),
            ),
            TextSpan(
              text: this.context.tr(textPart2),
              style: AppTextStyles.font12NavyBlueW600
                  .copyWith(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.router.push(FullRoute(url: url));
                },
            ),
          ],
        ),
      ),
    );
  }
}
