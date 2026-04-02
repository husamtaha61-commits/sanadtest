// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountSettingsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  bool get isReadMode => throw _privateConstructorUsedError;
  String get backendMessage => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get middleName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  BaseField? get nationality => throw _privateConstructorUsedError;
  BaseField? get country => throw _privateConstructorUsedError;
  Language? get mainLanguage => throw _privateConstructorUsedError;
  List<Language> get learningLanguages => throw _privateConstructorUsedError;
  BaseField? get recitation => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  XFile? get profileImageFile => throw _privateConstructorUsedError;
  XFile? get videoFile => throw _privateConstructorUsedError;
  List<XFile> get userIdentityFiles => throw _privateConstructorUsedError;
  List<XFile> get certificates => throw _privateConstructorUsedError;
  List<XFile> get otherCertificates => throw _privateConstructorUsedError;
  int? get genderId => throw _privateConstructorUsedError;
  int? get userIdentityTypeId => throw _privateConstructorUsedError;
  PhoneNumber? get phoneNumber => throw _privateConstructorUsedError;

  /// Create a copy of AccountSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountSettingsStateCopyWith<AccountSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSettingsStateCopyWith<$Res> {
  factory $AccountSettingsStateCopyWith(AccountSettingsState value,
          $Res Function(AccountSettingsState) then) =
      _$AccountSettingsStateCopyWithImpl<$Res, AccountSettingsState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      bool isReadMode,
      String backendMessage,
      String firstName,
      String middleName,
      String lastName,
      String email,
      String dateOfBirth,
      BaseField? nationality,
      BaseField? country,
      Language? mainLanguage,
      List<Language> learningLanguages,
      BaseField? recitation,
      String? gender,
      XFile? profileImageFile,
      XFile? videoFile,
      List<XFile> userIdentityFiles,
      List<XFile> certificates,
      List<XFile> otherCertificates,
      int? genderId,
      int? userIdentityTypeId,
      PhoneNumber? phoneNumber});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$AccountSettingsStateCopyWithImpl<$Res,
        $Val extends AccountSettingsState>
    implements $AccountSettingsStateCopyWith<$Res> {
  _$AccountSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isReadMode = null,
    Object? backendMessage = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? email = null,
    Object? dateOfBirth = null,
    Object? nationality = freezed,
    Object? country = freezed,
    Object? mainLanguage = freezed,
    Object? learningLanguages = null,
    Object? recitation = freezed,
    Object? gender = freezed,
    Object? profileImageFile = freezed,
    Object? videoFile = freezed,
    Object? userIdentityFiles = null,
    Object? certificates = null,
    Object? otherCertificates = null,
    Object? genderId = freezed,
    Object? userIdentityTypeId = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      isReadMode: null == isReadMode
          ? _value.isReadMode
          : isReadMode // ignore: cast_nullable_to_non_nullable
              as bool,
      backendMessage: null == backendMessage
          ? _value.backendMessage
          : backendMessage // ignore: cast_nullable_to_non_nullable
              as String,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as BaseField?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as BaseField?,
      mainLanguage: freezed == mainLanguage
          ? _value.mainLanguage
          : mainLanguage // ignore: cast_nullable_to_non_nullable
              as Language?,
      learningLanguages: null == learningLanguages
          ? _value.learningLanguages
          : learningLanguages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      recitation: freezed == recitation
          ? _value.recitation
          : recitation // ignore: cast_nullable_to_non_nullable
              as BaseField?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageFile: freezed == profileImageFile
          ? _value.profileImageFile
          : profileImageFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
      videoFile: freezed == videoFile
          ? _value.videoFile
          : videoFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
      userIdentityFiles: null == userIdentityFiles
          ? _value.userIdentityFiles
          : userIdentityFiles // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      certificates: null == certificates
          ? _value.certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      otherCertificates: null == otherCertificates
          ? _value.otherCertificates
          : otherCertificates // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      genderId: freezed == genderId
          ? _value.genderId
          : genderId // ignore: cast_nullable_to_non_nullable
              as int?,
      userIdentityTypeId: freezed == userIdentityTypeId
          ? _value.userIdentityTypeId
          : userIdentityTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
    ) as $Val);
  }

  /// Create a copy of AccountSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get status {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountSettingsStateImplCopyWith<$Res>
    implements $AccountSettingsStateCopyWith<$Res> {
  factory _$$AccountSettingsStateImplCopyWith(_$AccountSettingsStateImpl value,
          $Res Function(_$AccountSettingsStateImpl) then) =
      __$$AccountSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      bool isReadMode,
      String backendMessage,
      String firstName,
      String middleName,
      String lastName,
      String email,
      String dateOfBirth,
      BaseField? nationality,
      BaseField? country,
      Language? mainLanguage,
      List<Language> learningLanguages,
      BaseField? recitation,
      String? gender,
      XFile? profileImageFile,
      XFile? videoFile,
      List<XFile> userIdentityFiles,
      List<XFile> certificates,
      List<XFile> otherCertificates,
      int? genderId,
      int? userIdentityTypeId,
      PhoneNumber? phoneNumber});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$AccountSettingsStateImplCopyWithImpl<$Res>
    extends _$AccountSettingsStateCopyWithImpl<$Res, _$AccountSettingsStateImpl>
    implements _$$AccountSettingsStateImplCopyWith<$Res> {
  __$$AccountSettingsStateImplCopyWithImpl(_$AccountSettingsStateImpl _value,
      $Res Function(_$AccountSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isReadMode = null,
    Object? backendMessage = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? email = null,
    Object? dateOfBirth = null,
    Object? nationality = freezed,
    Object? country = freezed,
    Object? mainLanguage = freezed,
    Object? learningLanguages = null,
    Object? recitation = freezed,
    Object? gender = freezed,
    Object? profileImageFile = freezed,
    Object? videoFile = freezed,
    Object? userIdentityFiles = null,
    Object? certificates = null,
    Object? otherCertificates = null,
    Object? genderId = freezed,
    Object? userIdentityTypeId = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$AccountSettingsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      isReadMode: null == isReadMode
          ? _value.isReadMode
          : isReadMode // ignore: cast_nullable_to_non_nullable
              as bool,
      backendMessage: null == backendMessage
          ? _value.backendMessage
          : backendMessage // ignore: cast_nullable_to_non_nullable
              as String,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as BaseField?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as BaseField?,
      mainLanguage: freezed == mainLanguage
          ? _value.mainLanguage
          : mainLanguage // ignore: cast_nullable_to_non_nullable
              as Language?,
      learningLanguages: null == learningLanguages
          ? _value._learningLanguages
          : learningLanguages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      recitation: freezed == recitation
          ? _value.recitation
          : recitation // ignore: cast_nullable_to_non_nullable
              as BaseField?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageFile: freezed == profileImageFile
          ? _value.profileImageFile
          : profileImageFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
      videoFile: freezed == videoFile
          ? _value.videoFile
          : videoFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
      userIdentityFiles: null == userIdentityFiles
          ? _value._userIdentityFiles
          : userIdentityFiles // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      certificates: null == certificates
          ? _value._certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      otherCertificates: null == otherCertificates
          ? _value._otherCertificates
          : otherCertificates // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      genderId: freezed == genderId
          ? _value.genderId
          : genderId // ignore: cast_nullable_to_non_nullable
              as int?,
      userIdentityTypeId: freezed == userIdentityTypeId
          ? _value.userIdentityTypeId
          : userIdentityTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
    ));
  }
}

