// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) =>
    UserInfoResponse(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      subscriptionStatus: json['subscriptionStatus'] == null
          ? null
          : BaseFieldResponse.fromJson(
              json['subscriptionStatus'] as Map<String, dynamic>),
      userStatus: json['userStatus'] == null
          ? null
          : BaseFieldResponse.fromJson(
              json['userStatus'] as Map<String, dynamic>),
      hasActiveSchedule: json['hasActiveSchedule'] as bool?,
      isVerified: json['isVerified'] as bool?,
      isLoginCompleted: json['isLoginCompleted'] as bool?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => UserRoleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneNumber: json['phoneNumber'] as String?,
      mainLanguage: json['mainLanguage'] == null
          ? null
          : BaseFieldResponse.fromJson(
              json['mainLanguage'] as Map<String, dynamic>),
      learningLanguages: (json['learningLanguages'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeOfResidence: json['placeOfResidence'] == null
          ? null
          : UserPlaceOfResidenceResponse.fromJson(
              json['placeOfResidence'] as Map<String, dynamic>),
      nationality: json['nationality'] == null
          ? null
          : UserNationalityResponse.fromJson(
              json['nationality'] as Map<String, dynamic>),
      introVideoUrl: json['introVideoUrl'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      description: json['description'] as String?,
      gender: json['gender'] == null
          ? null
          : BaseFieldResponse.fromJson(json['gender'] as Map<String, dynamic>),
      appLang: json['appLang'] as String?,
      userIdentities: (json['userIdentities'] as List<dynamic>?)
          ?.map((e) => UserIdentityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentRecitations: (json['studentRecitations'] as List<dynamic>?)
          ?.map((e) =>
              StudentRecitationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      programId: (json['programId'] as num?)?.toInt(),
      isPaymentSuccess: json['isPaymentSuccess'] as bool? ?? false,
    );

Map<String, dynamic> _$UserInfoResponseToJson(UserInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'subscriptionStatus': instance.subscriptionStatus,
      'userStatus': instance.userStatus,
      'hasActiveSchedule': instance.hasActiveSchedule,
      'isVerified': instance.isVerified,
      'isLoginCompleted': instance.isLoginCompleted,
      'roles': instance.roles,
      'phoneNumber': instance.phoneNumber,
      'mainLanguage': instance.mainLanguage,
      'learningLanguages': instance.learningLanguages,
      'placeOfResidence': instance.placeOfResidence,
      'nationality': instance.nationality,
      'introVideoUrl': instance.introVideoUrl,
      'profileImageUrl': instance.profileImageUrl,
      'description': instance.description,
      'gender': instance.gender,
      'appLang': instance.appLang,
      'userIdentities': instance.userIdentities,
      'studentRecitations': instance.studentRecitations,
      'programId': instance.programId,
      'isPaymentSuccess': instance.isPaymentSuccess,
    };

UserPlaceOfResidenceResponse _$UserPlaceOfResidenceResponseFromJson(
        Map<String, dynamic> json) =>
    UserPlaceOfResidenceResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      isoCode: json['isoCode'] as String?,
    );

Map<String, dynamic> _$UserPlaceOfResidenceResponseToJson(
        UserPlaceOfResidenceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isoCode': instance.isoCode,
    };

UserNationalityResponse _$UserNationalityResponseFromJson(
        Map<String, dynamic> json) =>
    UserNationalityResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      isoCode: json['isoCode'] as String?,
    );

Map<String, dynamic> _$UserNationalityResponseToJson(
        UserNationalityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isoCode': instance.isoCode,
    };

UserIdentityResponse _$UserIdentityResponseFromJson(
        Map<String, dynamic> json) =>
    UserIdentityResponse(
      subscriptionId: (json['subscriptionId'] as num?)?.toInt(),
      userIdentityType: json['userIdentityType'] == null
          ? null
          : BaseFieldResponse.fromJson(
              json['userIdentityType'] as Map<String, dynamic>),
      fileStorageId: json['fileStorageId'] as String?,
      fileName: json['fileName'] as String?,
      fileType: json['fileType'] as String?,
      fileUrl: json['fileUrl'] as String?,
    );

Map<String, dynamic> _$UserIdentityResponseToJson(
        UserIdentityResponse instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'userIdentityType': instance.userIdentityType,
      'fileStorageId': instance.fileStorageId,
      'fileName': instance.fileName,
      'fileType': instance.fileType,
      'fileUrl': instance.fileUrl,
    };

StudentRecitationResponse _$StudentRecitationResponseFromJson(
        Map<String, dynamic> json) =>
    StudentRecitationResponse(
      subscriptionId: (json['subscriptionId'] as num?)?.toInt(),
      recitation: json['recitation'] == null
          ? null
          : BaseFieldResponse.fromJson(
              json['recitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentRecitationResponseToJson(
        StudentRecitationResponse instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'recitation': instance.recitation,
    };
