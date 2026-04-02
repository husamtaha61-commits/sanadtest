// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_my_schedule_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentMyScheduleState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<Session> get sessionResponse => throw _privateConstructorUsedError;
  Reciter? get reciterInfo => throw _privateConstructorUsedError;

  /// Create a copy of StudentMyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentMyScheduleStateCopyWith<StudentMyScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentMyScheduleStateCopyWith<$Res> {
  factory $StudentMyScheduleStateCopyWith(StudentMyScheduleState value,
          $Res Function(StudentMyScheduleState) then) =
      _$StudentMyScheduleStateCopyWithImpl<$Res, StudentMyScheduleState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<Session> sessionResponse,
      Reciter? reciterInfo});

  $BaseStatusCopyWith<dynamic, $Res> get status;
  $ReciterCopyWith<$Res>? get reciterInfo;
}

/// @nodoc
class _$StudentMyScheduleStateCopyWithImpl<$Res,
        $Val extends StudentMyScheduleState>
    implements $StudentMyScheduleStateCopyWith<$Res> {
  _$StudentMyScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentMyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sessionResponse = null,
    Object? reciterInfo = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      sessionResponse: null == sessionResponse
          ? _value.sessionResponse
          : sessionResponse // ignore: cast_nullable_to_non_nullable
              as List<Session>,
      reciterInfo: freezed == reciterInfo
          ? _value.reciterInfo
          : reciterInfo // ignore: cast_nullable_to_non_nullable
              as Reciter?,
    ) as $Val);
  }

  /// Create a copy of StudentMyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get status {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of StudentMyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReciterCopyWith<$Res>? get reciterInfo {
    if (_value.reciterInfo == null) {
      return null;
    }

    return $ReciterCopyWith<$Res>(_value.reciterInfo!, (value) {
      return _then(_value.copyWith(reciterInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentMyScheduleStateImplCopyWith<$Res>
    implements $StudentMyScheduleStateCopyWith<$Res> {
  factory _$$StudentMyScheduleStateImplCopyWith(
          _$StudentMyScheduleStateImpl value,
          $Res Function(_$StudentMyScheduleStateImpl) then) =
      __$$StudentMyScheduleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<Session> sessionResponse,
      Reciter? reciterInfo});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
  @override
  $ReciterCopyWith<$Res>? get reciterInfo;
}

/// @nodoc
class __$$StudentMyScheduleStateImplCopyWithImpl<$Res>
    extends _$StudentMyScheduleStateCopyWithImpl<$Res,
        _$StudentMyScheduleStateImpl>
    implements _$$StudentMyScheduleStateImplCopyWith<$Res> {
  __$$StudentMyScheduleStateImplCopyWithImpl(
      _$StudentMyScheduleStateImpl _value,
      $Res Function(_$StudentMyScheduleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentMyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sessionResponse = null,
    Object? reciterInfo = freezed,
  }) {
    return _then(_$StudentMyScheduleStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      sessionResponse: null == sessionResponse
          ? _value._sessionResponse
          : sessionResponse // ignore: cast_nullable_to_non_nullable
              as List<Session>,
      reciterInfo: freezed == reciterInfo
          ? _value.reciterInfo
          : reciterInfo // ignore: cast_nullable_to_non_nullable
              as Reciter?,
    ));
  }
}

/// @nodoc

class _$StudentMyScheduleStateImpl implements _StudentMyScheduleState {
  const _$StudentMyScheduleStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<Session> sessionResponse = const [],
      this.reciterInfo})
      : _sessionResponse = sessionResponse;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<Session> _sessionResponse;
  @override
  @JsonKey()
  List<Session> get sessionResponse {
    if (_sessionResponse is EqualUnmodifiableListView) return _sessionResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessionResponse);
  }

  @override
  final Reciter? reciterInfo;

  @override
  String toString() {
    return 'StudentMyScheduleState(status: $status, sessionResponse: $sessionResponse, reciterInfo: $reciterInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentMyScheduleStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._sessionResponse, _sessionResponse) &&
            (identical(other.reciterInfo, reciterInfo) ||
                other.reciterInfo == reciterInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_sessionResponse), reciterInfo);

  /// Create a copy of StudentMyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentMyScheduleStateImplCopyWith<_$StudentMyScheduleStateImpl>
      get copyWith => __$$StudentMyScheduleStateImplCopyWithImpl<
          _$StudentMyScheduleStateImpl>(this, _$identity);
}

abstract class _StudentMyScheduleState implements StudentMyScheduleState {
  const factory _StudentMyScheduleState(
      {final BaseStatus<dynamic> status,
      final List<Session> sessionResponse,
      final Reciter? reciterInfo}) = _$StudentMyScheduleStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<Session> get sessionResponse;
  @override
  Reciter? get reciterInfo;

  /// Create a copy of StudentMyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentMyScheduleStateImplCopyWith<_$StudentMyScheduleStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
