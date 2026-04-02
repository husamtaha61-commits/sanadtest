import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/retrofit_client.dart';
import '../../../auth/data/models/requests/user_change_password_request.dart';
import '../../domain/model/requests/khitma_suspension_request.dart';
import '../../domain/model/requests/student_update_account_settings_request.dart';
import '../../domain/model/requests/submit_reciter_account_settings_request.dart';

abstract class AccountSettingsDataSource {
  Future<ApiResult> deleteAccount();
  Future<ApiResult> khitmaSuspension(KhitmaSuspensionRequest request);
  Future<ApiResult> changePassword(ChangePasswordRequest request);
  Future<ApiResult> submitReciterAccountDeleteRequest();
  Future<ApiResult> submitStudentAccountSettings(
      SubmitStudentAccountSettingsRequest request);
  Future<ApiResult> submitReciterAccountSettings(
      SubmitReciterAccountSettingsRequest request);
}

@LazySingleton(as: AccountSettingsDataSource)
class AccountSettingsDataSourceImp implements AccountSettingsDataSource {
  final RetrofitClient retrofitClient;
  AccountSettingsDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult> deleteAccount() =>
      apiHandler(() => retrofitClient.deleteAccount());

  @override
  Future<ApiResult> khitmaSuspension(KhitmaSuspensionRequest request) =>
      apiHandler(() => retrofitClient.khitmaSuspension(request));

  @override
  Future<ApiResult> changePassword(ChangePasswordRequest request) =>
      apiHandler(() => retrofitClient.changePassword(request));

  @override
  Future<ApiResult> submitReciterAccountDeleteRequest() =>
      apiHandler(() => retrofitClient.submitReciterAccountSettingsRequest());

  @override
  Future<ApiResult> submitStudentAccountSettings(
      SubmitStudentAccountSettingsRequest request) {
    final parts = <String, dynamic>{
      "RecitationId": request.recitationId,
      "SecondName": request.secondName,
      "Email": request.email,
      "FirstName": request.firstName,
      "LastName": request.lastName,
      "GenderId": request.genderId,
      "DateOfBirth": request.dateOfBirth,
      "NationalityId": request.nationalityId,
      "MainLanguageId": request.mainLanguageId,
      "PhoneNumber": request.phoneNumber,
      "PlaceOfResidenceId": request.placeOfResidenceId,
    };

    if (request.userIdentityTypeId != null) {
      parts["UserIdentityDto.UserIdentityTypeId"] = request.userIdentityTypeId;
    }

    void addFileIfExists(String key, dynamic file) {
      if (file != null) parts[key] = MultipartFile.fromFileSync(file.path);
    }

    addFileIfExists("ProfileImage", request.profileImage);
    addFileIfExists("Video", request.video);
    if (request.userIdentityFiles != null) {
      parts["UserIdentityDto.UserIdentityFiles"] = request.userIdentityFiles!
          .map((f) => MultipartFile.fromFileSync(f.path))
          .toList();
    }

    return apiHandler(() => retrofitClient.submitStudentAccountSettings(parts));
  }

  @override
  Future<ApiResult> submitReciterAccountSettings(
      SubmitReciterAccountSettingsRequest request) async {
    final formData = FormData.fromMap({
      "SecondName": request.secondName,
      "Email": request.email,
      "FirstName": request.firstName,
      "LastName": request.lastName,
      "GenderId": request.genderId,
      "DateOfBirth": DateFormat("yyyy-MM-dd").format(
        DateFormat("dd/MM/yyyy").parse(request.dateOfBirth),
      ),
      "NationalityId": request.nationalityId,
      "MainLanguageId": request.mainLanguageId,
      "PhoneNumber": request.phoneNumber,
      "PlaceOfResidenceId": request.placeOfResidenceId,
      "UserIdentityDto.UserIdentityTypeId": request.userIdentityTypeId,
    });

    void addFiles(List? files, String keyPrefix) {
      if (files == null) return;
      for (var i = 0; i < files.length; i++) {
        formData.files.add(MapEntry(
          "$keyPrefix[$i]",
          MultipartFile.fromFileSync(files[i].path),
        ));
      }
    }

    Future<void> addCertificates(List? certificates) async {
      if (certificates == null) return;
      for (var i = 0; i < certificates.length; i++) {
        final cert = certificates[i];
        formData.fields
          ..add(MapEntry("CertificateDataDto[$i].RecitationId",
              cert.recitationId.toString()))
          ..add(MapEntry("CertificateDataDto[$i].RecitationTypeId",
              cert.recitationTypeId.toString()));
        if (cert.certificateFile != null) {
          formData.files.add(MapEntry(
            "CertificateDataDto[$i].CertificateFile",
            await MultipartFile.fromFile(cert.certificateFile!.path),
          ));
        }
      }
    }

    addCertificates(request.certificateData);
    addFiles(request.otherCertificates, "OtherCertificates");
    addFiles(request.userIdentityFiles, "UserIdentityDto.UserIdentityFiles");
    if (request.profileImage != null) {
      formData.files.add(MapEntry("ProfileImage",
          await MultipartFile.fromFile(request.profileImage!.path)));
    }
    if (request.video != null) {
      formData.files.add(
          MapEntry("Video", await MultipartFile.fromFile(request.video!.path)));
    }

    for (var i = 0; i < request.teachingLanguagesIds.length; i++) {
      formData.fields.add(MapEntry("TeachingLanguagesIds[$i]",
          request.teachingLanguagesIds[i].toString()));
    }

    return apiHandler(
        () => retrofitClient.submitReciterAccountSettings(formData));
  }
}
