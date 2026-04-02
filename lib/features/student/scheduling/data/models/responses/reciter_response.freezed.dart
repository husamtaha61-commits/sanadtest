// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReciterResponse _$ReciterResponseFromJson(Map<String, dynamic> json) {
  return _ReciterResponse.fromJson(json);
}

/// @nodoc
mixin _$ReciterResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get profileImageId => throw _privateConstructorUsedError;
  String? get videoId => throw _privateConstructorUsedError;
  String? get nationalityName => throw _privateConstructorUsedError;
  String? get countryIsocode => throw _privateConstructorUsedError;
  List<BaseFieldResponse>? get teachingLanguages =>
      throw _privateConstructorUsedError;
  bool? get isFavorite => throw _privateConstructorUsedError;
  bool? get isRecievingNewStudents => throw _privateConstructorUsedError;
  List<BaseFieldResponse>? get recitations =>
      throw _privateConstructorUsedError;

  /// Create a copy of ReciterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterResponseCopyWith<ReciterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterResponseCopyWith<$Res> {
  factory $ReciterResponseCopyWith(
          ReciterResponse value, $Res Function(ReciterResponse) then) =
      _$ReciterResponseCopyWithImpl<$Res, ReciterResponse>;
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? middleName,
      String? lastName,
      String? dateOfBirth,
      String? gender,
      String? description,
      String? profileImageId,
      String? videoId,
      String? nationalityName,
      String? countryIsocode,
      List<BaseFieldResponse>? teachingLanguages,
      bool? isFavorite,
      bool? isRecievingNewStudents,
      List<BaseFieldResponse>? recitations});
}

/// @nodoc
class _$ReciterResponseCopyWithImpl<$Res, $Val extends ReciterResponse>
    implements $ReciterResponseCopyWith<$Res> {
  _$ReciterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReciterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? description = freezed,
    Object? profileImageId = freezed,
    Object? videoId = freezed,
    Object? nationalityName = freezed,
    Object? countryIsocode = freezed,
    Object? teachingLanguages = freezed,
    Object? isFavorite = freezed,
    Object? isRecievingNewStudents = freezed,
    Object? recitations = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageId: freezed == profileImageId
          ? _value.profileImageId
          : profileImageId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalityName: freezed == nationalityName
          ? _value.nationalityName
          : nationalityName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryIsocode: freezed == countryIsocode
          ? _value.countryIsocode
          : countryIsocode // ignore: cast_nullable_to_non_nullable
              as String?,
      teachingLanguages: freezed == teachingLanguages
          ? _value.teachingLanguages
          : teachingLanguages // ignore: cast_nullable_to_non_nullable
              as List<BaseFieldResponse>?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRecievingNewStudents: freezed == isRecievingNewStudents
          ? _value.isRecievingNewStudents
          : isRecievingNewStudents // ignore: cast_nullable_to_non_nullable
              as bool?,
      recitations: freezed == recitations
          ? _value.recitations
          : recitations // ignore: cast_nullable_to_non_nullable
              as List<BaseFieldResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReciterResponseImplCopyWith<$Res>
    implements $ReciterResponseCopyWith<$Res> {
  factory _$$ReciterResponseImplCopyWith(_$ReciterResponseImpl value,
          $Res Function(_$ReciterResponseImpl) then) =
      __$$ReciterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? middleName,
      String? lastName,
      String? dateOfBirth,
      String? gender,
      String? description,
      String? profileImageId,
      String? videoId,
      String? nationalityName,
      String? countryIsocode,
      List<BaseFieldResponse>? teachingLanguages,
      bool? isFavorite,
      bool? isRecievingNewStudents,
      List<BaseFieldResponse>? recitations});
}

