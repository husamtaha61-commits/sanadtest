// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Session {
  String get sessionId => throw _privateConstructorUsedError;
  BaseField get type => throw _privateConstructorUsedError;
  DateTime get sessionDateTime => throw _privateConstructorUsedError;
  BaseField get status => throw _privateConstructorUsedError;
  StudentInfo get studentInfo => throw _privateConstructorUsedError;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {String sessionId,
      BaseField type,
      DateTime sessionDateTime,
      BaseField status,
      StudentInfo studentInfo});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? type = null,
    Object? sessionDateTime = null,
    Object? status = null,
    Object? studentInfo = null,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BaseField,
      sessionDateTime: null == sessionDateTime
          ? _value.sessionDateTime
          : sessionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseField,
      studentInfo: null == studentInfo
          ? _value.studentInfo
          : studentInfo // ignore: cast_nullable_to_non_nullable
              as StudentInfo,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionId,
      BaseField type,
      DateTime sessionDateTime,
      BaseField status,
      StudentInfo studentInfo});
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? type = null,
    Object? sessionDateTime = null,
    Object? status = null,
    Object? studentInfo = null,
  }) {
    return _then(_$SessionImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BaseField,
      sessionDateTime: null == sessionDateTime
          ? _value.sessionDateTime
          : sessionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseField,
      studentInfo: null == studentInfo
          ? _value.studentInfo
          : studentInfo // ignore: cast_nullable_to_non_nullable
              as StudentInfo,
    ));
  }
}

/// @nodoc

class _$SessionImpl implements _Session {
  const _$SessionImpl(
      {required this.sessionId,
      required this.type,
      required this.sessionDateTime,
      required this.status,
      required this.studentInfo});

  @override
  final String sessionId;
  @override
  final BaseField type;
  @override
  final DateTime sessionDateTime;
  @override
  final BaseField status;
  @override
  final StudentInfo studentInfo;

  @override
  String toString() {
    return 'Session(sessionId: $sessionId, type: $type, sessionDateTime: $sessionDateTime, status: $status, studentInfo: $studentInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sessionDateTime, sessionDateTime) ||
                other.sessionDateTime == sessionDateTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.studentInfo, studentInfo) ||
                other.studentInfo == studentInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, sessionId, type, sessionDateTime, status, studentInfo);

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);
}

abstract class _Session implements Session {
  const factory _Session(
      {required final String sessionId,
      required final BaseField type,
      required final DateTime sessionDateTime,
      required final BaseField status,
      required final StudentInfo studentInfo}) = _$SessionImpl;

  @override
  String get sessionId;
  @override
  BaseField get type;
  @override
  DateTime get sessionDateTime;
  @override
  BaseField get status;
  @override
  StudentInfo get studentInfo;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
