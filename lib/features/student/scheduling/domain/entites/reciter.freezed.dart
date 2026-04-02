// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Reciter {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get middleName => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get profileImageId => throw _privateConstructorUsedError;
  String? get videoId => throw _privateConstructorUsedError;
  String get nationalityName => throw _privateConstructorUsedError;
  String get countryIsocode => throw _privateConstructorUsedError;
  List<BaseField> get teachingLanguages => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  bool get isReceivingNewStudents => throw _privateConstructorUsedError;
  List<BaseField>? get recitations => throw _privateConstructorUsedError;

  /// Create a copy of Reciter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterCopyWith<Reciter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterCopyWith<$Res> {
  factory $ReciterCopyWith(Reciter value, $Res Function(Reciter) then) =
      _$ReciterCopyWithImpl<$Res, Reciter>;
  @useResult
  $Res call(
      {int id,
      String firstName,
      String middleName,
      String gender,
      String lastName,
      String dateOfBirth,
      String? description,
      String profileImageId,
      String? videoId,
      String nationalityName,
      String countryIsocode,
      List<BaseField> teachingLanguages,
      bool isFavorite,
      bool isReceivingNewStudents,
      List<BaseField>? recitations});
}

/// @nodoc
class _$ReciterCopyWithImpl<$Res, $Val extends Reciter>
    implements $ReciterCopyWith<$Res> {
  _$ReciterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reciter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? gender = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? description = freezed,
    Object? profileImageId = null,
    Object? videoId = freezed,
    Object? nationalityName = null,
    Object? countryIsocode = null,
    Object? teachingLanguages = null,
    Object? isFavorite = null,
    Object? isReceivingNewStudents = null,
    Object? recitations = freezed,
  }) {
    return _then(_value.copyWith(
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
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageId: null == profileImageId
          ? _value.profileImageId
          : profileImageId // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalityName: null == nationalityName
          ? _value.nationalityName
          : nationalityName // ignore: cast_nullable_to_non_nullable
              as String,
      countryIsocode: null == countryIsocode
          ? _value.countryIsocode
          : countryIsocode // ignore: cast_nullable_to_non_nullable
              as String,
      teachingLanguages: null == teachingLanguages
          ? _value.teachingLanguages
          : teachingLanguages // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isReceivingNewStudents: null == isReceivingNewStudents
          ? _value.isReceivingNewStudents
          : isReceivingNewStudents // ignore: cast_nullable_to_non_nullable
              as bool,
      recitations: freezed == recitations
          ? _value.recitations
          : recitations // ignore: cast_nullable_to_non_nullable
              as List<BaseField>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReciterImplCopyWith<$Res> implements $ReciterCopyWith<$Res> {
  factory _$$ReciterImplCopyWith(
          _$ReciterImpl value, $Res Function(_$ReciterImpl) then) =
      __$$ReciterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstName,
      String middleName,
      String gender,
      String lastName,
      String dateOfBirth,
      String? description,
      String profileImageId,
      String? videoId,
      String nationalityName,
      String countryIsocode,
      List<BaseField> teachingLanguages,
      bool isFavorite,
      bool isReceivingNewStudents,
      List<BaseField>? recitations});
}

/// @nodoc
class __$$ReciterImplCopyWithImpl<$Res>
    extends _$ReciterCopyWithImpl<$Res, _$ReciterImpl>
    implements _$$ReciterImplCopyWith<$Res> {
  __$$ReciterImplCopyWithImpl(
      _$ReciterImpl _value, $Res Function(_$ReciterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reciter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? gender = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? description = freezed,
    Object? profileImageId = null,
    Object? videoId = freezed,
    Object? nationalityName = null,
    Object? countryIsocode = null,
    Object? teachingLanguages = null,
    Object? isFavorite = null,
    Object? isReceivingNewStudents = null,
    Object? recitations = freezed,
  }) {
    return _then(_$ReciterImpl(
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
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageId: null == profileImageId
          ? _value.profileImageId
          : profileImageId // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalityName: null == nationalityName
          ? _value.nationalityName
          : nationalityName // ignore: cast_nullable_to_non_nullable
              as String,
      countryIsocode: null == countryIsocode
          ? _value.countryIsocode
          : countryIsocode // ignore: cast_nullable_to_non_nullable
              as String,
      teachingLanguages: null == teachingLanguages
          ? _value._teachingLanguages
          : teachingLanguages // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isReceivingNewStudents: null == isReceivingNewStudents
          ? _value.isReceivingNewStudents
          : isReceivingNewStudents // ignore: cast_nullable_to_non_nullable
              as bool,
      recitations: freezed == recitations
          ? _value._recitations
          : recitations // ignore: cast_nullable_to_non_nullable
              as List<BaseField>?,
    ));
  }
}

/// @nodoc

class _$ReciterImpl implements _Reciter {
  const _$ReciterImpl(
      {required this.id,
      required this.firstName,
      required this.middleName,
      required this.gender,
      required this.lastName,
      required this.dateOfBirth,
      this.description,
      required this.profileImageId,
      this.videoId,
      required this.nationalityName,
      required this.countryIsocode,
      required final List<BaseField> teachingLanguages,
      required this.isFavorite,
      required this.isReceivingNewStudents,
      final List<BaseField>? recitations})
      : _teachingLanguages = teachingLanguages,
        _recitations = recitations;

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String middleName;
  @override
  final String gender;
  @override
  final String lastName;
  @override
  final String dateOfBirth;
  @override
  final String? description;
  @override
  final String profileImageId;
  @override
  final String? videoId;
  @override
  final String nationalityName;
  @override
  final String countryIsocode;
  final List<BaseField> _teachingLanguages;
  @override
  List<BaseField> get teachingLanguages {
    if (_teachingLanguages is EqualUnmodifiableListView)
      return _teachingLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teachingLanguages);
  }

  @override
  final bool isFavorite;
  @override
  final bool isReceivingNewStudents;
  final List<BaseField>? _recitations;
  @override
  List<BaseField>? get recitations {
    final value = _recitations;
    if (value == null) return null;
    if (_recitations is EqualUnmodifiableListView) return _recitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Reciter(id: $id, firstName: $firstName, middleName: $middleName, gender: $gender, lastName: $lastName, dateOfBirth: $dateOfBirth, description: $description, profileImageId: $profileImageId, videoId: $videoId, nationalityName: $nationalityName, countryIsocode: $countryIsocode, teachingLanguages: $teachingLanguages, isFavorite: $isFavorite, isReceivingNewStudents: $isReceivingNewStudents, recitations: $recitations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
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
            (identical(other.isReceivingNewStudents, isReceivingNewStudents) ||
                other.isReceivingNewStudents == isReceivingNewStudents) &&
            const DeepCollectionEquality()
                .equals(other._recitations, _recitations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      middleName,
      gender,
      lastName,
      dateOfBirth,
      description,
      profileImageId,
      videoId,
      nationalityName,
      countryIsocode,
      const DeepCollectionEquality().hash(_teachingLanguages),
      isFavorite,
      isReceivingNewStudents,
      const DeepCollectionEquality().hash(_recitations));

  /// Create a copy of Reciter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterImplCopyWith<_$ReciterImpl> get copyWith =>
      __$$ReciterImplCopyWithImpl<_$ReciterImpl>(this, _$identity);
}

abstract class _Reciter implements Reciter {
  const factory _Reciter(
      {required final int id,
      required final String firstName,
      required final String middleName,
      required final String gender,
      required final String lastName,
      required final String dateOfBirth,
      final String? description,
      required final String profileImageId,
      final String? videoId,
      required final String nationalityName,
      required final String countryIsocode,
      required final List<BaseField> teachingLanguages,
      required final bool isFavorite,
      required final bool isReceivingNewStudents,
      final List<BaseField>? recitations}) = _$ReciterImpl;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String get middleName;
  @override
  String get gender;
  @override
  String get lastName;
  @override
  String get dateOfBirth;
  @override
  String? get description;
  @override
  String get profileImageId;
  @override
  String? get videoId;
  @override
  String get nationalityName;
  @override
  String get countryIsocode;
  @override
  List<BaseField> get teachingLanguages;
  @override
  bool get isFavorite;
  @override
  bool get isReceivingNewStudents;
  @override
  List<BaseField>? get recitations;

  /// Create a copy of Reciter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterImplCopyWith<_$ReciterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
