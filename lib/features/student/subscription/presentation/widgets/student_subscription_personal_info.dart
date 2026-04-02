import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/entities/base_field.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/app_form_validator.dart';

import '../../../../../core/widgets/app_checkbox.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/form_fields/app_multi_menu.dart';
import '../../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../../core/widgets/form_fields/date_text_field.dart';
import '../../../../../core/widgets/form_fields/name_text_field.dart';
import '../../../../../core/widgets/form_fields/phone_text_field.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../bloc/subscription/subscription_cubit.dart';
import '../../../../../core/widgets/steps/app_steps_form_text.dart';

class StudentSubscriptionPersonalInfo extends StatefulWidget {
  const StudentSubscriptionPersonalInfo({super.key});

  @override
  State<StudentSubscriptionPersonalInfo> createState() =>
      _StudentSubscriptionPersonalInfoState();
}

class _StudentSubscriptionPersonalInfoState
    extends State<StudentSubscriptionPersonalInfo> {
  @override
  void initState() {
    super.initState();
    final subscriptionCubit = context.read<SubscriptionCubit>();
    final userInfo = context.read<UserCubit>().state.userInfo!;

    if (subscriptionCubit.firstName.text.isEmpty) {
      subscriptionCubit.firstName.text = userInfo.firstName;
    }
    if (subscriptionCubit.middleName.text.isEmpty) {
      subscriptionCubit.middleName.text = userInfo.middleName ?? '';
    }
    if (subscriptionCubit.lastName.text.isEmpty) {
      subscriptionCubit.lastName.text = userInfo.lastName;
    }
    if (subscriptionCubit.dateOfBirth.text.isEmpty) {
      subscriptionCubit.dateOfBirth.text = userInfo.dateOfBirth;
    }

    subscriptionCubit.gender = userInfo.gender != null
        ? BaseField(id: userInfo.gender!.index + 1, name: userInfo.gender!.name)
        : null;

    subscriptionCubit.nationality = userInfo.nationality!.name.isNotEmpty
        ? BaseField(
            id: userInfo.nationality!.id, name: userInfo.nationality!.name)
        : null;

    subscriptionCubit.mainLanguage = userInfo.mainLanguage != null
        ? BaseField(
            id: userInfo.mainLanguage!.index + 1,
            name: userInfo.mainLanguage!.name)
        : null;

    // Convert to BaseField and remove duplicates based on id
    final learningLanguagesMap = <int, BaseField>{};
    for (var lang in userInfo.learningLanguages) {
      final baseField = BaseField(id: lang.index + 1, name: lang.name);
      learningLanguagesMap[baseField.id] = baseField;
    }
    subscriptionCubit.learningLanguages = learningLanguagesMap.values.toList();

    subscriptionCubit.country = userInfo.placeOfResidence!.name.isNotEmpty
        ? BaseField(
            id: userInfo.placeOfResidence!.id,
            name: userInfo.placeOfResidence!.name)
        : null;

    subscriptionCubit.recitation = userInfo.studentRecitations.isNotEmpty
        ? userInfo.studentRecitations.first.recitation
        : null;

    // subscriptionCubit.phone.value = PhoneNumber(
    //   isoCode: IsoCode.JO,
    //   nsn: userInfo.phoneNumber?.replaceFirst('962', '') ?? '',
    // );

    // Ensure the NSN is correct (Jordan country code 962)
    final userPhone = userInfo.phoneNumber ?? ''; // e.g., "962787323216"
    final nsn =
        userPhone.startsWith('962') ? userPhone.substring(3) : userPhone;

    subscriptionCubit.phone.value = PhoneNumber(
      isoCode: IsoCode.JO,
      nsn: nsn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionCubit = context.read<SubscriptionCubit>();
    final lookUpState = context.read<LookupCubit>().state;

    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppStepsFormText(
                text: LocaleKeys.subscription_personal_title),
            25.verticalSpace,
            NameTextField(
              label: AppFormFields.firstName,
              textEditingController: subscriptionCubit.firstName,
              readOnly: !subscriptionCubit.canEditField('firstName'),
            ),
            18.verticalSpace,
            _MiddleNameTextField(
              controller: subscriptionCubit.middleName,
              enabled: subscriptionCubit.canEditField('middleName'),
            ),
            18.verticalSpace,
            NameTextField(
              label: AppFormFields.lastName,
              textEditingController: subscriptionCubit.lastName,
              readOnly: !subscriptionCubit.canEditField('lastName'),
            ),
            18.verticalSpace,
            AppSingleMenu<BaseField>(
              label: LocaleKeys.form_field_gender,
              items: lookUpState.genders,
              itemAsString: (item) => item.name,
              selectedItem: subscriptionCubit.gender,
              onItemSelected: subscriptionCubit.setGender,
              selectedItemName: subscriptionCubit.gender?.name ?? '',
              fieldName: AppFormFields.gender,
              enabled: subscriptionCubit.canEditField('gender'),
            ),
            18.verticalSpace,
            DateTextField(
                useBirthOfDateValidator: true,
                textEditingController: subscriptionCubit.dateOfBirth,
                minimumAge: 13,
                label: LocaleKeys.form_field_dateOfBirth,
                onChanged: () => subscriptionCubit.updateCheckboxDate(false),
                readOnly: !subscriptionCubit.canEditField('dateOfBirth')),
            18.verticalSpace,
            if (subscriptionCubit.isNeedParentConfirmation) ...[
              AppCheckbox(
                value: state.isCheckedDate,
                onChanged: (value) => subscriptionCubit
                        .canEditField('isCheckedDate')
                    ? (value) => subscriptionCubit.updateCheckboxDate(value!)
                    : null,
                errorMsg: subscriptionCubit.errorMsg['isCheckedDate'],
                child: Padding(
                  padding: EdgeInsets.only(bottom: 4.w),
                  child: Text(
                    context.tr(LocaleKeys.subscription_personal_checkbox),
                    style: AppTextStyles.font15NavyBlueW400,
                  ),
                ),
              ),
              20.verticalSpace,
            ],
            AppSingleMenu<BaseField>(
              label: LocaleKeys.form_field_nationality,
              items: lookUpState.nationalities,
              itemAsString: (item) => item.name,
              selectedItem: subscriptionCubit.nationality,
              onItemSelected: subscriptionCubit.setNationality,
              showSearchBox: true,
              selectedItemName: subscriptionCubit.nationality?.name ?? '',
              fieldName: AppFormFields.nationality,
              enabled: subscriptionCubit.canEditField('nationality'),
            ),
            18.verticalSpace,
            AppSingleMenu<BaseField>(
              label: LocaleKeys.form_field_mainLanguage,
              items: lookUpState.languages,
              itemAsString: (item) => item.name,
              selectedItem: subscriptionCubit.mainLanguage,
              onItemSelected: subscriptionCubit.setMainLanguage,
              selectedItemName: subscriptionCubit.mainLanguage?.name ?? '',
              fieldName: AppFormFields.mainLanguage,
              enabled: subscriptionCubit.canEditField('mainLanguage'),
            ),
            18.verticalSpace,
            AppMultiMenu<BaseField>(
              label: LocaleKeys.form_field_learningLanguages,
              items: lookUpState.languages,
              itemAsString: (item) => item.name,
              selectedItems: subscriptionCubit.learningLanguages,
              onItemSelected: subscriptionCubit.setLearningLanguages,
              selectedItemName: subscriptionCubit.learningLanguages.isEmpty
                  ? ''
                  : 'Not Empty',
              fieldName: AppFormFields.learningLanguages,
              enabled: subscriptionCubit.canEditField('learningLanguages'),
            ),
            18.verticalSpace,
            PhoneTextField(
              label: LocaleKeys.form_field_phoneNumber,
              controller: subscriptionCubit.phone,
              enabled: subscriptionCubit.canEditField('phoneNumber'),
            ),
            18.verticalSpace,
            AppSingleMenu<BaseField>(
              label: LocaleKeys.form_field_placeOfResidence,
              items: lookUpState.countries,
              itemAsString: (item) => item.name,
              selectedItem: subscriptionCubit.country,
              onItemSelected: subscriptionCubit.setCountryLanguage,
              showSearchBox: true,
              selectedItemName: subscriptionCubit.country?.name ?? '',
              fieldName: AppFormFields.placeOfResidence,
              enabled: subscriptionCubit.canEditField('countryLanguage'),
            ),
            18.verticalSpace,
            AppSingleMenu<BaseField>(
              label: LocaleKeys.form_field_recitation,
              items: lookUpState.recitations,
              itemAsString: (item) => item.name,
              selectedItem: subscriptionCubit.recitation,
              onItemSelected: subscriptionCubit.setRecitation,
              selectedItemName: subscriptionCubit.recitation?.name ?? '',
              fieldName: AppFormFields.recitation,
              enabled: subscriptionCubit.canEditField('reciatation'),
            ),
          ],
        );
      },
    );
  }
}

class _MiddleNameTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;

  const _MiddleNameTextField({
    required this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      keyboardType: TextInputType.name,
      textEditingController: controller,
      enabled: enabled,
      customLabel: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: context.tr(LocaleKeys.form_field_middleName),
              style: AppTextStyles.font15TextW400,
            ),
            WidgetSpan(child: SizedBox(width: 8.w)),
            TextSpan(
              text: context.tr(LocaleKeys.form_field_optional),
              style: AppTextStyles.font14TextW300OP73,
            ),
          ],
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return null;
        }
        return AppFormValidator.validateName(AppFormFields.middleName, value);
      },
    );
  }
}
