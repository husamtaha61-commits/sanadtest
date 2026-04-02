// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter_statistics_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReciterStatisticsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  ReciterStatistics? get reciterStatistics =>
      throw _privateConstructorUsedError;

  /// Create a copy of ReciterStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterStatisticsStateCopyWith<ReciterStatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterStatisticsStateCopyWith<$Res> {
  factory $ReciterStatisticsStateCopyWith(ReciterStatisticsState value,
          $Res Function(ReciterStatisticsState) then) =
      _$ReciterStatisticsStateCopyWithImpl<$Res, ReciterStatisticsState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, ReciterStatistics? reciterStatistics});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$ReciterStatisticsStateCopyWithImpl<$Res,
        $Val extends ReciterStatisticsState>
    implements $ReciterStatisticsStateCopyWith<$Res> {
  _$ReciterStatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReciterStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? reciterStatistics = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      reciterStatistics: freezed == reciterStatistics
          ? _value.reciterStatistics
          : reciterStatistics // ignore: cast_nullable_to_non_nullable
              as ReciterStatistics?,
    ) as $Val);
  }

  /// Create a copy of ReciterStatisticsState
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
abstract class _$$ReciterStatisticsStateImplCopyWith<$Res>
    implements $ReciterStatisticsStateCopyWith<$Res> {
  factory _$$ReciterStatisticsStateImplCopyWith(
          _$ReciterStatisticsStateImpl value,
          $Res Function(_$ReciterStatisticsStateImpl) then) =
      __$$ReciterStatisticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, ReciterStatistics? reciterStatistics});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$ReciterStatisticsStateImplCopyWithImpl<$Res>
    extends _$ReciterStatisticsStateCopyWithImpl<$Res,
        _$ReciterStatisticsStateImpl>
    implements _$$ReciterStatisticsStateImplCopyWith<$Res> {
  __$$ReciterStatisticsStateImplCopyWithImpl(
      _$ReciterStatisticsStateImpl _value,
      $Res Function(_$ReciterStatisticsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReciterStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? reciterStatistics = freezed,
  }) {
    return _then(_$ReciterStatisticsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      reciterStatistics: freezed == reciterStatistics
          ? _value.reciterStatistics
          : reciterStatistics // ignore: cast_nullable_to_non_nullable
              as ReciterStatistics?,
    ));
  }
}

/// @nodoc

class _$ReciterStatisticsStateImpl implements _ReciterStatisticsState {
  const _$ReciterStatisticsStateImpl(
      {this.status = const BaseStatus.initial(), this.reciterStatistics});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  final ReciterStatistics? reciterStatistics;

  @override
  String toString() {
    return 'ReciterStatisticsState(status: $status, reciterStatistics: $reciterStatistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterStatisticsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reciterStatistics, reciterStatistics) ||
                other.reciterStatistics == reciterStatistics));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, reciterStatistics);

  /// Create a copy of ReciterStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterStatisticsStateImplCopyWith<_$ReciterStatisticsStateImpl>
      get copyWith => __$$ReciterStatisticsStateImplCopyWithImpl<
          _$ReciterStatisticsStateImpl>(this, _$identity);
}

abstract class _ReciterStatisticsState implements ReciterStatisticsState {
  const factory _ReciterStatisticsState(
          {final BaseStatus<dynamic> status,
          final ReciterStatistics? reciterStatistics}) =
      _$ReciterStatisticsStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  ReciterStatistics? get reciterStatistics;

  /// Create a copy of ReciterStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterStatisticsStateImplCopyWith<_$ReciterStatisticsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
