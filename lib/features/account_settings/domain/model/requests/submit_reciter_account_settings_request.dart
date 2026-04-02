import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../reciter/registration/domain/entities/certificate_data.dart';

part 'submit_reciter_account_settings_request.g.dart';

// @JsonSerializable(createFactory: false)
// class CertificateDataDto {
//   final int recitationId;
//   final int recitationTypeId;

//   @JsonKey(ignore: true)
//   final XFile certificateFile;

//   CertificateDataDto({
//     required this.recitationId,
//     required this.recitationTypeId,
//     required this.certificateFile,
//   });
// }

@JsonSerializable(createFactory: false)
class SubmitReciterAccountSettingsRequest {
  final List<int> teachingLanguagesIds;
  final String secondName;
  final String email;
  final String firstName;
  final String lastName;
  final int genderId;
  final String dateOfBirth;
  final int nationalityId;
  final int mainLanguageId;
  final String phoneNumber;
  final int placeOfResidenceId;
  final List<CertificateData>? certificateData;

  final int? userIdentityTypeId;

  @JsonKey(ignore: true)
  final List<XFile>? otherCertificates;
  @JsonKey(ignore: true)
  final XFile? profileImage;
  @JsonKey(ignore: true)
  final XFile? video;
  @JsonKey(ignore: true)
  final List<XFile>? userIdentityFiles;

  SubmitReciterAccountSettingsRequest({
    required this.teachingLanguagesIds,
    required this.secondName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.genderId,
    required this.dateOfBirth,
    required this.nationalityId,
    required this.mainLanguageId,
    required this.phoneNumber,
    required this.placeOfResidenceId,
    this.certificateData,
    this.otherCertificates,
    this.userIdentityTypeId,
    this.profileImage,
    this.video,
    this.userIdentityFiles,
  });

  Map<String, dynamic> toJson() =>
      _$SubmitReciterAccountSettingsRequestToJson(this);
}
