// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPlaceOfResidence _$UserPlaceOfResidenceFromJson(
        Map<String, dynamic> json) =>
    UserPlaceOfResidence(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      isoCode: json['isoCode'] as String,
    );

Map<String, dynamic> _$UserPlaceOfResidenceToJson(
        UserPlaceOfResidence instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isoCode': instance.isoCode,
    };

UserNationality _$UserNationalityFromJson(Map<String, dynamic> json) =>
    UserNationality(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      isoCode: json['isoCode'] as String,
    );

Map<String, dynamic> _$UserNationalityToJson(UserNationality instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isoCode': instance.isoCode,
    };

UserIdentity _$UserIdentityFromJson(Map<String, dynamic> json) => UserIdentity(
      subscriptionId: (json['subscriptionId'] as num?)?.toInt(),
      userIdentityType: json['userIdentityType'] == null
          ? null
          : BaseField.fromJson(
              json['userIdentityType'] as Map<String, dynamic>),
      fileStorageId: json['fileStorageId'] as String?,
      fileName: json['fileName'] as String?,
      fileUrl: json['fileUrl'] as String?,
      documentTypeName: json['documentTypeName'] as String?,
    );

Map<String, dynamic> _$UserIdentityToJson(UserIdentity instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'userIdentityType': instance.userIdentityType,
      'fileStorageId': instance.fileStorageId,
      'fileName': instance.fileName,
      'fileUrl': instance.fileUrl,
      'documentTypeName': instance.documentTypeName,
    };

StudentRecitation _$StudentRecitationFromJson(Map<String, dynamic> json) =>
    StudentRecitation(
      subscriptionId: (json['subscriptionId'] as num).toInt(),
      recitation: json['recitation'] == null
          ? null
          : BaseField.fromJson(json['recitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentRecitationToJson(StudentRecitation instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'recitation': instance.recitation,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      isLoginCompleted: json['isLoginCompleted'] as bool,
      subscriptionStatus: $enumDecodeNullable(
          _$SubscriptionStatusEnumMap, json['subscriptionStatus']),
      hasActiveSchedule: json['hasActiveSchedule'] as bool,
      isVerified: json['isVerified'] as bool,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => UserRole.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneNumber: json['phoneNumber'] as String?,
      mainLanguage:
          $enumDecodeNullable(_$LanguageEnumMap, json['mainLanguage']),
      learningLanguages: (json['learningLanguages'] as List<dynamic>)
          .map((e) => $enumDecode(_$LanguageEnumMap, e))
          .toList(),
      placeOfResidence: json['placeOfResidence'] == null
          ? null
          : UserPlaceOfResidence.fromJson(
              json['placeOfResidence'] as Map<String, dynamic>),
      nationality: json['nationality'] == null
          ? null
          : UserNationality.fromJson(
              json['nationality'] as Map<String, dynamic>),
      introVideoUrl: json['introVideoUrl'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      description: json['description'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      userStatus: json['userStatus'] == null
          ? null
          : BaseField.fromJson(json['userStatus'] as Map<String, dynamic>),
      appLang: json['appLang'] as String?,
      userIdentities: (json['userIdentities'] as List<dynamic>?)
              ?.map((e) => UserIdentity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      studentRecitations: (json['studentRecitations'] as List<dynamic>?)
              ?.map(
                  (e) => StudentRecitation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isPaymentSuccess: json['isPaymentSuccess'] as bool? ?? false,
      programId: (json['programId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'isLoginCompleted': instance.isLoginCompleted,
      'subscriptionStatus':
          _$SubscriptionStatusEnumMap[instance.subscriptionStatus],
      'hasActiveSchedule': instance.hasActiveSchedule,
      'isVerified': instance.isVerified,
      'roles': instance.roles,
      'phoneNumber': instance.phoneNumber,
      'mainLanguage': _$LanguageEnumMap[instance.mainLanguage],
      'learningLanguages':
          instance.learningLanguages.map((e) => _$LanguageEnumMap[e]!).toList(),
      'placeOfResidence': instance.placeOfResidence,
      'nationality': instance.nationality,
      'introVideoUrl': instance.introVideoUrl,
      'profileImageUrl': instance.profileImageUrl,
      'description': instance.description,
      'gender': _$GenderEnumMap[instance.gender],
      'userStatus': instance.userStatus,
      'appLang': instance.appLang,
      'userIdentities': instance.userIdentities,
      'studentRecitations': instance.studentRecitations,
      'isPaymentSuccess': instance.isPaymentSuccess,
      'programId': instance.programId,
    };

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.pending: 'pending',
  SubscriptionStatus.rejected: 'rejected',
  SubscriptionStatus.approved: 'approved',
  SubscriptionStatus.completed: 'completed',
  SubscriptionStatus.certified: 'certified',
  SubscriptionStatus.cancelled: 'cancelled',
  SubscriptionStatus.suspended: 'suspended',
};

const _$LanguageEnumMap = {
  Language.arabic: 'arabic',
  Language.english: 'english',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
