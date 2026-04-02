// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_my_recurring_sessions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentMyRecurringSessionsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<SessionTimeDate> get scheduledSessions =>
      throw _privateConstructorUsedError;
  List<SessionTimeDate> get originalScheduledSessions =>
      throw _privateConstructorUsedError;

  /// Create a copy of StudentMyRecurringSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentMyRecurringSessionsStateCopyWith<StudentMyRecurringSessionsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentMyRecurringSessionsStateCopyWith<$Res> {
  factory $StudentMyRecurringSessionsStateCopyWith(
          StudentMyRecurringSessionsState value,
          $Res Function(StudentMyRecurringSessionsState) then) =
      _$StudentMyRecurringSessionsStateCopyWithImpl<$Res,
          StudentMyRecurringSessionsState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<SessionTimeDate> scheduledSessions,
      List<SessionTimeDate> originalScheduledSessions});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$StudentMyRecurringSessionsStateCopyWithImpl<$Res,
        $Val extends StudentMyRecurringSessionsState>
    implements $StudentMyRecurringSessionsStateCopyWith<$Res> {
  _$StudentMyRecurringSessionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentMyRecurringSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? scheduledSessions = null,
    Object? originalScheduledSessions = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      scheduledSessions: null == scheduledSessions
          ? _value.scheduledSessions
          : scheduledSessions // ignore: cast_nullable_to_non_nullable
              as List<SessionTimeDate>,
      originalScheduledSessions: null == originalScheduledSessions
          ? _value.originalScheduledSessions
          : originalScheduledSessions // ignore: cast_nullable_to_non_nullable
              as List<SessionTimeDate>,
    ) as $Val);
  }

  /// Create a copy of StudentMyRecurringSessionsState
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
abstract class _$$StudentMyRecurringSessionsStateImplCopyWith<$Res>
    implements $StudentMyRecurringSessionsStateCopyWith<$Res> {
  factory _$$StudentMyRecurringSessionsStateImplCopyWith(
          _$StudentMyRecurringSessionsStateImpl value,
          $Res Function(_$StudentMyRecurringSessionsStateImpl) then) =
      __$$StudentMyRecurringSessionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<SessionTimeDate> scheduledSessions,
      List<SessionTimeDate> originalScheduledSessions});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$StudentMyRecurringSessionsStateImplCopyWithImpl<$Res>
    extends _$StudentMyRecurringSessionsStateCopyWithImpl<$Res,
        _$StudentMyRecurringSessionsStateImpl>
    implements _$$StudentMyRecurringSessionsStateImplCopyWith<$Res> {
  __$$StudentMyRecurringSessionsStateImplCopyWithImpl(
      _$StudentMyRecurringSessionsStateImpl _value,
      $Res Function(_$StudentMyRecurringSessionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentMyRecurringSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? scheduledSessions = null,
    Object? originalScheduledSessions = null,
  }) {
    return _then(_$StudentMyRecurringSessionsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      scheduledSessions: null == scheduledSessions
          ? _value._scheduledSessions
          : scheduledSessions // ignore: cast_nullable_to_non_nullable
              as List<SessionTimeDate>,
      originalScheduledSessions: null == originalScheduledSessions
          ? _value._originalScheduledSessions
          : originalScheduledSessions // ignore: cast_nullable_to_non_nullable
              as List<SessionTimeDate>,
    ));
  }
}

/// @nodoc

class _$StudentMyRecurringSessionsStateImpl
    implements _StudentMyRecurringSessionsState {
  const _$StudentMyRecurringSessionsStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<SessionTimeDate> scheduledSessions = const [],
      final List<SessionTimeDate> originalScheduledSessions = const []})
      : _scheduledSessions = scheduledSessions,
        _originalScheduledSessions = originalScheduledSessions;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<SessionTimeDate> _scheduledSessions;
  @override
  @JsonKey()
  List<SessionTimeDate> get scheduledSessions {
    if (_scheduledSessions is EqualUnmodifiableListView)
      return _scheduledSessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduledSessions);
  }

  final List<SessionTimeDate> _originalScheduledSessions;
  @override
  @JsonKey()
  List<SessionTimeDate> get originalScheduledSessions {
    if (_originalScheduledSessions is EqualUnmodifiableListView)
      return _originalScheduledSessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_originalScheduledSessions);
  }

  @override
  String toString() {
    return 'StudentMyRecurringSessionsState(status: $status, scheduledSessions: $scheduledSessions, originalScheduledSessions: $originalScheduledSessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentMyRecurringSessionsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._scheduledSessions, _scheduledSessions) &&
            const DeepCollectionEquality().equals(
                other._originalScheduledSessions, _originalScheduledSessions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_scheduledSessions),
      const DeepCollectionEquality().hash(_originalScheduledSessions));

  /// Create a copy of StudentMyRecurringSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentMyRecurringSessionsStateImplCopyWith<
          _$StudentMyRecurringSessionsStateImpl>
      get copyWith => __$$StudentMyRecurringSessionsStateImplCopyWithImpl<
          _$StudentMyRecurringSessionsStateImpl>(this, _$identity);
}

abstract class _StudentMyRecurringSessionsState
    implements StudentMyRecurringSessionsState {
  const factory _StudentMyRecurringSessionsState(
          {final BaseStatus<dynamic> status,
          final List<SessionTimeDate> scheduledSessions,
          final List<SessionTimeDate> originalScheduledSessions}) =
      _$StudentMyRecurringSessionsStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<SessionTimeDate> get scheduledSessions;
  @override
  List<SessionTimeDate> get originalScheduledSessions;

  /// Create a copy of StudentMyRecurringSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentMyRecurringSessionsStateImplCopyWith<
          _$StudentMyRecurringSessionsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
