import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/services/image_picker_service.dart';
import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../../core/widgets/app_document_name_preview.dart';
import '../../../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../../../core/widgets/steps/app_steps_form_text.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../reciter/registration/domain/entities/certificate_data.dart';
import '../../../reciter/registration/presentation/bloc/reciter_submit_job/reciter_submit_job_cubit.dart';
import '../../../reciter/registration/presentation/widgets/reciter_submit_job/reciter_submit_job_certificates_upload_recitation_document.dart';
import '../../../shared/presentation/bloc/lookup/lookup_cubit.dart';

class ReciterSubmitJobCertificates extends StatefulWidget {
  final bool renderWithButtons;
  final bool enabled;
  const ReciterSubmitJobCertificates(
      {super.key, this.renderWithButtons = true, this.enabled = true});

  @override
  State<ReciterSubmitJobCertificates> createState() =>
      _ReciterSubmitJobCertificatesState();
}

class _ReciterSubmitJobCertificatesState
    extends State<ReciterSubmitJobCertificates> {
  late ReciterSubmitJobCubit reciterSubmitJobCubit;
  @override
  void initState() {
    super.initState();
    reciterSubmitJobCubit = context.read<ReciterSubmitJobCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final lookupState = context.read<LookupCubit>().state;
    final reciterSubmitJobCubit = context.read<ReciterSubmitJobCubit>();

    return BlocBuilder<ReciterSubmitJobCubit, ReciterSubmitJobState>(
      builder: (context, state) {
        return Form(
          key: reciterSubmitJobCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.dividerGrey),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppStepsFormText(
                      text: LocaleKeys.reciter_submitJob_certificates_st1,
                      isSubTitle: true,
                    ),
                    24.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSingleMenu<BaseField>(
                            enabled: widget.enabled,
                            label: LocaleKeys.form_field_recitation,
                            items:
                                lookupState.recitations.map((e) => e).toList(),
                            itemAsString: (item) => item.name,
                            selectedItem: reciterSubmitJobCubit.recitation,
                            onItemSelected: reciterSubmitJobCubit.setRecitation,
                            customKey: reciterSubmitJobCubit.recitationKey,
                            selectedItemName:
                                reciterSubmitJobCubit.recitation == null
                                    ? ''
                                    : reciterSubmitJobCubit.recitation!.name,
                            fieldName: AppFormFields.recitation),
                        16.verticalSpace,
                        AppSingleMenu<BaseField>(
                          enabled: widget.enabled,
                          label: LocaleKeys.form_field_recitationType,
                          items: lookupState.recitationTypes
                              .map((e) => e)
                              .toList(),
                          itemAsString: (item) => item.name,
                          selectedItem: reciterSubmitJobCubit.recitationType,
                          onItemSelected:
                              reciterSubmitJobCubit.setRecitationType,
                          customKey: reciterSubmitJobCubit.recitationTypeKey,
                          fieldName: AppFormFields.recitationType,
                          selectedItemName:
                              reciterSubmitJobCubit.recitationType == null
                                  ? ''
                                  : reciterSubmitJobCubit.recitationType!.name,
                        ),
                        16.verticalSpace,
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppElevatedButton(
                            fixedSize: const Size.fromWidth(double.infinity),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 6.w),
                            onPressed: widget.enabled
                                ? reciterSubmitJobCubit.addRecitation
                                : () {},
                            child: Text(
                              context.tr(LocaleKeys.button_add),
                              style: AppTextStyles.font15WhiteW400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    36.verticalSpace,
                    if (reciterSubmitJobCubit.state.certificates.isNotEmpty)
                      Column(
                        children: [
                          ...reciterSubmitJobCubit.state.certificates
                              .asMap()
                              .map((i, e) {
                            return MapEntry(
                              i,
                              _RecitationDocument(
                                certificateData: e,
                                index: i,
                                enabled: widget.enabled,
                              ),
                            );
                          }).values,
                          16.verticalSpace,
                        ],
                      )
                  ],
                ),
              ),
              24.verticalSpace,
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.dividerGrey),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      context.tr(LocaleKeys
                          .reciter_submitJob_certificates_otherCertificates),
                      style: AppTextStyles.font14TextW400,
                    ),
                    16.verticalSpace,
                    AppElevatedButton(
                      onPressed: () async {
                        if (widget.enabled) {
                          final files = await getIt<ImagePickerService>()
                              .pickImage(context, allowMultiple: true);
                          if (files != null) {
                            reciterSubmitJobCubit.uploadOtherCertificates(
                                (files is List ? files : [files as XFile])
                                    as List<XFile>);
                          }
                        }
                      },
                      fixedSize: Size(104.w, 39.w),
                      elevation: 0,
                      backgroundColor: const Color(0xffE5ECF2),
                      textStyle: AppTextStyles.font15NavyBlueW400,
                      foregroundColor: AppColors.navyBlue,
                      child: const Text(LocaleKeys.button_upload).tr(),
                    ),
                    16.verticalSpace,
                    ...reciterSubmitJobCubit.state.otherCertificates
                        .asMap()
                        .map(
                      (i, image) {
                        return MapEntry(
                          i,
                          Padding(
                            padding: EdgeInsets.only(top: 16.w),
                            child: AppDocumentNamePreview(
                              documentName: image.name,
                              removeDocument: () => reciterSubmitJobCubit
                                  .removeOtherCertificate(i),
                            ),
                          ),
                        );
                      },
                    ).values,
                  ],
                ),
              ),
              widget.renderWithButtons
                  ? Container(
                      margin: EdgeInsets.only(top: 32.w),
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          AppElevatedButton(
                            onPressed: () {
                              context.router.pop();
                            },
                            backgroundColor: AppColors.navyBlue,
                            child: Text(
                              context.tr(LocaleKeys.button_save),
                              style: AppTextStyles.font15WhiteW400,
                            ),
                          ),
                          16.verticalSpace,
                          AppElevatedButton(
                            onPressed: () {
                              context.router.pop();
                            },
                            backgroundColor: const Color(0xffE5ECF2),
                            textStyle: AppTextStyles.font15NavyBlueW400,
                            foregroundColor: AppColors.navyBlue,
                            child: Text(context.tr(LocaleKeys.button_cancel)),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              24.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}

class _RecitationDocument extends StatelessWidget {
  final CertificateData certificateData;
  final int index;
  final bool enabled;
  const _RecitationDocument({
    required this.certificateData,
    required this.index,
    this.enabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final reciterSubmitJobCubit = context.read<ReciterSubmitJobCubit>();

    return certificateData.certificateFile != null
        ? Column(
            children: [
              AppDocumentNamePreview(
                documentName: certificateData.certificateFile!.name,
                removeDocument: () =>
                    reciterSubmitJobCubit.removeCertificate(index),
              ),
              16.verticalSpace,
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
          );
  }
}
