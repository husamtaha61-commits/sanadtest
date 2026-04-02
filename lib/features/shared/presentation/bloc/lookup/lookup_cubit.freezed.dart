// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lookup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LookupState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<BaseField> get languages => throw _privateConstructorUsedError;
  List<BaseField> get nationalities => throw _privateConstructorUsedError;
  List<BaseField> get countries => throw _privateConstructorUsedError;
  List<BaseField> get genders => throw _privateConstructorUsedError;
  List<BaseField> get recitations => throw _privateConstructorUsedError;
  List<BaseField> get recitationTypes => throw _privateConstructorUsedError;
  List<BaseField> get userIdTypes => throw _privateConstructorUsedError;
  List<BaseField> get ageRanges => throw _privateConstructorUsedError;
  List<BaseField> get requestStatuses => throw _privateConstructorUsedError;
  List<BaseField> get requestTypes => throw _privateConstructorUsedError;
  List<BaseField> get requesterSides => throw _privateConstructorUsedError;
  List<BaseField> get days => throw _privateConstructorUsedError;
  List<BaseField> get averageIntervals => throw _privateConstructorUsedError;

  /// Create a copy of LookupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LookupStateCopyWith<LookupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LookupStateCopyWith<$Res> {
  factory $LookupStateCopyWith(
          LookupState value, $Res Function(LookupState) then) =
      _$LookupStateCopyWithImpl<$Res, LookupState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<BaseField> languages,
      List<BaseField> nationalities,
      List<BaseField> countries,
      List<BaseField> genders,
      List<BaseField> recitations,
      List<BaseField> recitationTypes,
      List<BaseField> userIdTypes,
      List<BaseField> ageRanges,
      List<BaseField> requestStatuses,
      List<BaseField> requestTypes,
      List<BaseField> requesterSides,
      List<BaseField> days,
      List<BaseField> averageIntervals});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$LookupStateCopyWithImpl<$Res, $Val extends LookupState>
    implements $LookupStateCopyWith<$Res> {
  _$LookupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LookupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? languages = null,
    Object? nationalities = null,
    Object? countries = null,
    Object? genders = null,
    Object? recitations = null,
    Object? recitationTypes = null,
    Object? userIdTypes = null,
    Object? ageRanges = null,
    Object? requestStatuses = null,
    Object? requestTypes = null,
    Object? requesterSides = null,
    Object? days = null,
    Object? averageIntervals = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      nationalities: null == nationalities
          ? _value.nationalities
          : nationalities // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      countries: null == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      genders: null == genders
          ? _value.genders
          : genders // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      recitations: null == recitations
          ? _value.recitations
          : recitations // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      recitationTypes: null == recitationTypes
          ? _value.recitationTypes
          : recitationTypes // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      userIdTypes: null == userIdTypes
          ? _value.userIdTypes
          : userIdTypes // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      ageRanges: null == ageRanges
          ? _value.ageRanges
          : ageRanges // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      requestStatuses: null == requestStatuses
          ? _value.requestStatuses
          : requestStatuses // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      requestTypes: null == requestTypes
          ? _value.requestTypes
          : requestTypes // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      requesterSides: null == requesterSides
          ? _value.requesterSides
          : requesterSides // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      averageIntervals: null == averageIntervals
          ? _value.averageIntervals
          : averageIntervals // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
    ) as $Val);
  }

  /// Create a copy of LookupState
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
abstract class _$$LookupStateImplCopyWith<$Res>
    implements $LookupStateCopyWith<$Res> {
  factory _$$LookupStateImplCopyWith(
          _$LookupStateImpl value, $Res Function(_$LookupStateImpl) then) =
      __$$LookupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<BaseField> languages,
      List<BaseField> nationalities,
      List<BaseField> countries,
      List<BaseField> genders,
      List<BaseField> recitations,
      List<BaseField> recitationTypes,
      List<BaseField> userIdTypes,
      List<BaseField> ageRanges,
      List<BaseField> requestStatuses,
      List<BaseField> requestTypes,
      List<BaseField> requesterSides,
      List<BaseField> days,
      List<BaseField> averageIntervals});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$LookupStateImplCopyWithImpl<$Res>
    extends _$LookupStateCopyWithImpl<$Res, _$LookupStateImpl>
    implements _$$LookupStateImplCopyWith<$Res> {
  __$$LookupStateImplCopyWithImpl(
      _$LookupStateImpl _value, $Res Function(_$LookupStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LookupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? languages = null,
    Object? nationalities = null,
    Object? countries = null,
    Object? genders = null,
    Object? recitations = null,
    Object? recitationTypes = null,
    Object? userIdTypes = null,
    Object? ageRanges = null,
    Object? requestStatuses = null,
    Object? requestTypes = null,
    Object? requesterSides = null,
    Object? days = null,
    Object? averageIntervals = null,
  }) {
    return _then(_$LookupStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      nationalities: null == nationalities
          ? _value._nationalities
          : nationalities // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      countries: null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      genders: null == genders
          ? _value._genders
          : genders // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      recitations: null == recitations
          ? _value._recitations
          : recitations // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      recitationTypes: null == recitationTypes
          ? _value._recitationTypes
          : recitationTypes // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      userIdTypes: null == userIdTypes
          ? _value._userIdTypes
          : userIdTypes // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      ageRanges: null == ageRanges
          ? _value._ageRanges
          : ageRanges // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      requestStatuses: null == requestStatuses
          ? _value._requestStatuses
          : requestStatuses // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      requestTypes: null == requestTypes
          ? _value._requestTypes
          : requestTypes // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      requesterSides: null == requesterSides
          ? _value._requesterSides
          : requesterSides // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
      averageIntervals: null == averageIntervals
          ? _value._averageIntervals
          : averageIntervals // ignore: cast_nullable_to_non_nullable
              as List<BaseField>,
    ));
  }
}

