// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_schedule_session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentScheduleSessionState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;

  /// Create a copy of StudentScheduleSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentScheduleSessionStateCopyWith<StudentScheduleSessionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentScheduleSessionStateCopyWith<$Res> {
  factory $StudentScheduleSessionStateCopyWith(
          StudentScheduleSessionState value,
          $Res Function(StudentScheduleSessionState) then) =
      _$StudentScheduleSessionStateCopyWithImpl<$Res,
          StudentScheduleSessionState>;
  @useResult
  $Res call({BaseStatus<dynamic> status});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$StudentScheduleSessionStateCopyWithImpl<$Res,
        $Val extends StudentScheduleSessionState>
    implements $StudentScheduleSessionStateCopyWith<$Res> {
  _$StudentScheduleSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentScheduleSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
    ) as $Val);
  }

  /// Create a copy of StudentScheduleSessionState
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
abstract class _$$StudentScheduleSessionStateImplCopyWith<$Res>
    implements $StudentScheduleSessionStateCopyWith<$Res> {
  factory _$$StudentScheduleSessionStateImplCopyWith(
          _$StudentScheduleSessionStateImpl value,
          $Res Function(_$StudentScheduleSessionStateImpl) then) =
      __$$StudentScheduleSessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$StudentScheduleSessionStateImplCopyWithImpl<$Res>
    extends _$StudentScheduleSessionStateCopyWithImpl<$Res,
        _$StudentScheduleSessionStateImpl>
    implements _$$StudentScheduleSessionStateImplCopyWith<$Res> {
  __$$StudentScheduleSessionStateImplCopyWithImpl(
      _$StudentScheduleSessionStateImpl _value,
      $Res Function(_$StudentScheduleSessionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentScheduleSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$StudentScheduleSessionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
    ));
  }
}

/// @nodoc

class _$StudentScheduleSessionStateImpl
    implements _StudentScheduleSessionState {
  const _$StudentScheduleSessionStateImpl(
      {this.status = const BaseStatus.initial()});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;

  @override
  String toString() {
    return 'StudentScheduleSessionState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentScheduleSessionStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of StudentScheduleSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentScheduleSessionStateImplCopyWith<_$StudentScheduleSessionStateImpl>
      get copyWith => __$$StudentScheduleSessionStateImplCopyWithImpl<
          _$StudentScheduleSessionStateImpl>(this, _$identity);
}

abstract class _StudentScheduleSessionState
    implements StudentScheduleSessionState {
  const factory _StudentScheduleSessionState(
      {final BaseStatus<dynamic> status}) = _$StudentScheduleSessionStateImpl;

  @override
  BaseStatus<dynamic> get status;

  /// Create a copy of StudentScheduleSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentScheduleSessionStateImplCopyWith<_$StudentScheduleSessionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