/// @nodoc

class _$AccountSettingsStateImpl implements _AccountSettingsState {
  const _$AccountSettingsStateImpl(
      {this.status = const BaseStatus.initial(),
      this.isReadMode = true,
      this.backendMessage = "",
      this.firstName = '',
      this.middleName = '',
      this.lastName = '',
      this.email = '',
      this.dateOfBirth = '',
      this.nationality,
      this.country,
      this.mainLanguage,
      final List<Language> learningLanguages = const [],
      this.recitation,
      this.gender,
      this.profileImageFile,
      this.videoFile,
      final List<XFile> userIdentityFiles = const [],
      final List<XFile> certificates = const [],
      final List<XFile> otherCertificates = const [],
      this.genderId,
      this.userIdentityTypeId,
      this.phoneNumber})
      : _learningLanguages = learningLanguages,
        _userIdentityFiles = userIdentityFiles,
        _certificates = certificates,
        _otherCertificates = otherCertificates;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final bool isReadMode;
  @override
  @JsonKey()
  final String backendMessage;
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
  final String email;
  @override
  @JsonKey()
  final String dateOfBirth;
  @override
  final BaseField? nationality;
  @override
  final BaseField? country;
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
  final BaseField? recitation;
  @override
  final String? gender;
  @override
  final XFile? profileImageFile;
  @override
  final XFile? videoFile;
  final List<XFile> _userIdentityFiles;
  @override
  @JsonKey()
  List<XFile> get userIdentityFiles {
    if (_userIdentityFiles is EqualUnmodifiableListView)
      return _userIdentityFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIdentityFiles);
  }

  final List<XFile> _certificates;
  @override
  @JsonKey()
  List<XFile> get certificates {
    if (_certificates is EqualUnmodifiableListView) return _certificates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_certificates);
  }

  final List<XFile> _otherCertificates;
  @override
  @JsonKey()
  List<XFile> get otherCertificates {
    if (_otherCertificates is EqualUnmodifiableListView)
      return _otherCertificates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherCertificates);
  }

  @override
  final int? genderId;
  @override
  final int? userIdentityTypeId;
  @override
  final PhoneNumber? phoneNumber;

  @override
  String toString() {
    return 'AccountSettingsState(status: $status, isReadMode: $isReadMode, backendMessage: $backendMessage, firstName: $firstName, middleName: $middleName, lastName: $lastName, email: $email, dateOfBirth: $dateOfBirth, nationality: $nationality, country: $country, mainLanguage: $mainLanguage, learningLanguages: $learningLanguages, recitation: $recitation, gender: $gender, profileImageFile: $profileImageFile, videoFile: $videoFile, userIdentityFiles: $userIdentityFiles, certificates: $certificates, otherCertificates: $otherCertificates, genderId: $genderId, userIdentityTypeId: $userIdentityTypeId, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountSettingsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isReadMode, isReadMode) ||
                other.isReadMode == isReadMode) &&
            (identical(other.backendMessage, backendMessage) ||
                other.backendMessage == backendMessage) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.mainLanguage, mainLanguage) ||
                other.mainLanguage == mainLanguage) &&
            const DeepCollectionEquality()
                .equals(other._learningLanguages, _learningLanguages) &&
            (identical(other.recitation, recitation) ||
                other.recitation == recitation) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profileImageFile, profileImageFile) ||
                other.profileImageFile == profileImageFile) &&
            (identical(other.videoFile, videoFile) ||
                other.videoFile == videoFile) &&
            const DeepCollectionEquality()
                .equals(other._userIdentityFiles, _userIdentityFiles) &&
            const DeepCollectionEquality()
                .equals(other._certificates, _certificates) &&
            const DeepCollectionEquality()
                .equals(other._otherCertificates, _otherCertificates) &&
            (identical(other.genderId, genderId) ||
                other.genderId == genderId) &&
            (identical(other.userIdentityTypeId, userIdentityTypeId) ||
                other.userIdentityTypeId == userIdentityTypeId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        isReadMode,
        backendMessage,
        firstName,
        middleName,
        lastName,
        email,
        dateOfBirth,
        nationality,
        country,
        mainLanguage,
        const DeepCollectionEquality().hash(_learningLanguages),
        recitation,
        gender,
        profileImageFile,
        videoFile,
        const DeepCollectionEquality().hash(_userIdentityFiles),
        const DeepCollectionEquality().hash(_certificates),
        const DeepCollectionEquality().hash(_otherCertificates),
        genderId,
        userIdentityTypeId,
        phoneNumber
      ]);

  /// Create a copy of AccountSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountSettingsStateImplCopyWith<_$AccountSettingsStateImpl>
      get copyWith =>
          __$$AccountSettingsStateImplCopyWithImpl<_$AccountSettingsStateImpl>(
              this, _$identity);
}