/// @nodoc

class _$LookupStateImpl implements _LookupState {
  const _$LookupStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<BaseField> languages = const [],
      final List<BaseField> nationalities = const [],
      final List<BaseField> countries = const [],
      final List<BaseField> genders = const [],
      final List<BaseField> recitations = const [],
      final List<BaseField> recitationTypes = const [],
      final List<BaseField> userIdTypes = const [],
      final List<BaseField> ageRanges = const [],
      final List<BaseField> requestStatuses = const [],
      final List<BaseField> requestTypes = const [],
      final List<BaseField> requesterSides = const [],
      final List<BaseField> days = const [],
      final List<BaseField> averageIntervals = const []})
      : _languages = languages,
        _nationalities = nationalities,
        _countries = countries,
        _genders = genders,
        _recitations = recitations,
        _recitationTypes = recitationTypes,
        _userIdTypes = userIdTypes,
        _ageRanges = ageRanges,
        _requestStatuses = requestStatuses,
        _requestTypes = requestTypes,
        _requesterSides = requesterSides,
        _days = days,
        _averageIntervals = averageIntervals;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<BaseField> _languages;
  @override
  @JsonKey()
  List<BaseField> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  final List<BaseField> _nationalities;
  @override
  @JsonKey()
  List<BaseField> get nationalities {
    if (_nationalities is EqualUnmodifiableListView) return _nationalities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nationalities);
  }

  final List<BaseField> _countries;
  @override
  @JsonKey()
  List<BaseField> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  final List<BaseField> _genders;
  @override
  @JsonKey()
  List<BaseField> get genders {
    if (_genders is EqualUnmodifiableListView) return _genders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genders);
  }

  final List<BaseField> _recitations;
  @override
  @JsonKey()
  List<BaseField> get recitations {
    if (_recitations is EqualUnmodifiableListView) return _recitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recitations);
  }

  final List<BaseField> _recitationTypes;
  @override
  @JsonKey()
  List<BaseField> get recitationTypes {
    if (_recitationTypes is EqualUnmodifiableListView) return _recitationTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recitationTypes);
  }

  final List<BaseField> _userIdTypes;
  @override
  @JsonKey()
  List<BaseField> get userIdTypes {
    if (_userIdTypes is EqualUnmodifiableListView) return _userIdTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIdTypes);
  }

  final List<BaseField> _ageRanges;
  @override
  @JsonKey()
  List<BaseField> get ageRanges {
    if (_ageRanges is EqualUnmodifiableListView) return _ageRanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ageRanges);
  }

  final List<BaseField> _requestStatuses;
  @override
  @JsonKey()
  List<BaseField> get requestStatuses {
    if (_requestStatuses is EqualUnmodifiableListView) return _requestStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestStatuses);
  }

  final List<BaseField> _requestTypes;
  @override
  @JsonKey()
  List<BaseField> get requestTypes {
    if (_requestTypes is EqualUnmodifiableListView) return _requestTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestTypes);
  }

  final List<BaseField> _requesterSides;
  @override
  @JsonKey()
  List<BaseField> get requesterSides {
    if (_requesterSides is EqualUnmodifiableListView) return _requesterSides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requesterSides);
  }

  final List<BaseField> _days;
  @override
  @JsonKey()
  List<BaseField> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  final List<BaseField> _averageIntervals;
  @override
  @JsonKey()
  List<BaseField> get averageIntervals {
    if (_averageIntervals is EqualUnmodifiableListView)
      return _averageIntervals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_averageIntervals);
  }

  @override
  String toString() {
    return 'LookupState(status: $status, languages: $languages, nationalities: $nationalities, countries: $countries, genders: $genders, recitations: $recitations, recitationTypes: $recitationTypes, userIdTypes: $userIdTypes, ageRanges: $ageRanges, requestStatuses: $requestStatuses, requestTypes: $requestTypes, requesterSides: $requesterSides, days: $days, averageIntervals: $averageIntervals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LookupStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._nationalities, _nationalities) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality().equals(other._genders, _genders) &&
            const DeepCollectionEquality()
                .equals(other._recitations, _recitations) &&
            const DeepCollectionEquality()
                .equals(other._recitationTypes, _recitationTypes) &&
            const DeepCollectionEquality()
                .equals(other._userIdTypes, _userIdTypes) &&
            const DeepCollectionEquality()
                .equals(other._ageRanges, _ageRanges) &&
            const DeepCollectionEquality()
                .equals(other._requestStatuses, _requestStatuses) &&
            const DeepCollectionEquality()
                .equals(other._requestTypes, _requestTypes) &&
            const DeepCollectionEquality()
                .equals(other._requesterSides, _requesterSides) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            const DeepCollectionEquality()
                .equals(other._averageIntervals, _averageIntervals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(_nationalities),
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(_genders),
      const DeepCollectionEquality().hash(_recitations),
      const DeepCollectionEquality().hash(_recitationTypes),
      const DeepCollectionEquality().hash(_userIdTypes),
      const DeepCollectionEquality().hash(_ageRanges),
      const DeepCollectionEquality().hash(_requestStatuses),
      const DeepCollectionEquality().hash(_requestTypes),
      const DeepCollectionEquality().hash(_requesterSides),
      const DeepCollectionEquality().hash(_days),
      const DeepCollectionEquality().hash(_averageIntervals));

  /// Create a copy of LookupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LookupStateImplCopyWith<_$LookupStateImpl> get copyWith =>
      __$$LookupStateImplCopyWithImpl<_$LookupStateImpl>(this, _$identity);
}

