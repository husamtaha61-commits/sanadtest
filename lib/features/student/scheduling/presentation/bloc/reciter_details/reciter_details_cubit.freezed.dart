// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReciterDetailsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  BaseStatus<dynamic> get actionStatus => throw _privateConstructorUsedError;
  Reciter? get reciter => throw _privateConstructorUsedError;

  /// Create a copy of ReciterDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterDetailsStateCopyWith<ReciterDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterDetailsStateCopyWith<$Res> {
  factory $ReciterDetailsStateCopyWith(
          ReciterDetailsState value, $Res Function(ReciterDetailsState) then) =
      _$ReciterDetailsStateCopyWithImpl<$Res, ReciterDetailsState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      BaseStatus<dynamic> actionStatus,
      Reciter? reciter});

  $BaseStatusCopyWith<dynamic, $Res> get status;
  $BaseStatusCopyWith<dynamic, $Res> get actionStatus;
  $ReciterCopyWith<$Res>? get reciter;
}

/// @nodoc
class _$ReciterDetailsStateCopyWithImpl<$Res, $Val extends ReciterDetailsState>
    implements $ReciterDetailsStateCopyWith<$Res> {
  _$ReciterDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReciterDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? actionStatus = null,
    Object? reciter = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      actionStatus: null == actionStatus
          ? _value.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      reciter: freezed == reciter
          ? _value.reciter
          : reciter // ignore: cast_nullable_to_non_nullable
              as Reciter?,
    ) as $Val);
  }

  /// Create a copy of ReciterDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get status {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of ReciterDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get actionStatus {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.actionStatus, (value) {
      return _then(_value.copyWith(actionStatus: value) as $Val);
    });
  }

  /// Create a copy of ReciterDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReciterCopyWith<$Res>? get reciter {
    if (_value.reciter == null) {
      return null;
    }

    return $ReciterCopyWith<$Res>(_value.reciter!, (value) {
      return _then(_value.copyWith(reciter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReciterDetailsStateImplCopyWith<$Res>
    implements $ReciterDetailsStateCopyWith<$Res> {
  factory _$$ReciterDetailsStateImplCopyWith(_$ReciterDetailsStateImpl value,
          $Res Function(_$ReciterDetailsStateImpl) then) =
      __$$ReciterDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      BaseStatus<dynamic> actionStatus,
      Reciter? reciter});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
  @override
  $BaseStatusCopyWith<dynamic, $Res> get actionStatus;
  @override
  $ReciterCopyWith<$Res>? get reciter;
}

/// @nodoc
class __$$ReciterDetailsStateImplCopyWithImpl<$Res>
    extends _$ReciterDetailsStateCopyWithImpl<$Res, _$ReciterDetailsStateImpl>
    implements _$$ReciterDetailsStateImplCopyWith<$Res> {
  __$$ReciterDetailsStateImplCopyWithImpl(_$ReciterDetailsStateImpl _value,
      $Res Function(_$ReciterDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReciterDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? actionStatus = null,
    Object? reciter = freezed,
  }) {
    return _then(_$ReciterDetailsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      actionStatus: null == actionStatus
          ? _value.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      reciter: freezed == reciter
          ? _value.reciter
          : reciter // ignore: cast_nullable_to_non_nullable
              as Reciter?,
    ));
  }
}

/// @nodoc

class _$ReciterDetailsStateImpl implements _ReciterDetailsState {
  const _$ReciterDetailsStateImpl(
      {this.status = const BaseStatus.initial(),
      this.actionStatus = const BaseStatus.initial(),
      this.reciter});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final BaseStatus<dynamic> actionStatus;
  @override
  final Reciter? reciter;

  @override
  String toString() {
    return 'ReciterDetailsState(status: $status, actionStatus: $actionStatus, reciter: $reciter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterDetailsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.reciter, reciter) || other.reciter == reciter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, actionStatus, reciter);

  /// Create a copy of ReciterDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterDetailsStateImplCopyWith<_$ReciterDetailsStateImpl> get copyWith =>
      __$$ReciterDetailsStateImplCopyWithImpl<_$ReciterDetailsStateImpl>(
          this, _$identity);
}

abstract class _ReciterDetailsState implements ReciterDetailsState {
  const factory _ReciterDetailsState(
      {final BaseStatus<dynamic> status,
      final BaseStatus<dynamic> actionStatus,
      final Reciter? reciter}) = _$ReciterDetailsStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  BaseStatus<dynamic> get actionStatus;
  @override
  Reciter? get reciter;

  /// Create a copy of ReciterDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterDetailsStateImplCopyWith<_$ReciterDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
