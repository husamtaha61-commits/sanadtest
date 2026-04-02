import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../../core/entities/base_field.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../../../core/services/image_picker_service.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../auth/data/models/requests/user_change_password_request.dart';
import '../../../../reciter/registration/domain/entities/certificate_data.dart';
import '../../../../shared/domain/entites/user_info.dart';
import '../../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../../domain/model/requests/khitma_suspension_request.dart';
import '../../../domain/model/requests/student_update_account_settings_request.dart';
import '../../../domain/model/requests/submit_reciter_account_settings_request.dart';
import '../../../domain/usecases/change_password_use_case.dart';
import '../../../domain/usecases/delete_account_use_case.dart';
import '../../../domain/usecases/delete_reciter_request_use_case.dart';
import '../../../domain/usecases/khitma_suspension_use_case.dart';
import '../../../domain/usecases/update_reciter_settings_use_casae.dart';
import '../../../domain/usecases/update_student_settings_use_case.dart';

part 'account_settings_state.dart';
part 'account_settings_cubit.freezed.dart';

@injectable
class AccountSettingsCubit extends Cubit<AccountSettingsState> {
  final DeleteAccountUseCase _deleteAccountUseCase;
  final KhitmaSuspensionUseCase _khitmaSuspensionUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final ReciterAccountDeleteRequestUseCase _reciterAccountDeleteRequestUseCase;
  final SubmitStudentAccountSettingsUseCase submitStudentAccountSettingsUseCase;
  final SubmitReciterAccountSettingsUseCase reciterAccountDeleteRequestUseCase;
  final AppPreferences appPreferences;
  final ImagePickerService imagePickerService;
  final LookupCubit lookupCubit;