abstract class _AccountSettingsState implements AccountSettingsState {
  const factory _AccountSettingsState(
      {final BaseStatus<dynamic> status,
      final bool isReadMode,
      final String backendMessage,
      final String firstName,
      final String middleName,
      final String lastName,
      final String email,
      final String dateOfBirth,
      final BaseField? nationality,
      final BaseField? country,
      final Language? mainLanguage,
      final List<Language> learningLanguages,
      final BaseField? recitation,
      final String? gender,
      final XFile? profileImageFile,
      final XFile? videoFile,
      final List<XFile> userIdentityFiles,
      final List<XFile> certificates,
      final List<XFile> otherCertificates,
      final int? genderId,
      final int? userIdentityTypeId,
      final PhoneNumber? phoneNumber}) = _$AccountSettingsStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  bool get isReadMode;
  @override
  String get backendMessage;
  @override
  String get firstName;
  @override
  String get middleName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get dateOfBirth;
  @override
  BaseField? get nationality;
  @override
  BaseField? get country;
  @override
  Language? get mainLanguage;
  @override
  List<Language> get learningLanguages;
  @override
  BaseField? get recitation;
  @override
  String? get gender;
  @override
  XFile? get profileImageFile;
  @override
  XFile? get videoFile;
  @override
  List<XFile> get userIdentityFiles;
  @override
  List<XFile> get certificates;
  @override
  List<XFile> get otherCertificates;
  @override
  int? get genderId;
  @override
  int? get userIdentityTypeId;
  @override
  PhoneNumber? get phoneNumber;

  /// Create a copy of AccountSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountSettingsStateImplCopyWith<_$AccountSettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