/// @nodoc
class __$$ReciterResponseImplCopyWithImpl<$Res>
    extends _$ReciterResponseCopyWithImpl<$Res, _$ReciterResponseImpl>
    implements _$$ReciterResponseImplCopyWith<$Res> {
  __$$ReciterResponseImplCopyWithImpl(
      _$ReciterResponseImpl _value, $Res Function(_$ReciterResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReciterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? description = freezed,
    Object? profileImageId = freezed,
    Object? videoId = freezed,
    Object? nationalityName = freezed,
    Object? countryIsocode = freezed,
    Object? teachingLanguages = freezed,
    Object? isFavorite = freezed,
    Object? isRecievingNewStudents = freezed,
    Object? recitations = freezed,
  }) {
    return _then(_$ReciterResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageId: freezed == profileImageId
          ? _value.profileImageId
          : profileImageId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalityName: freezed == nationalityName
          ? _value.nationalityName
          : nationalityName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryIsocode: freezed == countryIsocode
          ? _value.countryIsocode
          : countryIsocode // ignore: cast_nullable_to_non_nullable
              as String?,
      teachingLanguages: freezed == teachingLanguages
          ? _value._teachingLanguages
          : teachingLanguages // ignore: cast_nullable_to_non_nullable
              as List<BaseFieldResponse>?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRecievingNewStudents: freezed == isRecievingNewStudents
          ? _value.isRecievingNewStudents
          : isRecievingNewStudents // ignore: cast_nullable_to_non_nullable
              as bool?,
      recitations: freezed == recitations
          ? _value._recitations
          : recitations // ignore: cast_nullable_to_non_nullable
              as List<BaseFieldResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ReciterResponseImpl implements _ReciterResponse {
  const _$ReciterResponseImpl(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.description,
      this.profileImageId,
      this.videoId,
      this.nationalityName,
      this.countryIsocode,
      final List<BaseFieldResponse>? teachingLanguages,
      this.isFavorite,
      this.isRecievingNewStudents,
      final List<BaseFieldResponse>? recitations})
      : _teachingLanguages = teachingLanguages,
        _recitations = recitations;

  factory _$ReciterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReciterResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? firstName;
  @override
  final String? middleName;
  @override
  final String? lastName;
  @override
  final String? dateOfBirth;
  @override
  final String? gender;
  @override
  final String? description;
  @override
  final String? profileImageId;
  @override
  final String? videoId;
  @override
  final String? nationalityName;
  @override
  final String? countryIsocode;
  final List<BaseFieldResponse>? _teachingLanguages;
  @override
  List<BaseFieldResponse>? get teachingLanguages {
    final value = _teachingLanguages;
    if (value == null) return null;
    if (_teachingLanguages is EqualUnmodifiableListView)
      return _teachingLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isFavorite;
  @override
  final bool? isRecievingNewStudents;
  final List<BaseFieldResponse>? _recitations;
  @override
  List<BaseFieldResponse>? get recitations {
    final value = _recitations;
    if (value == null) return null;
    if (_recitations is EqualUnmodifiableListView) return _recitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReciterResponse(id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName, dateOfBirth: $dateOfBirth, gender: $gender, description: $description, profileImageId: $profileImageId, videoId: $videoId, nationalityName: $nationalityName, countryIsocode: $countryIsocode, teachingLanguages: $teachingLanguages, isFavorite: $isFavorite, isRecievingNewStudents: $isRecievingNewStudents, recitations: $recitations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.profileImageId, profileImageId) ||
                other.profileImageId == profileImageId) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.nationalityName, nationalityName) ||
                other.nationalityName == nationalityName) &&
            (identical(other.countryIsocode, countryIsocode) ||
                other.countryIsocode == countryIsocode) &&
            const DeepCollectionEquality()
                .equals(other._teachingLanguages, _teachingLanguages) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isRecievingNewStudents, isRecievingNewStudents) ||
                other.isRecievingNewStudents == isRecievingNewStudents) &&
            const DeepCollectionEquality()
                .equals(other._recitations, _recitations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      middleName,
      lastName,
      dateOfBirth,
      gender,
      description,
      profileImageId,
      videoId,
      nationalityName,
      countryIsocode,
      const DeepCollectionEquality().hash(_teachingLanguages),
      isFavorite,
      isRecievingNewStudents,
      const DeepCollectionEquality().hash(_recitations));

  /// Create a copy of ReciterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterResponseImplCopyWith<_$ReciterResponseImpl> get copyWith =>
      __$$ReciterResponseImplCopyWithImpl<_$ReciterResponseImpl>(
          this, _$identity);
}

abstract class _ReciterResponse implements ReciterResponse {
  const factory _ReciterResponse(
      {final int? id,
      final String? firstName,
      final String? middleName,
      final String? lastName,
      final String? dateOfBirth,
      final String? gender,
      final String? description,
      final String? profileImageId,
      final String? videoId,
      final String? nationalityName,
      final String? countryIsocode,
      final List<BaseFieldResponse>? teachingLanguages,
      final bool? isFavorite,
      final bool? isRecievingNewStudents,
      final List<BaseFieldResponse>? recitations}) = _$ReciterResponseImpl;

  factory _ReciterResponse.fromJson(Map<String, dynamic> json) =
      _$ReciterResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get firstName;
  @override
  String? get middleName;
  @override
  String? get lastName;
  @override
  String? get dateOfBirth;
  @override
  String? get gender;
  @override
  String? get description;
  @override
  String? get profileImageId;
  @override
  String? get videoId;
  @override
  String? get nationalityName;
  @override
  String? get countryIsocode;
  @override
  List<BaseFieldResponse>? get teachingLanguages;
  @override
  bool? get isFavorite;
  @override
  bool? get isRecievingNewStudents;
  @override
  List<BaseFieldResponse>? get recitations;

  /// Create a copy of ReciterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterResponseImplCopyWith<_$ReciterResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