  AccountSettingsCubit(
    this._deleteAccountUseCase,
    this._khitmaSuspensionUseCase,
    this._changePasswordUseCase,
    this._reciterAccountDeleteRequestUseCase,
    this.submitStudentAccountSettingsUseCase,
    this.reciterAccountDeleteRequestUseCase,
    this.appPreferences,
    this.imagePickerService,
    this.lookupCubit,
  ) : super(const AccountSettingsState());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    oldPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    return super.close();
  }

  void initialize() {
    final userInfo = appPreferences.getUserCachedResponse();

    firstNameController.text = userInfo.firstName;
    middleNameController.text = userInfo.middleName ?? '';
    lastNameController.text = userInfo.lastName;
    final isoDob = userInfo.dateOfBirth;
    final formattedDob = isoDob.isNotEmpty
        ? DateFormat("dd/MM/yyyy").format(DateTime.parse(isoDob))
        : '';
    dateOfBirthController.text = formattedDob;

    emailController.text = userInfo.email;

    emit(state.copyWith(
      firstName: userInfo.firstName,
      middleName: userInfo.middleName ?? '',
      lastName: userInfo.lastName,
      dateOfBirth: formattedDob,
      email: userInfo.email,
      nationality: userInfo.nationality != null
          ? BaseField(
              id: userInfo.nationality!.id,
              name: userInfo.nationality!.name,
            )
          : null,
      country: userInfo.placeOfResidence != null
          ? BaseField(
              id: userInfo.placeOfResidence!.id,
              name: userInfo.placeOfResidence!.name,
            )
          : null,
      mainLanguage: userInfo.mainLanguage,
      learningLanguages: userInfo.learningLanguages,
      phoneNumber: userInfo.phoneNumber != null
          ? PhoneNumber.parse(userInfo.phoneNumber!)
          : null,
      recitation: userInfo.studentRecitations.isNotEmpty
          ? userInfo.studentRecitations.first.recitation
          : null,
      genderId: userInfo.gender?.intValue ?? 0,
      isReadMode: true,
    ));
  }

  // -------------------- Setters for personal info -------------------- //
  void setFirstName(String value) {
    firstNameController.text = value;
    emit(state.copyWith(firstName: value));
  }

  void setMiddleName(String value) {
    middleNameController.text = value;
    emit(state.copyWith(middleName: value));
  }

  void setLastName(String value) {
    lastNameController.text = value;
    emit(state.copyWith(lastName: value));
  }

  void setEmail(String value) {
    emailController.text = value;
    emit(state.copyWith(email: value));
  }

  void setDateOfBirth(String value) {
    dateOfBirthController.text = value;
    emit(state.copyWith(dateOfBirth: value));
  }

  void setPhoneNumber(PhoneNumber value) =>
      emit(state.copyWith(phoneNumber: value));

  void setNationality(BaseField? value) =>
      emit(state.copyWith(nationality: value));

  void setCountry(BaseField? value) => emit(state.copyWith(country: value));

  void setMainLanguage(Language? value) =>
      emit(state.copyWith(mainLanguage: value));

  void setLearningLanguages(List<Language> values) =>
      emit(state.copyWith(learningLanguages: values));

  void setRecitation(BaseField? value) =>
      emit(state.copyWith(recitation: value));

  void setGenderId(int? id) => emit(state.copyWith(genderId: id));

  void setUserIdentityTypeId(int? id) =>
      emit(state.copyWith(userIdentityTypeId: id));

  void setProfileImage(XFile? file) =>
      emit(state.copyWith(profileImageFile: file));

  void setVideoFile(XFile? file) => emit(state.copyWith(videoFile: file));

  void setIdentityFiles(List<XFile> files) =>
      emit(state.copyWith(userIdentityFiles: files));

  void setReadMode(bool value) => emit(state.copyWith(isReadMode: value));

  UserInfo getCurrentUserInfo() {
    return appPreferences.getUserCachedResponse();
  }

  LookupState getLookupData() {
    return lookupCubit.state;
  }

  List<CertificateData> getCertificateData(List<CertificateData> certificates) {
    return certificates.map((c) {
      return CertificateData(
        recitationId: c.recitationId,
        recitationTypeId: c.recitationTypeId,
        certificateFile: c.certificateFile,
      );
    }).toList();
  }

  Future<XFile?> selectDocument(BuildContext context) async {
    final result = await imagePickerService.pickImage(
      context,
      allowMultiple: true,
    );

    if (result != null) {
      final files = result is XFile ? [result] : (result as List<XFile>);
      setIdentityFiles(files);
      return files.first;
    }

    return null;
  }

  Future<bool> submitAccountSettings(BuildContext context,
      List<CertificateData> certificates, List<XFile> otherCertificates) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    final isStudent = isStudentRole(context);

    if (isStudent) {
      return await _submitStudentSettings();
    } else {
      return await _submitReciterSettings(certificates, otherCertificates);
    }
  }

  Future<bool> _submitStudentSettings() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final input = dateOfBirthController.text.trim();
    final date = DateFormat('dd/MM/yyyy').parse(input);
    final formattedDate = DateFormat('yyyy/MM/dd').format(date);

    final request = SubmitStudentAccountSettingsRequest(
      recitationId: state.recitation!.id,
      otherLanguagesIds:
          state.learningLanguages.map((e) => e.intValue).toList(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      secondName: middleNameController.text.trim(),
      email: emailController.text.trim(),
      userIdentityTypeId: getCurrentUserInfo().userIdentities.isNotEmpty
          ? getCurrentUserInfo().userIdentities[0].userIdentityType?.id ?? -1
          : -1,
      userIdentityFiles: state.userIdentityFiles,
      genderId: state.genderId!,
      dateOfBirth: formattedDate,
      nationalityId: state.nationality!.id,
      mainLanguageId: state.mainLanguage!.intValue,
      phoneNumber: state.phoneNumber!.international,
      placeOfResidenceId: state.country!.id,
      profileImage: state.profileImageFile,
      video: state.videoFile,
    );

    final response = await submitStudentAccountSettingsUseCase(request);
    bool success = false;

    response.when(
      success: (_) {
        success = true;
        emit(state.copyWith(
          status: const BaseStatus.success(),
          isReadMode: true,
        ));
      },
      failure: (error) {
        success = false;
        emit(state.copyWith(status: BaseStatus.failure(error)));
      },
    );

    return success;
  }

  Future<bool> _submitReciterSettings(
      List<CertificateData> certificates, List<XFile> otherCertificates) async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final request = SubmitReciterAccountSettingsRequest(
      teachingLanguagesIds:
          state.learningLanguages.map((e) => e.intValue).toList(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      secondName: middleNameController.text.trim(),
      email: emailController.text.trim(),
      genderId: state.genderId!,
      dateOfBirth: dateOfBirthController.text.trim(),
      nationalityId: state.nationality!.id,
      mainLanguageId: state.mainLanguage!.intValue,
      phoneNumber: state.phoneNumber!.international,
      placeOfResidenceId: state.country!.id,
      otherCertificates: otherCertificates,
      profileImage: state.profileImageFile,
      video: state.videoFile,
      certificateData: getCertificateData(certificates),
      userIdentityTypeId: getCurrentUserInfo().userIdentities.isNotEmpty
          ? getCurrentUserInfo().userIdentities[0].userIdentityType?.id
          : null,
      userIdentityFiles: state.userIdentityFiles,
    );

    final response = await reciterAccountDeleteRequestUseCase(request);
    bool success = false;

    response.when(
      success: (_) {
        success = true;
        emit(state.copyWith(
          status: const BaseStatus.success(),
          isReadMode: true,
        ));
      },
      failure: (error) {
        success = false;
        emit(state.copyWith(status: BaseStatus.failure(error)));
      },
    );

    return success;
  }

  void resetForm() {
    initialize();
    setReadMode(true);
  }

  void toggleEditMode() {
    emit(state.copyWith(isReadMode: !state.isReadMode));
  }

  void changePassword() async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final request = ChangePasswordRequest(
      email: appPreferences.email,
      oldPassword: oldPassword.text.trim(),
      password: newPassword.text.trim(),
      confirmPassword: confirmPassword.text.trim(),
    );

    final response = await _changePasswordUseCase(request);

    response.when(
      success: (message) => emit(state.copyWith(
        status: const BaseStatus.success(),
        backendMessage: message,
      )),
      failure: (error) => emit(state.copyWith(
        status: BaseStatus.failure(error),
        backendMessage: error,
      )),
    );
  }

  void showSubscriptionWarning(BuildContext context, String title) {
    showAppModalBottomSheet(
      isDismissible: true,
      mainBtnLabel: LocaleKeys.button_ok,
      context: context,
      secOnPressed: context.router.popForced,
      mainOnPressed: () {
        context.router.popForced();
        context.router.popForced();
      },
      title: title,
      subTitle: LocaleKeys
          .subscription_subscriptionStatus_updateInformationStatusValidation
          .tr(),
      imagePath: Assets.images.questionPopup.path,
    );
  }

  void deleteAccount() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _deleteAccountUseCase();
    response.when(
      success: (_) => emit(state.copyWith(status: const BaseStatus.success())),
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void reciterDeleteAccountRequest() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _reciterAccountDeleteRequestUseCase();
    response.when(
      success: (_) => emit(state.copyWith(status: const BaseStatus.success())),
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void suspendKhitma({
    required DateTime startDate,
    required DateTime endDate,
    required SuspensionReason reason,
    String? otherReason,
  }) async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final request = KhitmaSuspensionRequest(
      startDate: startDate.toIso8601String(),
      endDate: endDate.toIso8601String(),
      reasonId: reason.intValue,
      otherReason: otherReason,
    );

    final response = await _khitmaSuspensionUseCase(request);

    response.when(
      success: (_) => emit(state.copyWith(status: const BaseStatus.success())),
      failure: (error) =>
          emit(state.copyWith(status: BaseStatus.failure(error))),
    );
  }
}
