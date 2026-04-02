// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_progress_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentProgressState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  StudentProgress? get studentProgress => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;

  /// Create a copy of StudentProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentProgressStateCopyWith<StudentProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentProgressStateCopyWith<$Res> {
  factory $StudentProgressStateCopyWith(StudentProgressState value,
          $Res Function(StudentProgressState) then) =
      _$StudentProgressStateCopyWithImpl<$Res, StudentProgressState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      StudentProgress? studentProgress,
      int studentId});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$StudentProgressStateCopyWithImpl<$Res,
        $Val extends StudentProgressState>
    implements $StudentProgressStateCopyWith<$Res> {
  _$StudentProgressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? studentProgress = freezed,
    Object? studentId = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      studentProgress: freezed == studentProgress
          ? _value.studentProgress
          : studentProgress // ignore: cast_nullable_to_non_nullable
              as StudentProgress?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of StudentProgressState
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
abstract class _$$StudentProgressStateImplCopyWith<$Res>
    implements $StudentProgressStateCopyWith<$Res> {
  factory _$$StudentProgressStateImplCopyWith(_$StudentProgressStateImpl value,
          $Res Function(_$StudentProgressStateImpl) then) =
      __$$StudentProgressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      StudentProgress? studentProgress,
      int studentId});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$StudentProgressStateImplCopyWithImpl<$Res>
    extends _$StudentProgressStateCopyWithImpl<$Res, _$StudentProgressStateImpl>
    implements _$$StudentProgressStateImplCopyWith<$Res> {
  __$$StudentProgressStateImplCopyWithImpl(_$StudentProgressStateImpl _value,
      $Res Function(_$StudentProgressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? studentProgress = freezed,
    Object? studentId = null,
  }) {
    return _then(_$StudentProgressStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      studentProgress: freezed == studentProgress
          ? _value.studentProgress
          : studentProgress // ignore: cast_nullable_to_non_nullable
              as StudentProgress?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StudentProgressStateImpl implements _StudentProgressState {
  const _$StudentProgressStateImpl(
      {this.status = const BaseStatus.initial(),
      this.studentProgress,
      this.studentId = -1});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  final StudentProgress? studentProgress;
  @override
  @JsonKey()
  final int studentId;

  @override
  String toString() {
    return 'StudentProgressState(status: $status, studentProgress: $studentProgress, studentId: $studentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentProgressStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.studentProgress, studentProgress) ||
                other.studentProgress == studentProgress) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, studentProgress, studentId);

  /// Create a copy of StudentProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentProgressStateImplCopyWith<_$StudentProgressStateImpl>
      get copyWith =>
          __$$StudentProgressStateImplCopyWithImpl<_$StudentProgressStateImpl>(
              this, _$identity);
}

abstract class _StudentProgressState implements StudentProgressState {
  const factory _StudentProgressState(
      {final BaseStatus<dynamic> status,
      final StudentProgress? studentProgress,
      final int studentId}) = _$StudentProgressStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  StudentProgress? get studentProgress;
  @override
  int get studentId;

  /// Create a copy of StudentProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentProgressStateImplCopyWith<_$StudentProgressStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
