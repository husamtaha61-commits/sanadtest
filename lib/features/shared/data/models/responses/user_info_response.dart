import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/responses/base_field_response.dart';
import 'user_role_response.dart.dart';

part 'user_info_response.g.dart';

@JsonSerializable()
class UserInfoResponse {
  final int? id;
  final String? email;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? dateOfBirth;
  final BaseFieldResponse? subscriptionStatus;
  final BaseFieldResponse? userStatus;
  final bool? hasActiveSchedule;
  final bool? isVerified;
  final bool? isLoginCompleted;
  final List<UserRoleResponse>? roles;
  final String? phoneNumber;
  final BaseFieldResponse? mainLanguage;
  final List<BaseFieldResponse>? learningLanguages;
  final UserPlaceOfResidenceResponse? placeOfResidence;
  final UserNationalityResponse? nationality;
  final String? introVideoUrl;
  final String? profileImageUrl;
  final String? description;
  final BaseFieldResponse? gender;
  final String? appLang;
  final List<UserIdentityResponse>? userIdentities;
  final List<StudentRecitationResponse>? studentRecitations;
  final int? programId;
  final bool? isPaymentSuccess;

  const UserInfoResponse(
      {this.id,
      this.email,
      this.firstName,
      this.middleName,
      this.lastName,
      this.dateOfBirth,
      this.subscriptionStatus,
      this.userStatus,
      this.hasActiveSchedule,
      this.isVerified,
      this.isLoginCompleted,
      this.roles,
      this.phoneNumber,
      this.mainLanguage,
      this.learningLanguages,
      this.placeOfResidence,
      this.nationality,
      this.introVideoUrl,
      this.profileImageUrl,
      this.description,
      this.gender,
      this.appLang,
      this.userIdentities,
      this.studentRecitations,
      this.programId,
      this.isPaymentSuccess = false});

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

@JsonSerializable()
class UserPlaceOfResidenceResponse {
  final int? id;
  final String? name;
  final String? isoCode;

  const UserPlaceOfResidenceResponse({this.id, this.name, this.isoCode});

  factory UserPlaceOfResidenceResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPlaceOfResidenceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserPlaceOfResidenceResponseToJson(this);
}

@JsonSerializable()
class UserNationalityResponse {
  final int? id;
  final String? name;
  final String? isoCode;

  const UserNationalityResponse({this.id, this.name, this.isoCode});

  factory UserNationalityResponse.fromJson(Map<String, dynamic> json) =>
      _$UserNationalityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserNationalityResponseToJson(this);
}

@JsonSerializable()
class UserIdentityResponse {
  final int? subscriptionId;
  final BaseFieldResponse? userIdentityType;
  final String? fileStorageId;
  final String? fileName;
  final String? fileType;
  final String? fileUrl;

  const UserIdentityResponse({
    this.subscriptionId,
    this.userIdentityType,
    this.fileStorageId,
    this.fileName,
    this.fileType,
    this.fileUrl,
  });

  factory UserIdentityResponse.fromJson(Map<String, dynamic> json) =>
      _$UserIdentityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdentityResponseToJson(this);
}

@JsonSerializable()
class StudentRecitationResponse {
  final int? subscriptionId;
  final BaseFieldResponse? recitation;

  const StudentRecitationResponse({this.subscriptionId, this.recitation});

  factory StudentRecitationResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentRecitationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentRecitationResponseToJson(this);
}
