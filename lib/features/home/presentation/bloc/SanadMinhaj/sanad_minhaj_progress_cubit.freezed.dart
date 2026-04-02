// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sanad_minhaj_progress_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SanadMinhajProgressState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<SanadMinhajCourse> get courses => throw _privateConstructorUsedError;
  Map<int, List<Session>> get sessionsByCourseId =>
      throw _privateConstructorUsedError;

  /// Create a copy of SanadMinhajProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SanadMinhajProgressStateCopyWith<SanadMinhajProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SanadMinhajProgressStateCopyWith<$Res> {
  factory $SanadMinhajProgressStateCopyWith(SanadMinhajProgressState value,
          $Res Function(SanadMinhajProgressState) then) =
      _$SanadMinhajProgressStateCopyWithImpl<$Res, SanadMinhajProgressState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<SanadMinhajCourse> courses,
      Map<int, List<Session>> sessionsByCourseId});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$SanadMinhajProgressStateCopyWithImpl<$Res,
        $Val extends SanadMinhajProgressState>
    implements $SanadMinhajProgressStateCopyWith<$Res> {
  _$SanadMinhajProgressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SanadMinhajProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? courses = null,
    Object? sessionsByCourseId = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      courses: null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<SanadMinhajCourse>,
      sessionsByCourseId: null == sessionsByCourseId
          ? _value.sessionsByCourseId
          : sessionsByCourseId // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Session>>,
    ) as $Val);
  }

  /// Create a copy of SanadMinhajProgressState
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
abstract class _$$SanadMinhajProgressStateImplCopyWith<$Res>
    implements $SanadMinhajProgressStateCopyWith<$Res> {
  factory _$$SanadMinhajProgressStateImplCopyWith(
          _$SanadMinhajProgressStateImpl value,
          $Res Function(_$SanadMinhajProgressStateImpl) then) =
      __$$SanadMinhajProgressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<SanadMinhajCourse> courses,
      Map<int, List<Session>> sessionsByCourseId});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$SanadMinhajProgressStateImplCopyWithImpl<$Res>
    extends _$SanadMinhajProgressStateCopyWithImpl<$Res,
        _$SanadMinhajProgressStateImpl>
    implements _$$SanadMinhajProgressStateImplCopyWith<$Res> {
  __$$SanadMinhajProgressStateImplCopyWithImpl(
      _$SanadMinhajProgressStateImpl _value,
      $Res Function(_$SanadMinhajProgressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SanadMinhajProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? courses = null,
    Object? sessionsByCourseId = null,
  }) {
    return _then(_$SanadMinhajProgressStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      courses: null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<SanadMinhajCourse>,
      sessionsByCourseId: null == sessionsByCourseId
          ? _value._sessionsByCourseId
          : sessionsByCourseId // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Session>>,
    ));
  }
}

/// @nodoc

class _$SanadMinhajProgressStateImpl implements _SanadMinhajProgressState {
  const _$SanadMinhajProgressStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<SanadMinhajCourse> courses = const [],
      final Map<int, List<Session>> sessionsByCourseId = const {}})
      : _courses = courses,
        _sessionsByCourseId = sessionsByCourseId;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<SanadMinhajCourse> _courses;
  @override
  @JsonKey()
  List<SanadMinhajCourse> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  final Map<int, List<Session>> _sessionsByCourseId;
  @override
  @JsonKey()
  Map<int, List<Session>> get sessionsByCourseId {
    if (_sessionsByCourseId is EqualUnmodifiableMapView)
      return _sessionsByCourseId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sessionsByCourseId);
  }

  @override
  String toString() {
    return 'SanadMinhajProgressState(status: $status, courses: $courses, sessionsByCourseId: $sessionsByCourseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SanadMinhajProgressStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            const DeepCollectionEquality()
                .equals(other._sessionsByCourseId, _sessionsByCourseId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_courses),
      const DeepCollectionEquality().hash(_sessionsByCourseId));

  /// Create a copy of SanadMinhajProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SanadMinhajProgressStateImplCopyWith<_$SanadMinhajProgressStateImpl>
      get copyWith => __$$SanadMinhajProgressStateImplCopyWithImpl<
          _$SanadMinhajProgressStateImpl>(this, _$identity);
}

abstract class _SanadMinhajProgressState implements SanadMinhajProgressState {
  const factory _SanadMinhajProgressState(
          {final BaseStatus<dynamic> status,
          final List<SanadMinhajCourse> courses,
          final Map<int, List<Session>> sessionsByCourseId}) =
      _$SanadMinhajProgressStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<SanadMinhajCourse> get courses;
  @override
  Map<int, List<Session>> get sessionsByCourseId;

  /// Create a copy of SanadMinhajProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SanadMinhajProgressStateImplCopyWith<_$SanadMinhajProgressStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
