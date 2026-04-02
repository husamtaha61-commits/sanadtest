// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currently_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrentlySession {
  String get sessionId => throw _privateConstructorUsedError;
  CurrentlySessionType get type => throw _privateConstructorUsedError;
  DateTime get currentlySessionDateTime => throw _privateConstructorUsedError;
  CurrentlySessionStatus get currentlySessionStatus =>
      throw _privateConstructorUsedError;
  CurrentlySessionStudentInfo get currentlySessionStudentInfo =>
      throw _privateConstructorUsedError;

  /// Create a copy of CurrentlySession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentlySessionCopyWith<CurrentlySession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentlySessionCopyWith<$Res> {
  factory $CurrentlySessionCopyWith(
          CurrentlySession value, $Res Function(CurrentlySession) then) =
      _$CurrentlySessionCopyWithImpl<$Res, CurrentlySession>;
  @useResult
  $Res call(
      {String sessionId,
      CurrentlySessionType type,
      DateTime currentlySessionDateTime,
      CurrentlySessionStatus currentlySessionStatus,
      CurrentlySessionStudentInfo currentlySessionStudentInfo});
}

/// @nodoc
class _$CurrentlySessionCopyWithImpl<$Res, $Val extends CurrentlySession>
    implements $CurrentlySessionCopyWith<$Res> {
  _$CurrentlySessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentlySession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? type = null,
    Object? currentlySessionDateTime = null,
    Object? currentlySessionStatus = null,
    Object? currentlySessionStudentInfo = null,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CurrentlySessionType,
      currentlySessionDateTime: null == currentlySessionDateTime
          ? _value.currentlySessionDateTime
          : currentlySessionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentlySessionStatus: null == currentlySessionStatus
          ? _value.currentlySessionStatus
          : currentlySessionStatus // ignore: cast_nullable_to_non_nullable
              as CurrentlySessionStatus,
      currentlySessionStudentInfo: null == currentlySessionStudentInfo
          ? _value.currentlySessionStudentInfo
          : currentlySessionStudentInfo // ignore: cast_nullable_to_non_nullable
              as CurrentlySessionStudentInfo,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentlySessionImplCopyWith<$Res>
    implements $CurrentlySessionCopyWith<$Res> {
  factory _$$CurrentlySessionImplCopyWith(_$CurrentlySessionImpl value,
          $Res Function(_$CurrentlySessionImpl) then) =
      __$$CurrentlySessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionId,
      CurrentlySessionType type,
      DateTime currentlySessionDateTime,
      CurrentlySessionStatus currentlySessionStatus,
      CurrentlySessionStudentInfo currentlySessionStudentInfo});
}

/// @nodoc
class __$$CurrentlySessionImplCopyWithImpl<$Res>
    extends _$CurrentlySessionCopyWithImpl<$Res, _$CurrentlySessionImpl>
    implements _$$CurrentlySessionImplCopyWith<$Res> {
  __$$CurrentlySessionImplCopyWithImpl(_$CurrentlySessionImpl _value,
      $Res Function(_$CurrentlySessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentlySession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? type = null,
    Object? currentlySessionDateTime = null,
    Object? currentlySessionStatus = null,
    Object? currentlySessionStudentInfo = null,
  }) {
    return _then(_$CurrentlySessionImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CurrentlySessionType,
      currentlySessionDateTime: null == currentlySessionDateTime
          ? _value.currentlySessionDateTime
          : currentlySessionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentlySessionStatus: null == currentlySessionStatus
          ? _value.currentlySessionStatus
          : currentlySessionStatus // ignore: cast_nullable_to_non_nullable
              as CurrentlySessionStatus,
      currentlySessionStudentInfo: null == currentlySessionStudentInfo
          ? _value.currentlySessionStudentInfo
          : currentlySessionStudentInfo // ignore: cast_nullable_to_non_nullable
              as CurrentlySessionStudentInfo,
    ));
  }
}

/// @nodoc

class _$CurrentlySessionImpl implements _CurrentlySession {
  const _$CurrentlySessionImpl(
      {required this.sessionId,
      required this.type,
      required this.currentlySessionDateTime,
      required this.currentlySessionStatus,
      required this.currentlySessionStudentInfo});

  @override
  final String sessionId;
  @override
  final CurrentlySessionType type;
  @override
  final DateTime currentlySessionDateTime;
  @override
  final CurrentlySessionStatus currentlySessionStatus;
  @override
  final CurrentlySessionStudentInfo currentlySessionStudentInfo;

  @override
  String toString() {
    return 'CurrentlySession(sessionId: $sessionId, type: $type, currentlySessionDateTime: $currentlySessionDateTime, currentlySessionStatus: $currentlySessionStatus, currentlySessionStudentInfo: $currentlySessionStudentInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentlySessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(
                    other.currentlySessionDateTime, currentlySessionDateTime) ||
                other.currentlySessionDateTime == currentlySessionDateTime) &&
            (identical(other.currentlySessionStatus, currentlySessionStatus) ||
                other.currentlySessionStatus == currentlySessionStatus) &&
            (identical(other.currentlySessionStudentInfo,
                    currentlySessionStudentInfo) ||
                other.currentlySessionStudentInfo ==
                    currentlySessionStudentInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      type,
      currentlySessionDateTime,
      currentlySessionStatus,
      currentlySessionStudentInfo);

  /// Create a copy of CurrentlySession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentlySessionImplCopyWith<_$CurrentlySessionImpl> get copyWith =>
      __$$CurrentlySessionImplCopyWithImpl<_$CurrentlySessionImpl>(
          this, _$identity);
}

abstract class _CurrentlySession implements CurrentlySession {
  const factory _CurrentlySession(
      {required final String sessionId,
      required final CurrentlySessionType type,
      required final DateTime currentlySessionDateTime,
      required final CurrentlySessionStatus currentlySessionStatus,
      required final CurrentlySessionStudentInfo
          currentlySessionStudentInfo}) = _$CurrentlySessionImpl;

  @override
  String get sessionId;
  @override
  CurrentlySessionType get type;
  @override
  DateTime get currentlySessionDateTime;
  @override
  CurrentlySessionStatus get currentlySessionStatus;
  @override
  CurrentlySessionStudentInfo get currentlySessionStudentInfo;

  /// Create a copy of CurrentlySession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentlySessionImplCopyWith<_$CurrentlySessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
