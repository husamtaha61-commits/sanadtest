// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_statistics_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentStatisticsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  StudentStatistics? get studentStatistics =>
      throw _privateConstructorUsedError;

  /// Create a copy of StudentStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentStatisticsStateCopyWith<StudentStatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentStatisticsStateCopyWith<$Res> {
  factory $StudentStatisticsStateCopyWith(StudentStatisticsState value,
          $Res Function(StudentStatisticsState) then) =
      _$StudentStatisticsStateCopyWithImpl<$Res, StudentStatisticsState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, StudentStatistics? studentStatistics});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$StudentStatisticsStateCopyWithImpl<$Res,
        $Val extends StudentStatisticsState>
    implements $StudentStatisticsStateCopyWith<$Res> {
  _$StudentStatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? studentStatistics = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      studentStatistics: freezed == studentStatistics
          ? _value.studentStatistics
          : studentStatistics // ignore: cast_nullable_to_non_nullable
              as StudentStatistics?,
    ) as $Val);
  }

  /// Create a copy of StudentStatisticsState
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
abstract class _$$StudentStatisticsStateImplCopyWith<$Res>
    implements $StudentStatisticsStateCopyWith<$Res> {
  factory _$$StudentStatisticsStateImplCopyWith(
          _$StudentStatisticsStateImpl value,
          $Res Function(_$StudentStatisticsStateImpl) then) =
      __$$StudentStatisticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, StudentStatistics? studentStatistics});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$StudentStatisticsStateImplCopyWithImpl<$Res>
    extends _$StudentStatisticsStateCopyWithImpl<$Res,
        _$StudentStatisticsStateImpl>
    implements _$$StudentStatisticsStateImplCopyWith<$Res> {
  __$$StudentStatisticsStateImplCopyWithImpl(
      _$StudentStatisticsStateImpl _value,
      $Res Function(_$StudentStatisticsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? studentStatistics = freezed,
  }) {
    return _then(_$StudentStatisticsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      studentStatistics: freezed == studentStatistics
          ? _value.studentStatistics
          : studentStatistics // ignore: cast_nullable_to_non_nullable
              as StudentStatistics?,
    ));
  }
}

/// @nodoc

class _$StudentStatisticsStateImpl implements _StudentStatisticsState {
  const _$StudentStatisticsStateImpl(
      {this.status = const BaseStatus.initial(), this.studentStatistics});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  final StudentStatistics? studentStatistics;

  @override
  String toString() {
    return 'StudentStatisticsState(status: $status, studentStatistics: $studentStatistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentStatisticsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.studentStatistics, studentStatistics) ||
                other.studentStatistics == studentStatistics));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, studentStatistics);

  /// Create a copy of StudentStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentStatisticsStateImplCopyWith<_$StudentStatisticsStateImpl>
      get copyWith => __$$StudentStatisticsStateImplCopyWithImpl<
          _$StudentStatisticsStateImpl>(this, _$identity);
}

abstract class _StudentStatisticsState implements StudentStatisticsState {
  const factory _StudentStatisticsState(
          {final BaseStatus<dynamic> status,
          final StudentStatistics? studentStatistics}) =
      _$StudentStatisticsStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  StudentStatistics? get studentStatistics;

  /// Create a copy of StudentStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentStatisticsStateImplCopyWith<_$StudentStatisticsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
