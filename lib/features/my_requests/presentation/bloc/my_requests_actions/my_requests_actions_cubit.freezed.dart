// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_requests_actions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyRequestsActionsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  int get requestId => throw _privateConstructorUsedError;
  int get requestStatusId => throw _privateConstructorUsedError;
  int? get approvedSuggestionId => throw _privateConstructorUsedError;

  /// Create a copy of MyRequestsActionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyRequestsActionsStateCopyWith<MyRequestsActionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyRequestsActionsStateCopyWith<$Res> {
  factory $MyRequestsActionsStateCopyWith(MyRequestsActionsState value,
          $Res Function(MyRequestsActionsState) then) =
      _$MyRequestsActionsStateCopyWithImpl<$Res, MyRequestsActionsState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int requestId,
      int requestStatusId,
      int? approvedSuggestionId});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$MyRequestsActionsStateCopyWithImpl<$Res,
        $Val extends MyRequestsActionsState>
    implements $MyRequestsActionsStateCopyWith<$Res> {
  _$MyRequestsActionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyRequestsActionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? requestId = null,
    Object? requestStatusId = null,
    Object? approvedSuggestionId = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
      requestStatusId: null == requestStatusId
          ? _value.requestStatusId
          : requestStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      approvedSuggestionId: freezed == approvedSuggestionId
          ? _value.approvedSuggestionId
          : approvedSuggestionId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of MyRequestsActionsState
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
abstract class _$$MyRequestsActionsStateImplCopyWith<$Res>
    implements $MyRequestsActionsStateCopyWith<$Res> {
  factory _$$MyRequestsActionsStateImplCopyWith(
          _$MyRequestsActionsStateImpl value,
          $Res Function(_$MyRequestsActionsStateImpl) then) =
      __$$MyRequestsActionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int requestId,
      int requestStatusId,
      int? approvedSuggestionId});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$MyRequestsActionsStateImplCopyWithImpl<$Res>
    extends _$MyRequestsActionsStateCopyWithImpl<$Res,
        _$MyRequestsActionsStateImpl>
    implements _$$MyRequestsActionsStateImplCopyWith<$Res> {
  __$$MyRequestsActionsStateImplCopyWithImpl(
      _$MyRequestsActionsStateImpl _value,
      $Res Function(_$MyRequestsActionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyRequestsActionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? requestId = null,
    Object? requestStatusId = null,
    Object? approvedSuggestionId = freezed,
  }) {
    return _then(_$MyRequestsActionsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
      requestStatusId: null == requestStatusId
          ? _value.requestStatusId
          : requestStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      approvedSuggestionId: freezed == approvedSuggestionId
          ? _value.approvedSuggestionId
          : approvedSuggestionId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$MyRequestsActionsStateImpl implements _MyRequestsActionsState {
  const _$MyRequestsActionsStateImpl(
      {this.status = const BaseStatus.initial(),
      this.requestId = 0,
      this.requestStatusId = 0,
      this.approvedSuggestionId});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final int requestId;
  @override
  @JsonKey()
  final int requestStatusId;
  @override
  final int? approvedSuggestionId;

  @override
  String toString() {
    return 'MyRequestsActionsState(status: $status, requestId: $requestId, requestStatusId: $requestStatusId, approvedSuggestionId: $approvedSuggestionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyRequestsActionsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.requestStatusId, requestStatusId) ||
                other.requestStatusId == requestStatusId) &&
            (identical(other.approvedSuggestionId, approvedSuggestionId) ||
                other.approvedSuggestionId == approvedSuggestionId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, requestId, requestStatusId, approvedSuggestionId);

  /// Create a copy of MyRequestsActionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyRequestsActionsStateImplCopyWith<_$MyRequestsActionsStateImpl>
      get copyWith => __$$MyRequestsActionsStateImplCopyWithImpl<
          _$MyRequestsActionsStateImpl>(this, _$identity);
}

abstract class _MyRequestsActionsState implements MyRequestsActionsState {
  const factory _MyRequestsActionsState(
      {final BaseStatus<dynamic> status,
      final int requestId,
      final int requestStatusId,
      final int? approvedSuggestionId}) = _$MyRequestsActionsStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  int get requestId;
  @override
  int get requestStatusId;
  @override
  int? get approvedSuggestionId;

  /// Create a copy of MyRequestsActionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyRequestsActionsStateImplCopyWith<_$MyRequestsActionsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
