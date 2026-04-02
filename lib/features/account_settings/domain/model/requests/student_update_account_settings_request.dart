import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/date_time_converter.dart';

part 'student_update_account_settings_request.g.dart';

@JsonSerializable(createFactory: false)
class SubmitStudentAccountSettingsRequest {
  final int recitationId;
  final List<int>? otherLanguagesIds;
  final String secondName;
  final String email;
  final int? userIdentityTypeId;

  final String firstName;
  final String lastName;
  final int genderId;
  @DateTimeConverter()
  final String dateOfBirth;
  final int nationalityId;
  final int mainLanguageId;
  final String phoneNumber;
  final int placeOfResidenceId;

  @JsonKey(ignore: true)
  final XFile? profileImage;
  @JsonKey(ignore: true)
  final XFile? video;
  @JsonKey(ignore: true)
  final List<XFile>? userIdentityFiles;

  SubmitStudentAccountSettingsRequest({
    required this.recitationId,
    this.otherLanguagesIds,
    required this.secondName,
    required this.email,
    this.userIdentityTypeId,
    this.userIdentityFiles,
    required this.firstName,
    required this.lastName,
    required this.genderId,
    required this.dateOfBirth,
    required this.nationalityId,
    required this.mainLanguageId,
    required this.phoneNumber,
    required this.placeOfResidenceId,
    this.profileImage,
    this.video,
  });

  Map<String, dynamic> toJson() =>
      _$SubmitStudentAccountSettingsRequestToJson(this);
}
