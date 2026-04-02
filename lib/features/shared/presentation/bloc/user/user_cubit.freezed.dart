// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get middleName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isLoginCompleted => throw _privateConstructorUsedError;
  bool get hasActiveSchedule => throw _privateConstructorUsedError;
  UserRole? get role => throw _privateConstructorUsedError;
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
  SubscriptionStatus? get subscriptionStatus =>
      throw _privateConstructorUsedError;
  UserInfo? get userInfo => throw _privateConstructorUsedError;
  BaseField? get userStatus => throw _privateConstructorUsedError;
  String? get appLang => throw _privateConstructorUsedError;
  List<UserIdentity> get userIdentities => throw _privateConstructorUsedError;
  List<StudentRecitation> get studentRecitations =>
      throw _privateConstructorUsedError;
  List<XFile> get userIdentityFiles => throw _privateConstructorUsedError;
  XFile? get videoFile => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int id,
      String firstName,
      String middleName,
      String lastName,
      String dateOfBirth,
      String email,
      bool isVerified,
      bool isLoginCompleted,
      bool hasActiveSchedule,
      UserRole? role,
      String? phoneNumber,
      Language? mainLanguage,
      List<Language> learningLanguages,
      UserPlaceOfResidence? placeOfResidence,
      UserNationality? nationality,
      String? introVideoUrl,
      String? profileImageUrl,
      String? description,
      Gender? gender,
      SubscriptionStatus? subscriptionStatus,
      UserInfo? userInfo,
      BaseField? userStatus,
      String? appLang,
      List<UserIdentity> userIdentities,
      List<StudentRecitation> studentRecitations,
      List<XFile> userIdentityFiles,
      XFile? videoFile});

  $BaseStatusCopyWith<dynamic, $Res> get status;
  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? id = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? email = null,
    Object? isVerified = null,
    Object? isLoginCompleted = null,
    Object? hasActiveSchedule = null,
    Object? role = freezed,
    Object? phoneNumber = freezed,
    Object? mainLanguage = freezed,
    Object? learningLanguages = null,
    Object? placeOfResidence = freezed,
    Object? nationality = freezed,
    Object? introVideoUrl = freezed,
    Object? profileImageUrl = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? subscriptionStatus = freezed,
    Object? userInfo = freezed,
    Object? userStatus = freezed,
    Object? appLang = freezed,
    Object? userIdentities = null,
    Object? studentRecitations = null,
    Object? userIdentityFiles = null,
    Object? videoFile = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginCompleted: null == isLoginCompleted
          ? _value.isLoginCompleted
          : isLoginCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveSchedule: null == hasActiveSchedule
          ? _value.hasActiveSchedule
          : hasActiveSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole?,
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
      subscriptionStatus: freezed == subscriptionStatus
          ? _value.subscriptionStatus
          : subscriptionStatus // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
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
      userIdentityFiles: null == userIdentityFiles
          ? _value.userIdentityFiles
          : userIdentityFiles // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      videoFile: freezed == videoFile
          ? _value.videoFile
          : videoFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
    ) as $Val);
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get status {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_value.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_value.userInfo!, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int id,
      String firstName,
      String middleName,
      String lastName,
      String dateOfBirth,
      String email,
      bool isVerified,
      bool isLoginCompleted,
      bool hasActiveSchedule,
      UserRole? role,
      String? phoneNumber,
      Language? mainLanguage,
      List<Language> learningLanguages,
      UserPlaceOfResidence? placeOfResidence,
      UserNationality? nationality,
      String? introVideoUrl,
      String? profileImageUrl,
      String? description,
      Gender? gender,
      SubscriptionStatus? subscriptionStatus,
      UserInfo? userInfo,
      BaseField? userStatus,
      String? appLang,
      List<UserIdentity> userIdentities,
      List<StudentRecitation> studentRecitations,
      List<XFile> userIdentityFiles,
      XFile? videoFile});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
  @override
  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? id = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? email = null,
    Object? isVerified = null,
    Object? isLoginCompleted = null,
    Object? hasActiveSchedule = null,
    Object? role = freezed,
    Object? phoneNumber = freezed,
    Object? mainLanguage = freezed,
    Object? learningLanguages = null,
    Object? placeOfResidence = freezed,
    Object? nationality = freezed,
    Object? introVideoUrl = freezed,
    Object? profileImageUrl = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? subscriptionStatus = freezed,
    Object? userInfo = freezed,
    Object? userStatus = freezed,
    Object? appLang = freezed,
    Object? userIdentities = null,
    Object? studentRecitations = null,
    Object? userIdentityFiles = null,
    Object? videoFile = freezed,
  }) {
    return _then(_$UserStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginCompleted: null == isLoginCompleted
          ? _value.isLoginCompleted
          : isLoginCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveSchedule: null == hasActiveSchedule
          ? _value.hasActiveSchedule
          : hasActiveSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole?,
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
      subscriptionStatus: freezed == subscriptionStatus
          ? _value.subscriptionStatus
          : subscriptionStatus // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
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
      userIdentityFiles: null == userIdentityFiles
          ? _value._userIdentityFiles
          : userIdentityFiles // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      videoFile: freezed == videoFile
          ? _value.videoFile
          : videoFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {this.status = const BaseStatus.initial(),
      this.id = 0,
      this.firstName = '',
      this.middleName = '',
      this.lastName = '',
      this.dateOfBirth = '',
      this.email = '',
      this.isVerified = false,
      this.isLoginCompleted = false,
      this.hasActiveSchedule = false,
      this.role,
      this.phoneNumber,
      this.mainLanguage,
      final List<Language> learningLanguages = const [],
      this.placeOfResidence,
      this.nationality,
      this.introVideoUrl,
      this.profileImageUrl,
      this.description,
      this.gender,
      this.subscriptionStatus,
      this.userInfo,
      this.userStatus,
      this.appLang,
      final List<UserIdentity> userIdentities = const [],
      final List<StudentRecitation> studentRecitations = const [],
      final List<XFile> userIdentityFiles = const [],
      this.videoFile})
      : _learningLanguages = learningLanguages,
        _userIdentities = userIdentities,
        _studentRecitations = studentRecitations,
        _userIdentityFiles = userIdentityFiles;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String middleName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String dateOfBirth;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final bool isLoginCompleted;
  @override
  @JsonKey()
  final bool hasActiveSchedule;
  @override
  final UserRole? role;
  @override
  final String? phoneNumber;
  @override
  final Language? mainLanguage;
  final List<Language> _learningLanguages;
  @override
  @JsonKey()
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
  final SubscriptionStatus? subscriptionStatus;
  @override
  final UserInfo? userInfo;
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

  final List<XFile> _userIdentityFiles;
  @override
  @JsonKey()
  List<XFile> get userIdentityFiles {
    if (_userIdentityFiles is EqualUnmodifiableListView)
      return _userIdentityFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIdentityFiles);
  }

  @override
  final XFile? videoFile;

  @override
  String toString() {
    return 'UserState(status: $status, id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName, dateOfBirth: $dateOfBirth, email: $email, isVerified: $isVerified, isLoginCompleted: $isLoginCompleted, hasActiveSchedule: $hasActiveSchedule, role: $role, phoneNumber: $phoneNumber, mainLanguage: $mainLanguage, learningLanguages: $learningLanguages, placeOfResidence: $placeOfResidence, nationality: $nationality, introVideoUrl: $introVideoUrl, profileImageUrl: $profileImageUrl, description: $description, gender: $gender, subscriptionStatus: $subscriptionStatus, userInfo: $userInfo, userStatus: $userStatus, appLang: $appLang, userIdentities: $userIdentities, studentRecitations: $studentRecitations, userIdentityFiles: $userIdentityFiles, videoFile: $videoFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isLoginCompleted, isLoginCompleted) ||
                other.isLoginCompleted == isLoginCompleted) &&
            (identical(other.hasActiveSchedule, hasActiveSchedule) ||
                other.hasActiveSchedule == hasActiveSchedule) &&
            (identical(other.role, role) || other.role == role) &&
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
            (identical(other.subscriptionStatus, subscriptionStatus) ||
                other.subscriptionStatus == subscriptionStatus) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.appLang, appLang) || other.appLang == appLang) &&
            const DeepCollectionEquality()
                .equals(other._userIdentities, _userIdentities) &&
            const DeepCollectionEquality()
                .equals(other._studentRecitations, _studentRecitations) &&
            const DeepCollectionEquality()
                .equals(other._userIdentityFiles, _userIdentityFiles) &&
            (identical(other.videoFile, videoFile) ||
                other.videoFile == videoFile));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        id,
        firstName,
        middleName,
        lastName,
        dateOfBirth,
        email,
        isVerified,
        isLoginCompleted,
        hasActiveSchedule,
        role,
        phoneNumber,
        mainLanguage,
        const DeepCollectionEquality().hash(_learningLanguages),
        placeOfResidence,
        nationality,
        introVideoUrl,
        profileImageUrl,
        description,
        gender,
        subscriptionStatus,
        userInfo,
        userStatus,
        appLang,
        const DeepCollectionEquality().hash(_userIdentities),
        const DeepCollectionEquality().hash(_studentRecitations),
        const DeepCollectionEquality().hash(_userIdentityFiles),
        videoFile
      ]);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {final BaseStatus<dynamic> status,
      final int id,
      final String firstName,
      final String middleName,
      final String lastName,
      final String dateOfBirth,
      final String email,
      final bool isVerified,
      final bool isLoginCompleted,
      final bool hasActiveSchedule,
      final UserRole? role,
      final String? phoneNumber,
      final Language? mainLanguage,
      final List<Language> learningLanguages,
      final UserPlaceOfResidence? placeOfResidence,
      final UserNationality? nationality,
      final String? introVideoUrl,
      final String? profileImageUrl,
      final String? description,
      final Gender? gender,
      final SubscriptionStatus? subscriptionStatus,
      final UserInfo? userInfo,
      final BaseField? userStatus,
      final String? appLang,
      final List<UserIdentity> userIdentities,
      final List<StudentRecitation> studentRecitations,
      final List<XFile> userIdentityFiles,
      final XFile? videoFile}) = _$UserStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  int get id;
  @override
  String get firstName;
  @override
  String get middleName;
  @override
  String get lastName;
  @override
  String get dateOfBirth;
  @override
  String get email;
  @override
  bool get isVerified;
  @override
  bool get isLoginCompleted;
  @override
  bool get hasActiveSchedule;
  @override
  UserRole? get role;
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
  SubscriptionStatus? get subscriptionStatus;
  @override
  UserInfo? get userInfo;
  @override
  BaseField? get userStatus;
  @override
  String? get appLang;
  @override
  List<UserIdentity> get userIdentities;
  @override
  List<StudentRecitation> get studentRecitations;
  @override
  List<XFile> get userIdentityFiles;
  @override
  XFile? get videoFile;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
