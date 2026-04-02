import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/widgets/form_fields/app_multi_menu.dart';
import '../../../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../../../core/widgets/form_fields/date_text_field.dart';
import '../../../../../../core/widgets/form_fields/email_text_field.dart';
import '../../../../../../core/widgets/form_fields/name_text_field.dart';
import '../../../../../../core/widgets/form_fields/phone_text_field.dart';
import '../../../../../../core/widgets/steps/app_steps_form_text.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../bloc/reciter_submit_job/reciter_submit_job_cubit.dart';

class ReciterSubmitJobPersonalInfo extends StatelessWidget {
  const ReciterSubmitJobPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final reciterSubmitJobCubit = context.read<ReciterSubmitJobCubit>();

    return BlocBuilder<LookupCubit, LookupState>(
      builder: (context, lookUpState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppStepsFormText(
              text: LocaleKeys.reciter_submitJob_personal_title,
            ),
            25.verticalSpace,
            NameTextField(
              key: const ValueKey(AppFormFields.firstName),
              label: AppFormFields.firstName,
              textEditingController: reciterSubmitJobCubit.firstName,
            ),
            18.verticalSpace,
            NameTextField(
              key: const ValueKey(AppFormFields.middleName),
              label: AppFormFields.middleName,
              textEditingController: reciterSubmitJobCubit.middleName,
            ),
            18.verticalSpace,
            NameTextField(
              key: const ValueKey(AppFormFields.lastName),
              label: AppFormFields.lastName,
              textEditingController: reciterSubmitJobCubit.lastName,
            ),
            18.verticalSpace,
            AppSingleMenu<BaseField>(
              label: LocaleKeys.form_field_gender,
              items: lookUpState.genders.map((e) => e).toList(),
              itemAsString: (item) => item.name,
              selectedItem: reciterSubmitJobCubit.gender,
              onItemSelected: reciterSubmitJobCubit.setGender,
              fieldName: AppFormFields.gender,
              selectedItemName : reciterSubmitJobCubit.gender == null ? '' : reciterSubmitJobCubit.gender!.name,
            ),
            18.verticalSpace,
            DateTextField(
              key: const ValueKey(AppFormFields.dateOfBirth),
              useBirthOfDateValidator: true,
              textEditingController: reciterSubmitJobCubit.dateOfBirth,
              minimumAge: 18,
              label: LocaleKeys.form_field_dateOfBirth,
            ),
            18.verticalSpace,
            AppSingleMenu<BaseField>(
              label: LocaleKeys.form_field_nationality,
              items: lookUpState.nationalities.map((e) => e).toList(),
              itemAsString: (item) => item.name,
              selectedItem: reciterSubmitJobCubit.nationality,
              onItemSelected: reciterSubmitJobCubit.setNationality,
              showSearchBox: true,
              fieldName: AppFormFields.nationality,
              selectedItemName: reciterSubmitJobCubit.nationality == null ? '' : reciterSubmitJobCubit.nationality!.name,
            ),
            18.verticalSpace,
            AppSingleMenu<BaseField>(
              label: LocaleKeys.form_field_placeOfResidence,
              items: lookUpState.countries.map((e) => e).toList(),
              itemAsString: (item) => item.name,
              selectedItem: reciterSubmitJobCubit.country,
              onItemSelected: reciterSubmitJobCubit.setCountry,
              showSearchBox: true,
              fieldName: AppFormFields.placeOfResidence,
              selectedItemName: reciterSubmitJobCubit.country == null ? '' : reciterSubmitJobCubit.country!.name,
            ),
            18.verticalSpace,
            PhoneTextField(
              key: const ValueKey(AppFormFields.phoneNumber),
              label: LocaleKeys.form_field_phoneNumber,
              controller: reciterSubmitJobCubit.phone,
            ),
            18.verticalSpace,
            EmailTextField(
              key: const ValueKey(AppFormFields.email),
              textEditingController: reciterSubmitJobCubit.email,
            ),
            18.verticalSpace,
            AppSingleMenu<BaseField>(
              label: LocaleKeys.student_profile_motherLanguage,
              items: lookUpState.languages.map((e) => e).toList(),
              itemAsString: (item) => item.name,
              selectedItem: reciterSubmitJobCubit.motherTongue,
              onItemSelected: reciterSubmitJobCubit.setMotherTongue,
              fieldName: AppFormFields.motherTongue,
              selectedItemName: reciterSubmitJobCubit.motherTongue == null ? '' : reciterSubmitJobCubit.motherTongue!.name,
            ),
            18.verticalSpace,
            AppMultiMenu<BaseField>(
              label: LocaleKeys.form_field_teachingLanguages,
              items: lookUpState.languages.map((e) => e).toList(),
              itemAsString: (item) => item.name,
              selectedItems: reciterSubmitJobCubit.teachingLanguages,
              onItemSelected: reciterSubmitJobCubit.setTeachingLanguages,
              fieldName : AppFormFields.teachingLanguages,
              selectedItemName : reciterSubmitJobCubit.teachingLanguages.isEmpty ? '' : 'Not Empty'
            ),
          ],
        );
      }
    );
  }
}
