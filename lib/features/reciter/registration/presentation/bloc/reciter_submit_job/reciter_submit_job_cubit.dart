import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../../../../../core/bloc/app/app_cubit.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/enums/app_enums.dart';
import '../../../../../../core/utils/app_date.dart';
import '../../../data/models/requests/certificate_data_request.dart';
import '../../../data/models/requests/reciter_registration_request.dart';
import '../../../data/models/requests/reciter_validation_submit_job_step_1_request.dart';
import '../../../domain/usecases/reciter_registration_use_case.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../domain/entities/certificate_data.dart';
import '../../../domain/usecases/validate_reciter_submit_job_step_1_use_case.dart';

part 'reciter_submit_job_state.dart';
part 'reciter_submit_job_cubit.freezed.dart';

// @Singleton()
@injectable
class ReciterSubmitJobCubit extends Cubit<ReciterSubmitJobState> {
  final ReciterRegistrationUseCase reciterRegistrationUseCase;
  final ValidateReciterSubmitJobStep1UseCase
      validateReciterSubmitJobStep1Usecase;
  ReciterSubmitJobCubit(this.reciterRegistrationUseCase,
      this.validateReciterSubmitJobStep1Usecase)
      : super(const ReciterSubmitJobState());

  //S--------------------Personal Info--------------------S//

  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final lastName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final email = TextEditingController();
  BaseField? gender;
  BaseField? nationality;
  BaseField? country;
  BaseField? motherTongue;
  List<BaseField> teachingLanguages = [];
  var phone = PhoneController(
      initialValue: const PhoneNumber(isoCode: IsoCode.JO, nsn: ''));

  void setGender(BaseField? value) => gender = value;
  void setNationality(BaseField? value) => nationality = value;
  void setCountry(BaseField? value) => country = value;
  void setMotherTongue(BaseField? value) => motherTongue = value;
  void setTeachingLanguages(List<BaseField> values) =>
      teachingLanguages = values;

  bool removeLoading = false;

