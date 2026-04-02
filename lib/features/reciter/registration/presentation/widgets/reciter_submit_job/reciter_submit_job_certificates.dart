import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/services/image_picker_service.dart';

import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/widgets/app_elevated_button.dart';

import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/widgets/app_document_name_preview.dart';
import '../../../../../../core/widgets/app_error_msg.dart';
import '../../../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../../../core/widgets/steps/app_steps_form_text.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../../domain/entities/certificate_data.dart';
import '../../bloc/reciter_submit_job/reciter_submit_job_cubit.dart';
import 'reciter_submit_job_certificates_upload_recitation_document.dart';

class ReciterSubmitJobCertificates extends StatelessWidget {
  const ReciterSubmitJobCertificates({super.key});

  @override
  Widget build(BuildContext context) {
    final lookupState = context.read<LookupCubit>().state;
    final reciterSubmitJobCubit = context.read<ReciterSubmitJobCubit>();

    return BlocBuilder<ReciterSubmitJobCubit, ReciterSubmitJobState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppStepsFormText(
                text: LocaleKeys.reciter_submitJob_certificates_title),
            25.verticalSpace,
            const AppStepsFormText(
              text: LocaleKeys.reciter_submitJob_certificates_st1,
              isSubTitle: true,
            ),
            32.verticalSpace,
            AppSingleMenu<BaseField>(
              label: LocaleKeys.form_field_recitation,
              items: lookupState.recitations.map((e) => e).toList(),
              itemAsString: (item) => item.name,
              selectedItem: reciterSubmitJobCubit.recitation,
              onItemSelected: reciterSubmitJobCubit.setRecitation,
              customKey: reciterSubmitJobCubit.recitationKey,
              selectedItemName: reciterSubmitJobCubit.recitation == null ? '' : reciterSubmitJobCubit.recitation!.name,
              fieldName: AppFormFields.recitation
            ),
            20.verticalSpace,
            AppSingleMenu<BaseField>(
              label: LocaleKeys.form_field_recitationType,
              items: lookupState.recitationTypes.map((e) => e).toList(),
              itemAsString: (item) => item.name,
              selectedItem: reciterSubmitJobCubit.recitationType,
              onItemSelected: reciterSubmitJobCubit.setRecitationType,
              customKey: reciterSubmitJobCubit.recitationTypeKey,
              fieldName: AppFormFields.recitationType,
              selectedItemName: reciterSubmitJobCubit.recitationType == null ? '' : reciterSubmitJobCubit.recitationType!.name,
            ),
            17.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: AppElevatedButton(
                fixedSize: const Size.fromWidth(double.infinity),
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.w),
                onPressed: reciterSubmitJobCubit.addRecitation,
                child: Text(
                  context.tr(LocaleKeys.button_add),
                  style: AppTextStyles.font15WhiteW400,
                ),
              ),
            ),
            31.verticalSpace,
            if (reciterSubmitJobCubit
                .errorMsg['certificatesAfterAdding']!.isNotEmpty)
              AppErrorMsg(
                padding: EdgeInsets.only(bottom: 6.w),
                text:
                    reciterSubmitJobCubit.errorMsg['certificatesAfterAdding']!,
              ),
            ...reciterSubmitJobCubit.state.certificates.asMap().map((i, e) {
              return MapEntry(
                i,
                _RecitationDocument(
                  certificateData: e,
                  index: i,
                ),
              );
            }).values,
            14.verticalSpace,
            const Divider(
              height: 1,
              color: AppColors.goldenOrange,
            ),
            31.verticalSpace,
            Text(
              context.tr(
                  LocaleKeys.reciter_submitJob_certificates_otherCertificates),
              style: AppTextStyles.font14TextW400,
            ),
            20.verticalSpace,
            AppElevatedButton(
              onPressed: () async {
                final files =
                    await getIt<ImagePickerService>().pickImage(context, allowMultiple: true);
                if (files != null) {
                  reciterSubmitJobCubit.uploadOtherCertificates((files is List
                      ? files
                      : [files as XFile]) as List<XFile>);
                }
              },
              fixedSize: Size(104.w, 39.w),
              elevation: 0,
              backgroundColor: const Color(0xffE5ECF2),
              textStyle: AppTextStyles.font15NavyBlueW400,
              foregroundColor: AppColors.navyBlue,
              child: const Text(LocaleKeys.button_upload).tr(),
            ),
            ...reciterSubmitJobCubit.state.otherCertificates.asMap().map(
              (i, image) {
                return MapEntry(
                  i,
                  Padding(
                    padding: EdgeInsets.only(top: 20.w),
                    child: AppDocumentNamePreview(
                      documentName: image.name,
                      removeDocument: () =>
                          reciterSubmitJobCubit.removeOtherCertificate(i),
                    ),
                  ),
                );
              },
            ).values,
          ],
        );
      },
    );
  }
}

class _RecitationDocument extends StatelessWidget {
  final CertificateData certificateData;
  final int index;
  const _RecitationDocument({
    required this.certificateData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final reciterSubmitJobCubit = context.read<ReciterSubmitJobCubit>();

    return Padding(
      padding: EdgeInsets.only(bottom: 17.w),
      child: certificateData.certificateFile != null
          ? Column(
              children: [
                AppDocumentNamePreview(
                  documentName: certificateData.certificateFile!.name,
                  removeDocument: () =>
                      reciterSubmitJobCubit.removeCertificate(index),
                ),
                19.verticalSpace,
                AppElevatedButton(
                  onPressed: () async {
                    final XFile? file =
                        await getIt<ImagePickerService>().pickImage(context);
                    if (file != null) {
                      reciterSubmitJobCubit.uploadCertificate(index, file);
                    }
                  },
                  fixedSize: Size(131.w, 40.w),
                  elevation: 0,
                  backgroundColor: const Color(0xffE5ECF2),
                  textStyle: AppTextStyles.font15NavyBlueW400,
                  foregroundColor: AppColors.navyBlue,
                  child: const Text(LocaleKeys.button_replace).tr(),
                ),
              ],
            )
          : ReciterSubmitJobCertificatesUploadRecitationDocument(
              uploadDocument: () async {
                final XFile? file =
                    await getIt<ImagePickerService>().pickImage(context);
                if (file != null) {
                  reciterSubmitJobCubit.uploadCertificate(index, file);
                }
              },
              recitation: certificateData.recitationName,
              recitationType: certificateData.recitationTypeName,
              removeDocument: () =>
                  reciterSubmitJobCubit.removeCertificate(index),
            ),
    );
  }
}
