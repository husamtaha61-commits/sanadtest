import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/entities/base_field.dart';
import '../../../../core/enums/app_enums.dart';
import '../../data/models/responses/user_info_response.dart';
import 'user_role.dart';

part 'user_info.g.dart';
part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required int id,
    required String email,
    required String firstName,
    String? middleName,
    required String lastName,
    required String dateOfBirth,
    required bool isLoginCompleted,
    SubscriptionStatus? subscriptionStatus,
    required bool hasActiveSchedule,
    required bool isVerified,
    required List<UserRole> roles,
    String? phoneNumber,
    Language? mainLanguage,
    required List<Language> learningLanguages,
    UserPlaceOfResidence? placeOfResidence,
    UserNationality? nationality,
    String? introVideoUrl,
    String? profileImageUrl,
    String? description,
    Gender? gender,
    BaseField? userStatus,
    String? appLang,
    @Default([]) List<UserIdentity> userIdentities,
    @Default([]) List<StudentRecitation> studentRecitations,
    @Default(false) bool? isPaymentSuccess,
    int? programId,
  }) = _UserInfo;

  factory UserInfo.fromResponse(UserInfoResponse response) => UserInfo(
        id: response.id ?? -1,
        email: response.email ?? '',
        firstName: response.firstName ?? '',
        middleName: response.middleName,
        lastName: response.lastName ?? '',
        dateOfBirth: response.dateOfBirth ?? '',
        subscriptionStatus: response.subscriptionStatus != null
            ? SubscriptionStatus.fromId(
                BaseField.fromResponse(response.subscriptionStatus).id)
            : null,
        hasActiveSchedule: response.hasActiveSchedule ?? false,
        isVerified: response.isVerified ?? false,
        isLoginCompleted: response.isLoginCompleted ?? false,
        roles: (response.roles ?? [])
            .map((role) => UserRole.fromResponse(role))
            .toList(),
        phoneNumber: response.phoneNumber,
        mainLanguage:
            Language.fromId(BaseField.fromResponse(response.mainLanguage).id),
        learningLanguages: (response.learningLanguages ?? [])
            .map((lang) => Language.fromId(BaseField.fromResponse(lang).id)!)
            .toList(),
        placeOfResidence:
            UserPlaceOfResidence.fromResponse(response.placeOfResidence),
        nationality: UserNationality.fromResponse(response.nationality),
        introVideoUrl: response.introVideoUrl,
        profileImageUrl: response.profileImageUrl,
        description: response.description,
        gender: Gender.fromId(BaseField.fromResponse(response.gender).id),
        userStatus: BaseField.fromResponse(response.userStatus),
        appLang: response.appLang,
        userIdentities: (response.userIdentities ?? [])
            .map((e) => UserIdentity.fromResponse(e))
            .toList(),
        studentRecitations: (response.studentRecitations ?? [])
            .map((e) => StudentRecitation.fromResponse(e))
            .toList(),
        isPaymentSuccess: response.isPaymentSuccess ?? false,
        programId: response.programId,
      );

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@JsonSerializable()
class UserPlaceOfResidence {
  final int id;
  final String name;
  final String isoCode;

  const UserPlaceOfResidence(
      {required this.id, required this.name, required this.isoCode});

  factory UserPlaceOfResidence.fromResponse(
      UserPlaceOfResidenceResponse? response) {
    if (response == null) {
      return const UserPlaceOfResidence(
        id: -1,
        isoCode: "",
        name: "",
      );
    }
    return UserPlaceOfResidence(
      id: response.id ?? -1,
      isoCode: response.isoCode ?? "",
      name: response.name ?? "",
    );
  }

  factory UserPlaceOfResidence.fromJson(Map<String, dynamic> json) =>
      _$UserPlaceOfResidenceFromJson(json);

  Map<String, dynamic> toJson() => _$UserPlaceOfResidenceToJson(this);
}

@JsonSerializable()
class UserNationality {
  final int id;
  final String name;
  final String isoCode;

  const UserNationality(
      {required this.id, required this.name, required this.isoCode});

  factory UserNationality.fromResponse(UserNationalityResponse? response) {
    if (response == null) {
      return const UserNationality(
        id: -1,
        isoCode: "",
        name: "",
      );
    }
    return UserNationality(
      id: response.id ?? -1,
      isoCode: response.isoCode ?? "",
      name: response.name ?? "",
    );
  }

  factory UserNationality.fromJson(Map<String, dynamic> json) =>
      _$UserNationalityFromJson(json);

  Map<String, dynamic> toJson() => _$UserNationalityToJson(this);
}

@JsonSerializable()
class UserIdentity {
  final int? subscriptionId;
  final BaseField? userIdentityType;
  final String? fileStorageId;
  final String? fileName;
  final String? fileUrl;
  final String? documentTypeName;

  const UserIdentity({
    this.subscriptionId,
    this.userIdentityType,
    this.fileStorageId,
    this.fileName,
    this.fileUrl,
    this.documentTypeName,
  });

  factory UserIdentity.fromResponse(UserIdentityResponse response) {
    return UserIdentity(
      subscriptionId: response.subscriptionId ?? -1,
      userIdentityType: BaseField.fromResponse(response.userIdentityType),
      fileStorageId: response.fileStorageId,
      fileName: response.fileName,
      fileUrl: response.fileUrl,
      documentTypeName: response.userIdentityType?.name,
    );
  }

  factory UserIdentity.fromJson(Map<String, dynamic> json) =>
      _$UserIdentityFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdentityToJson(this);
}

@JsonSerializable()
class StudentRecitation {
  final int subscriptionId;
  final BaseField? recitation;

  const StudentRecitation({
    required this.subscriptionId,
    this.recitation,
  });

  factory StudentRecitation.fromResponse(StudentRecitationResponse response) {
    return StudentRecitation(
      subscriptionId: response.subscriptionId ?? -1,
      recitation: BaseField.fromResponse(response.recitation),
    );
  }

  factory StudentRecitation.fromJson(Map<String, dynamic> json) =>
      _$StudentRecitationFromJson(json);

  Map<String, dynamic> toJson() => _$StudentRecitationToJson(this);
}