  void validatePersonalInfo() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(status: const BaseStatus.loading()));
      removeLoading = true;
      final response = await validateReciterSubmitJobStep1Usecase
          .call(ReciterValidationSubmitJobStep1Request(
        phoneNumber: phone.value.countryCode + phone.value.nsn,
        email: email.text,
      ));

      response.when(success: (data) {
        emit(state.copyWith(
          activeIndex: state.activeIndex + 1,
          status: const BaseStatus.initial(),
        ));
        getIt<AppCubit>().scrollTop();
      }, failure: (error) {
        removeLoading = false;
        emit(state.copyWith(status: const BaseStatus.failure()));
      });
    }
  }

  //E--------------------Personal Info--------------------E//

  //S--------------------Upload Your Id--------------------S//

  String? validateDocument(value) {
    if (value == null ||
        state.frontImage == null ||
        (state.document?.id == UserIdTypes.identityCard.intValue &&
            state.backImage == null)) {
      return LocaleKeys.form_error_requiredField.tr();
    }
    return null;
  }

  void setDocument(value) =>
      emit(state.copyWith(document: value, frontImage: null, backImage: null));

  void unSetImage(bool isBack) {
    if (isBack) {
      emit(state.copyWith(backImage: null));
    } else {
      emit(state.copyWith(frontImage: null));
    }
  }

  void setImage(XFile? imageFile, bool isBack) {
    if (isBack) {
      emit(state.copyWith(backImage: imageFile));
    } else {
      emit(state.copyWith(frontImage: imageFile));
    }
  }

  void validateUploadYourId() {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(activeIndex: state.activeIndex + 1));
      getIt<AppCubit>().scrollTop();
    }
  }

  //E--------------------Upload Your Id--------------------E//

  //S------------------------Certificates---------------------S//

  BaseField? recitation;
  BaseField? recitationType;
  final recitationKey = GlobalKey<DropdownSearchState<BaseField>>();
  final recitationTypeKey = GlobalKey<DropdownSearchState<BaseField>>();

  void setRecitation(value) => recitation = value;
  void setRecitationType(value) => recitationType = value;

  void addRecitation() {
    if (formKey.currentState!.validate()) {
      final certificateData = CertificateData(
        recitationId: recitation!.id,
        recitationTypeId: recitationType!.id,
        recitationName: recitation!.name,
        recitationTypeName: recitationType!.name,
      );
      final List<CertificateData> certificates = List.from(state.certificates);
      certificates.add(certificateData);
      recitationKey.currentState?.clear();
      recitationTypeKey.currentState?.clear();
      emit(state.copyWith(certificates: certificates));
    }
  }

  void removeRecitation(int index) {
    final List<CertificateData> certificates = List.from(state.certificates);
    certificates.removeAt(index);

    emit(state.copyWith(certificates: certificates));
  }

  void uploadCertificate(int index, XFile image) {
    final List<CertificateData> certificates = List.from(state.certificates);
    var updatedCertificate =
        certificates[index].copyWith(certificateFile: image);
    certificates[index] = updatedCertificate;

    emit(state.copyWith(certificates: certificates));
  }

  void removeCertificate(int index) {
    final List<CertificateData> certificates = List.from(state.certificates);
    certificates.removeAt(index);

    emit(state.copyWith(certificates: certificates));
  }

  void uploadOtherCertificates(List<XFile> certificates) {
    final List<XFile> otherCertificates = List.from(state.otherCertificates);
    otherCertificates.addAll(certificates);
    emit(state.copyWith(otherCertificates: otherCertificates));
  }

  void removeOtherCertificate(int index) {
    final List<XFile> otherCertificates = List.from(state.otherCertificates);
    otherCertificates.removeAt(index);
    emit(state.copyWith(otherCertificates: otherCertificates));
  }

  void register() async {
    // Ensure names don't have leading/trailing spaces before submitting
    _trimNameFields();

    final certificates = state.certificates
        .where((element) => element.certificateFile != null)
        .toList();

    if (state.certificates.isEmpty) {
      formKey.currentState!.validate();
    } else {
      if (certificates.isEmpty) {
        withStateEmission(() => errorMsg['certificatesAfterAdding'] =
            LocaleKeys.form_error_requiredField.tr());
      } else {
        emit(state.copyWith(status: const BaseStatus.loading()));
        final List<XFile> images = [state.frontImage!];
        if (state.backImage != null) {
          images.add(state.backImage!);
        }

        final certificateDataRequset = certificates
            .map((e) => CertificateDataRequest(
                recitationId: e.recitationId,
                recitationTypeId: e.recitationTypeId,
                certificateFile: e.certificateFile!))
            .toList();

        final response = await reciterRegistrationUseCase.call(
          RectierRegistrationRequest(
            firstName: firstName.text,
            middleName: middleName.text,
            lastName: lastName.text,
            genderId: gender!.id,
            dateOfBirth: AppDate.appToBEDate(dateOfBirth.text),
            nationalityId: nationality!.id,
            placeOfResidenceId: country!.id,
            phoneNumber: phone.value.countryCode + phone.value.nsn,
            email: email.text,
            mainLanguageId: motherTongue!.id,
            teachingLanguagesIds:
                teachingLanguages.map((lang) => lang.id).toList(),
            userIdentityTypeId: state.document!.id,
            userIdentityFiles: images,
            otherCertificates: state.otherCertificates,
            certificateData: certificateDataRequset,
          ),
        );

        response.when(
          success: (data) =>
              emit(state.copyWith(status: const BaseStatus.success())),
          failure: (error) =>
              emit(state.copyWith(status: const BaseStatus.failure())),
        );
      }
    }
  }

//E------------------------Certificates---------------------E//

  final formKey = GlobalKey<FormState>();

  final errorMsg = {
    "certificatesAfterAdding": '',
  };

  void withStateEmission(VoidCallback callback) {
    emit(state.copyWith(status: const BaseStatus.initial()));
    callback();
    emit(state.copyWith(status: const BaseStatus.changed()));
  }

  void unSetErrorMsg() {
    errorMsg.forEach((key, value) {
      errorMsg[key] = '';
    });
  }

  void back() {
    unSetErrorMsg();
    emit(state.copyWith(activeIndex: state.activeIndex - 1));
  }

  void clearCertificates() {
    emit(state.copyWith(certificates: []));
  }

  void clearOtherCertificates() {
    emit(state.copyWith(otherCertificates: []));
  }

  void clearFrontBackImages() {
    emit(state.copyWith(frontImage: null, backImage: null));
  }

  @override
  Future<void> close() {
    firstName.dispose();
    middleName.dispose();
    lastName.dispose();
    dateOfBirth.dispose();
    email.dispose();
    phone.dispose();
    return super.close();
  }

  // Helper: trim leading/trailing spaces from name fields
  void _trimNameFields() {
    firstName.text = firstName.text.trim();
    middleName.text = middleName.text.trim();
    lastName.text = lastName.text.trim();
  }
}