abstract class _LookupState implements LookupState {
  const factory _LookupState(
      {final BaseStatus<dynamic> status,
      final List<BaseField> languages,
      final List<BaseField> nationalities,
      final List<BaseField> countries,
      final List<BaseField> genders,
      final List<BaseField> recitations,
      final List<BaseField> recitationTypes,
      final List<BaseField> userIdTypes,
      final List<BaseField> ageRanges,
      final List<BaseField> requestStatuses,
      final List<BaseField> requestTypes,
      final List<BaseField> requesterSides,
      final List<BaseField> days,
      final List<BaseField> averageIntervals}) = _$LookupStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<BaseField> get languages;
  @override
  List<BaseField> get nationalities;
  @override
  List<BaseField> get countries;
  @override
  List<BaseField> get genders;
  @override
  List<BaseField> get recitations;
  @override
  List<BaseField> get recitationTypes;
  @override
  List<BaseField> get userIdTypes;
  @override
  List<BaseField> get ageRanges;
  @override
  List<BaseField> get requestStatuses;
  @override
  List<BaseField> get requestTypes;
  @override
  List<BaseField> get requesterSides;
  @override
  List<BaseField> get days;
  @override
  List<BaseField> get averageIntervals;

  /// Create a copy of LookupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LookupStateImplCopyWith<_$LookupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
