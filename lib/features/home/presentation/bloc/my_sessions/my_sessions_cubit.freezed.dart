// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_sessions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MySessionsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;

  /// The current active session (can be in progress or upcoming within 1 hour)
  CurrentlySession? get firstSession => throw _privateConstructorUsedError;
  int get firstSessionIndex => throw _privateConstructorUsedError;

  /// The next session after the current one
  CurrentlySession? get nextSession => throw _privateConstructorUsedError;
  int get nextSessionIndex => throw _privateConstructorUsedError;
  List<Session> get weekSessions => throw _privateConstructorUsedError;

  /// Create a copy of MySessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MySessionsStateCopyWith<MySessionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MySessionsStateCopyWith<$Res> {
  factory $MySessionsStateCopyWith(
          MySessionsState value, $Res Function(MySessionsState) then) =
      _$MySessionsStateCopyWithImpl<$Res, MySessionsState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      CurrentlySession? firstSession,
      int firstSessionIndex,
      CurrentlySession? nextSession,
      int nextSessionIndex,
      List<Session> weekSessions});

  $BaseStatusCopyWith<dynamic, $Res> get status;
  $CurrentlySessionCopyWith<$Res>? get firstSession;
  $CurrentlySessionCopyWith<$Res>? get nextSession;
}

/// @nodoc
class _$MySessionsStateCopyWithImpl<$Res, $Val extends MySessionsState>
    implements $MySessionsStateCopyWith<$Res> {
  _$MySessionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MySessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? firstSession = freezed,
    Object? firstSessionIndex = null,
    Object? nextSession = freezed,
    Object? nextSessionIndex = null,
    Object? weekSessions = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      firstSession: freezed == firstSession
          ? _value.firstSession
          : firstSession // ignore: cast_nullable_to_non_nullable
              as CurrentlySession?,
      firstSessionIndex: null == firstSessionIndex
          ? _value.firstSessionIndex
          : firstSessionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      nextSession: freezed == nextSession
          ? _value.nextSession
          : nextSession // ignore: cast_nullable_to_non_nullable
              as CurrentlySession?,
      nextSessionIndex: null == nextSessionIndex
          ? _value.nextSessionIndex
          : nextSessionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      weekSessions: null == weekSessions
          ? _value.weekSessions
          : weekSessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ) as $Val);
  }

  /// Create a copy of MySessionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get status {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of MySessionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentlySessionCopyWith<$Res>? get firstSession {
    if (_value.firstSession == null) {
      return null;
    }

    return $CurrentlySessionCopyWith<$Res>(_value.firstSession!, (value) {
      return _then(_value.copyWith(firstSession: value) as $Val);
    });
  }

  /// Create a copy of MySessionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentlySessionCopyWith<$Res>? get nextSession {
    if (_value.nextSession == null) {
      return null;
    }

    return $CurrentlySessionCopyWith<$Res>(_value.nextSession!, (value) {
      return _then(_value.copyWith(nextSession: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MySessionsStateImplCopyWith<$Res>
    implements $MySessionsStateCopyWith<$Res> {
  factory _$$MySessionsStateImplCopyWith(_$MySessionsStateImpl value,
          $Res Function(_$MySessionsStateImpl) then) =
      __$$MySessionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      CurrentlySession? firstSession,
      int firstSessionIndex,
      CurrentlySession? nextSession,
      int nextSessionIndex,
      List<Session> weekSessions});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
  @override
  $CurrentlySessionCopyWith<$Res>? get firstSession;
  @override
  $CurrentlySessionCopyWith<$Res>? get nextSession;
}

/// @nodoc
class __$$MySessionsStateImplCopyWithImpl<$Res>
    extends _$MySessionsStateCopyWithImpl<$Res, _$MySessionsStateImpl>
    implements _$$MySessionsStateImplCopyWith<$Res> {
  __$$MySessionsStateImplCopyWithImpl(
      _$MySessionsStateImpl _value, $Res Function(_$MySessionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MySessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? firstSession = freezed,
    Object? firstSessionIndex = null,
    Object? nextSession = freezed,
    Object? nextSessionIndex = null,
    Object? weekSessions = null,
  }) {
    return _then(_$MySessionsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      firstSession: freezed == firstSession
          ? _value.firstSession
          : firstSession // ignore: cast_nullable_to_non_nullable
              as CurrentlySession?,
      firstSessionIndex: null == firstSessionIndex
          ? _value.firstSessionIndex
          : firstSessionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      nextSession: freezed == nextSession
          ? _value.nextSession
          : nextSession // ignore: cast_nullable_to_non_nullable
              as CurrentlySession?,
      nextSessionIndex: null == nextSessionIndex
          ? _value.nextSessionIndex
          : nextSessionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      weekSessions: null == weekSessions
          ? _value._weekSessions
          : weekSessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc

class _$MySessionsStateImpl implements _MySessionsState {
  const _$MySessionsStateImpl(
      {this.status = const BaseStatus.initial(),
      this.firstSession,
      this.firstSessionIndex = 0,
      this.nextSession,
      this.nextSessionIndex = -1,
      final List<Session> weekSessions = const []})
      : _weekSessions = weekSessions;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;

  /// The current active session (can be in progress or upcoming within 1 hour)
  @override
  final CurrentlySession? firstSession;
  @override
  @JsonKey()
  final int firstSessionIndex;

  /// The next session after the current one
  @override
  final CurrentlySession? nextSession;
  @override
  @JsonKey()
  final int nextSessionIndex;
  final List<Session> _weekSessions;
  @override
  @JsonKey()
  List<Session> get weekSessions {
    if (_weekSessions is EqualUnmodifiableListView) return _weekSessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekSessions);
  }

  @override
  String toString() {
    return 'MySessionsState(status: $status, firstSession: $firstSession, firstSessionIndex: $firstSessionIndex, nextSession: $nextSession, nextSessionIndex: $nextSessionIndex, weekSessions: $weekSessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MySessionsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.firstSession, firstSession) ||
                other.firstSession == firstSession) &&
            (identical(other.firstSessionIndex, firstSessionIndex) ||
                other.firstSessionIndex == firstSessionIndex) &&
            (identical(other.nextSession, nextSession) ||
                other.nextSession == nextSession) &&
            (identical(other.nextSessionIndex, nextSessionIndex) ||
                other.nextSessionIndex == nextSessionIndex) &&
            const DeepCollectionEquality()
                .equals(other._weekSessions, _weekSessions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      firstSession,
      firstSessionIndex,
      nextSession,
      nextSessionIndex,
      const DeepCollectionEquality().hash(_weekSessions));

  /// Create a copy of MySessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MySessionsStateImplCopyWith<_$MySessionsStateImpl> get copyWith =>
      __$$MySessionsStateImplCopyWithImpl<_$MySessionsStateImpl>(
          this, _$identity);
}

abstract class _MySessionsState implements MySessionsState {
  const factory _MySessionsState(
      {final BaseStatus<dynamic> status,
      final CurrentlySession? firstSession,
      final int firstSessionIndex,
      final CurrentlySession? nextSession,
      final int nextSessionIndex,
      final List<Session> weekSessions}) = _$MySessionsStateImpl;

  @override
  BaseStatus<dynamic> get status;

  /// The current active session (can be in progress or upcoming within 1 hour)
  @override
  CurrentlySession? get firstSession;
  @override
  int get firstSessionIndex;

  /// The next session after the current one
  @override
  CurrentlySession? get nextSession;
  @override
  int get nextSessionIndex;
  @override
  List<Session> get weekSessions;

  /// Create a copy of MySessionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MySessionsStateImplCopyWith<_$MySessionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
