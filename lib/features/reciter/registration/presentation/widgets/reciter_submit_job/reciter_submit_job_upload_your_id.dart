import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../../../core/widgets/steps/app_steps_user_identity_types.dart';
import '../../../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../bloc/reciter_submit_job/reciter_submit_job_cubit.dart';

import '../../../../../../core/widgets/steps/app_steps_form_text.dart';

import '../../../../../../gen/translations/locale_keys.g.dart';

class ReciterSubmitJobUploadYourId extends StatelessWidget {
  const ReciterSubmitJobUploadYourId({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reciterSubmitJobCubit = context.read<ReciterSubmitJobCubit>();
    final lookupState = context.read<LookupCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppStepsFormText(
          text: LocaleKeys.reciter_submitJob_uploadID_title,
        ),
         BlocBuilder<ReciterSubmitJobCubit, ReciterSubmitJobState>(
          builder: (context, state){
            if (state.document != null){
              return Column(
                children: [
                  25.verticalSpace,
                  Text(
                    reciterSubmitJobCubit.state.document!.name == LocaleKeys.subscription_documents_passport.tr() ? 
                    context.tr(LocaleKeys.subscription_uploadID_passport) : reciterSubmitJobCubit.state.document!.name == LocaleKeys.subscription_documents_identityCard.tr() ? context.tr(LocaleKeys.subscription_uploadID_identityCard) : reciterSubmitJobCubit.state.document!.name == LocaleKeys.subscription_documents_drivingLicense.tr() ? context.tr(LocaleKeys.subscription_uploadID_drivingLicense) : context.tr(LocaleKeys.subscription_uploadID_birthCertificate),
                    style: AppTextStyles.font15TextW400,
                  ),
                ],
              );
            }
            return const SizedBox.shrink();             
          }        
        ),
        20.verticalSpace,
        AppSingleMenu<BaseField>(
          label: LocaleKeys.reciter_submitJob_uploadID_label,
          items: lookupState.userIdTypes.map((e) => e).toList(),
          itemAsString: (item) => item.name,
          selectedItem: reciterSubmitJobCubit.state.document,
          onItemSelected: reciterSubmitJobCubit.setDocument,
          customValidator: reciterSubmitJobCubit.validateDocument,
          fieldName:  LocaleKeys.reciter_submitJob_uploadID_label,
          selectedItemName: reciterSubmitJobCubit.state.document == null ? '' : reciterSubmitJobCubit.state.document!.name,
        ),
        20.verticalSpace,
        BlocBuilder<ReciterSubmitJobCubit, ReciterSubmitJobState>(
          builder: (context, state) {
            return AppStepsUserIdentityTypes(
              documentId: state.document?.id,
              setImage: reciterSubmitJobCubit.setImage,
              unSetImage: reciterSubmitJobCubit.unSetImage,
              backImage: state.backImage,
              frontImage: state.frontImage,
            );
          },
        )
      ],
    );
  }
}
