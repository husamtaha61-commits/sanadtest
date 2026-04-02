import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'certificate_data_request.dart';

class RectierRegistrationRequest {
  final String email;
  final List<int> teachingLanguagesIds;
  final String firstName;
  final String middleName;
  final String lastName;
  final int genderId;
  final String dateOfBirth;
  final int nationalityId;
  final int mainLanguageId;
  final String phoneNumber;
  final int placeOfResidenceId;
  final int userIdentityTypeId;
  final List<XFile> userIdentityFiles;
  final List<XFile>? otherCertificates;
  final List<CertificateDataRequest> certificateData;

  RectierRegistrationRequest({
    required this.email,
    required this.teachingLanguagesIds,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.genderId,
    required this.dateOfBirth,
    required this.nationalityId,
    required this.mainLanguageId,
    required this.phoneNumber,
    required this.placeOfResidenceId,
    required this.userIdentityTypeId,
    required this.userIdentityFiles,
    required this.otherCertificates,
    required this.certificateData,
  });

  Future<FormData> toFormData() async {
    final multipartUserIdentityFiles = [];
    for (var file in userIdentityFiles) {
      multipartUserIdentityFiles.add(await MultipartFile.fromFile(file.path));
    }

    final multipartOtherCertificates = [];
    if (otherCertificates != null) {
      for (var certificate in otherCertificates!) {
        multipartOtherCertificates
            .add(await MultipartFile.fromFile(certificate.path));
      }
    }

    final formData = FormData.fromMap({
      'UserInfo.Email': email,
      'UserInfo.FirstName': firstName,
      'UserInfo.MiddleName': middleName,
      'UserInfo.LastName': lastName,
      'UserInfo.GenderId': genderId,
      'UserInfo.DateOfBirth': dateOfBirth,
      'UserInfo.NationalityId': nationalityId,
      'UserInfo.MainLanguageId': mainLanguageId,
      'UserInfo.PhoneNumber': phoneNumber,
      'UserInfo.PlaceOfResidenceId': placeOfResidenceId,
      'UserIdentityDto.UserIdentityTypeId': userIdentityTypeId,
      'UserInfo.TeachingLanguagesIds': teachingLanguagesIds,
      'UserIdentityDto.UserIdentityFiles': multipartUserIdentityFiles,
      'OtherCertificates': multipartOtherCertificates,
    });

    for (var i = 0; i < certificateData.length; i++) {
      formData.fields.add(MapEntry('CertificateDataDto[$i].recitationId',
          certificateData[i].recitationId.toString()));
      formData.fields.add(MapEntry('CertificateDataDto[$i].recitationTypeId',
          certificateData[i].recitationTypeId.toString()));
      formData.files.add(
        MapEntry(
          'CertificateDataDto[$i].certificateFile',
          await MultipartFile.fromFile(
            certificateData[i].certificateFile.path,
          ),
        ),
      );
    }

    return formData;
  }
}
