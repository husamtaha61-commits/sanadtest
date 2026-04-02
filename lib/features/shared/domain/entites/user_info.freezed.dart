// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  bool get isLoginCompleted => throw _privateConstructorUsedError;
  SubscriptionStatus? get subscriptionStatus =>
      throw _privateConstructorUsedError;
  bool get hasActiveSchedule => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  List<UserRole> get roles => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  Language? get mainLanguage => throw _privateConstructorUsedError;
  List<Language> get learningLanguages => throw _privateConstructorUsedError;
  UserPlaceOfResidence? get placeOfResidence =>
      throw _privateConstructorUsedError;
  UserNationality? get nationality => throw _privateConstructorUsedError;
  String? get introVideoUrl => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  BaseField? get userStatus => throw _privateConstructorUsedError;
  String? get appLang => throw _privateConstructorUsedError;
  List<UserIdentity> get userIdentities => throw _privateConstructorUsedError;
  List<StudentRecitation> get studentRecitations =>
      throw _privateConstructorUsedError;
  bool? get isPaymentSuccess => throw _privateConstructorUsedError;
  int? get programId => throw _privateConstructorUsedError;

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {int id,
      String email,
      String firstName,
      String? middleName,
      String lastName,
      String dateOfBirth,
      bool isLoginCompleted,
      SubscriptionStatus? subscriptionStatus,
      bool hasActiveSchedule,
      bool isVerified,
      List<UserRole> roles,
      String? phoneNumber,
      Language? mainLanguage,
      List<Language> learningLanguages,
      UserPlaceOfResidence? placeOfResidence,
      UserNationality? nationality,
      String? introVideoUrl,
      String? profileImageUrl,
      String? description,
      Gender? gender,
      BaseField? userStatus,
      String? appLang,
      List<UserIdentity> userIdentities,
      List<StudentRecitation> studentRecitations,
      bool? isPaymentSuccess,
      int? programId});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? isLoginCompleted = null,
    Object? subscriptionStatus = freezed,
    Object? hasActiveSchedule = null,
    Object? isVerified = null,
    Object? roles = null,
    Object? phoneNumber = freezed,
    Object? mainLanguage = freezed,
    Object? learningLanguages = null,
    Object? placeOfResidence = freezed,
    Object? nationality = freezed,
    Object? introVideoUrl = freezed,
    Object? profileImageUrl = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? userStatus = freezed,
    Object? appLang = freezed,
    Object? userIdentities = null,
    Object? studentRecitations = null,
    Object? isPaymentSuccess = freezed,
    Object? programId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      isLoginCompleted: null == isLoginCompleted
          ? _value.isLoginCompleted
          : isLoginCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      subscriptionStatus: freezed == subscriptionStatus
          ? _value.subscriptionStatus
          : subscriptionStatus // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus?,
      hasActiveSchedule: null == hasActiveSchedule
          ? _value.hasActiveSchedule
          : hasActiveSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<UserRole>,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      mainLanguage: freezed == mainLanguage
          ? _value.mainLanguage
          : mainLanguage // ignore: cast_nullable_to_non_nullable
              as Language?,
      learningLanguages: null == learningLanguages
          ? _value.learningLanguages
          : learningLanguages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      placeOfResidence: freezed == placeOfResidence
          ? _value.placeOfResidence
          : placeOfResidence // ignore: cast_nullable_to_non_nullable
              as UserPlaceOfResidence?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as UserNationality?,
      introVideoUrl: freezed == introVideoUrl
          ? _value.introVideoUrl
          : introVideoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as BaseField?,
      appLang: freezed == appLang
          ? _value.appLang
          : appLang // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentities: null == userIdentities
          ? _value.userIdentities
          : userIdentities // ignore: cast_nullable_to_non_nullable
              as List<UserIdentity>,
      studentRecitations: null == studentRecitations
          ? _value.studentRecitations
          : studentRecitations // ignore: cast_nullable_to_non_nullable
              as List<StudentRecitation>,
      isPaymentSuccess: freezed == isPaymentSuccess
          ? _value.isPaymentSuccess
          : isPaymentSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      programId: freezed == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String firstName,
      String? middleName,
      String lastName,
      String dateOfBirth,
      bool isLoginCompleted,
      SubscriptionStatus? subscriptionStatus,
      bool hasActiveSchedule,
      bool isVerified,
      List<UserRole> roles,
      String? phoneNumber,
      Language? mainLanguage,
      List<Language> learningLanguages,
      UserPlaceOfResidence? placeOfResidence,
      UserNationality? nationality,
      String? introVideoUrl,
      String? profileImageUrl,
      String? description,
      Gender? gender,
      BaseField? userStatus,
      String? appLang,
      List<UserIdentity> userIdentities,
      List<StudentRecitation> studentRecitations,
      bool? isPaymentSuccess,
      int? programId});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? isLoginCompleted = null,
    Object? subscriptionStatus = freezed,
    Object? hasActiveSchedule = null,
    Object? isVerified = null,
    Object? roles = null,
    Object? phoneNumber = freezed,
    Object? mainLanguage = freezed,
    Object? learningLanguages = null,
    Object? placeOfResidence = freezed,
    Object? nationality = freezed,
    Object? introVideoUrl = freezed,
    Object? profileImageUrl = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? userStatus = freezed,
    Object? appLang = freezed,
    Object? userIdentities = null,
    Object? studentRecitations = null,
    Object? isPaymentSuccess = freezed,
    Object? programId = freezed,
  }) {
    return _then(_$UserInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      isLoginCompleted: null == isLoginCompleted
          ? _value.isLoginCompleted
          : isLoginCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      subscriptionStatus: freezed == subscriptionStatus
          ? _value.subscriptionStatus
          : subscriptionStatus // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus?,
      hasActiveSchedule: null == hasActiveSchedule
          ? _value.hasActiveSchedule
          : hasActiveSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<UserRole>,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      mainLanguage: freezed == mainLanguage
          ? _value.mainLanguage
          : mainLanguage // ignore: cast_nullable_to_non_nullable
              as Language?,
      learningLanguages: null == learningLanguages
          ? _value._learningLanguages
          : learningLanguages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      placeOfResidence: freezed == placeOfResidence
          ? _value.placeOfResidence
          : placeOfResidence // ignore: cast_nullable_to_non_nullable
              as UserPlaceOfResidence?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as UserNationality?,
      introVideoUrl: freezed == introVideoUrl
          ? _value.introVideoUrl
          : introVideoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as BaseField?,
      appLang: freezed == appLang
          ? _value.appLang
          : appLang // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentities: null == userIdentities
          ? _value._userIdentities
          : userIdentities // ignore: cast_nullable_to_non_nullable
              as List<UserIdentity>,
      studentRecitations: null == studentRecitations
          ? _value._studentRecitations
          : studentRecitations // ignore: cast_nullable_to_non_nullable
              as List<StudentRecitation>,
      isPaymentSuccess: freezed == isPaymentSuccess
          ? _value.isPaymentSuccess
          : isPaymentSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      programId: freezed == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {required this.id,
      required this.email,
      required this.firstName,
      this.middleName,
      required this.lastName,
      required this.dateOfBirth,
      required this.isLoginCompleted,
      this.subscriptionStatus,
      required this.hasActiveSchedule,
      required this.isVerified,
      required final List<UserRole> roles,
      this.phoneNumber,
      this.mainLanguage,
      required final List<Language> learningLanguages,
      this.placeOfResidence,
      this.nationality,
      this.introVideoUrl,
      this.profileImageUrl,
      this.description,
      this.gender,
      this.userStatus,
      this.appLang,
      final List<UserIdentity> userIdentities = const [],
      final List<StudentRecitation> studentRecitations = const [],
      this.isPaymentSuccess = false,
      this.programId})
      : _roles = roles,
        _learningLanguages = learningLanguages,
        _userIdentities = userIdentities,
        _studentRecitations = studentRecitations;

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String? middleName;
  @override
  final String lastName;
  @override
  final String dateOfBirth;
  @override
  final bool isLoginCompleted;
  @override
  final SubscriptionStatus? subscriptionStatus;
  @override
  final bool hasActiveSchedule;
  @override
  final bool isVerified;
  final List<UserRole> _roles;
  @override
  List<UserRole> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String? phoneNumber;
  @override
  final Language? mainLanguage;
  final List<Language> _learningLanguages;
  @override
  List<Language> get learningLanguages {
    if (_learningLanguages is EqualUnmodifiableListView)
      return _learningLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_learningLanguages);
  }

  @override
  final UserPlaceOfResidence? placeOfResidence;
  @override
  final UserNationality? nationality;
  @override
  final String? introVideoUrl;
  @override
  final String? profileImageUrl;
  @override
  final String? description;
  @override
  final Gender? gender;
  @override
  final BaseField? userStatus;
  @override
  final String? appLang;
  final List<UserIdentity> _userIdentities;
  @override
  @JsonKey()
  List<UserIdentity> get userIdentities {
    if (_userIdentities is EqualUnmodifiableListView) return _userIdentities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIdentities);
  }

  final List<StudentRecitation> _studentRecitations;
  @override
  @JsonKey()
  List<StudentRecitation> get studentRecitations {
    if (_studentRecitations is EqualUnmodifiableListView)
      return _studentRecitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_studentRecitations);
  }

  @override
  @JsonKey()
  final bool? isPaymentSuccess;
  @override
  final int? programId;

  @override
  String toString() {
    return 'UserInfo(id: $id, email: $email, firstName: $firstName, middleName: $middleName, lastName: $lastName, dateOfBirth: $dateOfBirth, isLoginCompleted: $isLoginCompleted, subscriptionStatus: $subscriptionStatus, hasActiveSchedule: $hasActiveSchedule, isVerified: $isVerified, roles: $roles, phoneNumber: $phoneNumber, mainLanguage: $mainLanguage, learningLanguages: $learningLanguages, placeOfResidence: $placeOfResidence, nationality: $nationality, introVideoUrl: $introVideoUrl, profileImageUrl: $profileImageUrl, description: $description, gender: $gender, userStatus: $userStatus, appLang: $appLang, userIdentities: $userIdentities, studentRecitations: $studentRecitations, isPaymentSuccess: $isPaymentSuccess, programId: $programId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.isLoginCompleted, isLoginCompleted) ||
                other.isLoginCompleted == isLoginCompleted) &&
            (identical(other.subscriptionStatus, subscriptionStatus) ||
                other.subscriptionStatus == subscriptionStatus) &&
            (identical(other.hasActiveSchedule, hasActiveSchedule) ||
                other.hasActiveSchedule == hasActiveSchedule) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.mainLanguage, mainLanguage) ||
                other.mainLanguage == mainLanguage) &&
            const DeepCollectionEquality()
                .equals(other._learningLanguages, _learningLanguages) &&
            (identical(other.placeOfResidence, placeOfResidence) ||
                other.placeOfResidence == placeOfResidence) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.introVideoUrl, introVideoUrl) ||
                other.introVideoUrl == introVideoUrl) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.appLang, appLang) || other.appLang == appLang) &&
            const DeepCollectionEquality()
                .equals(other._userIdentities, _userIdentities) &&
            const DeepCollectionEquality()
                .equals(other._studentRecitations, _studentRecitations) &&
            (identical(other.isPaymentSuccess, isPaymentSuccess) ||
                other.isPaymentSuccess == isPaymentSuccess) &&
            (identical(other.programId, programId) ||
                other.programId == programId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        email,
        firstName,
        middleName,
        lastName,
        dateOfBirth,
        isLoginCompleted,
        subscriptionStatus,
        hasActiveSchedule,
        isVerified,
        const DeepCollectionEquality().hash(_roles),
        phoneNumber,
        mainLanguage,
        const DeepCollectionEquality().hash(_learningLanguages),
        placeOfResidence,
        nationality,
        introVideoUrl,
        profileImageUrl,
        description,
        gender,
        userStatus,
        appLang,
        const DeepCollectionEquality().hash(_userIdentities),
        const DeepCollectionEquality().hash(_studentRecitations),
        isPaymentSuccess,
        programId
      ]);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {required final int id,
      required final String email,
      required final String firstName,
      final String? middleName,
      required final String lastName,
      required final String dateOfBirth,
      required final bool isLoginCompleted,
      final SubscriptionStatus? subscriptionStatus,
      required final bool hasActiveSchedule,
      required final bool isVerified,
      required final List<UserRole> roles,
      final String? phoneNumber,
      final Language? mainLanguage,
      required final List<Language> learningLanguages,
      final UserPlaceOfResidence? placeOfResidence,
      final UserNationality? nationality,
      final String? introVideoUrl,
      final String? profileImageUrl,
      final String? description,
      final Gender? gender,
      final BaseField? userStatus,
      final String? appLang,
      final List<UserIdentity> userIdentities,
      final List<StudentRecitation> studentRecitations,
      final bool? isPaymentSuccess,
      final int? programId}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String? get middleName;
  @override
  String get lastName;
  @override
  String get dateOfBirth;
  @override
  bool get isLoginCompleted;
  @override
  SubscriptionStatus? get subscriptionStatus;
  @override
  bool get hasActiveSchedule;
  @override
  bool get isVerified;
  @override
  List<UserRole> get roles;
  @override
  String? get phoneNumber;
  @override
  Language? get mainLanguage;
  @override
  List<Language> get learningLanguages;
  @override
  UserPlaceOfResidence? get placeOfResidence;
  @override
  UserNationality? get nationality;
  @override
  String? get introVideoUrl;
  @override
  String? get profileImageUrl;
  @override
  String? get description;
  @override
  Gender? get gender;
  @override
  BaseField? get userStatus;
  @override
  String? get appLang;
  @override
  List<UserIdentity> get userIdentities;
  @override
  List<StudentRecitation> get studentRecitations;
  @override
  bool? get isPaymentSuccess;
  @override
  int? get programId;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
