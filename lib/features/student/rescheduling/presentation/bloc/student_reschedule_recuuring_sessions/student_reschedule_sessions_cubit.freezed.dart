// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_reschedule_sessions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentRescheduleSessionsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  int? get selectedDay => throw _privateConstructorUsedError;
  String? get selectedTime => throw _privateConstructorUsedError;
  StudentRescheduleSessionsEvent? get event =>
      throw _privateConstructorUsedError;
  List<TimeData> get suggestedSessions => throw _privateConstructorUsedError;

  /// Create a copy of StudentRescheduleSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentRescheduleSessionsStateCopyWith<StudentRescheduleSessionsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentRescheduleSessionsStateCopyWith<$Res> {
  factory $StudentRescheduleSessionsStateCopyWith(
          StudentRescheduleSessionsState value,
          $Res Function(StudentRescheduleSessionsState) then) =
      _$StudentRescheduleSessionsStateCopyWithImpl<$Res,
          StudentRescheduleSessionsState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int? selectedDay,
      String? selectedTime,
      StudentRescheduleSessionsEvent? event,
      List<TimeData> suggestedSessions});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$StudentRescheduleSessionsStateCopyWithImpl<$Res,
        $Val extends StudentRescheduleSessionsState>
    implements $StudentRescheduleSessionsStateCopyWith<$Res> {
  _$StudentRescheduleSessionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentRescheduleSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedDay = freezed,
    Object? selectedTime = freezed,
    Object? event = freezed,
    Object? suggestedSessions = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedTime: freezed == selectedTime
          ? _value.selectedTime
          : selectedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as StudentRescheduleSessionsEvent?,
      suggestedSessions: null == suggestedSessions
          ? _value.suggestedSessions
          : suggestedSessions // ignore: cast_nullable_to_non_nullable
              as List<TimeData>,
    ) as $Val);
  }

  /// Create a copy of StudentRescheduleSessionsState
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
abstract class _$$StudentRescheduleSessionsStateImplCopyWith<$Res>
    implements $StudentRescheduleSessionsStateCopyWith<$Res> {
  factory _$$StudentRescheduleSessionsStateImplCopyWith(
          _$StudentRescheduleSessionsStateImpl value,
          $Res Function(_$StudentRescheduleSessionsStateImpl) then) =
      __$$StudentRescheduleSessionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int? selectedDay,
      String? selectedTime,
      StudentRescheduleSessionsEvent? event,
      List<TimeData> suggestedSessions});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$StudentRescheduleSessionsStateImplCopyWithImpl<$Res>
    extends _$StudentRescheduleSessionsStateCopyWithImpl<$Res,
        _$StudentRescheduleSessionsStateImpl>
    implements _$$StudentRescheduleSessionsStateImplCopyWith<$Res> {
  __$$StudentRescheduleSessionsStateImplCopyWithImpl(
      _$StudentRescheduleSessionsStateImpl _value,
      $Res Function(_$StudentRescheduleSessionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentRescheduleSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedDay = freezed,
    Object? selectedTime = freezed,
    Object? event = freezed,
    Object? suggestedSessions = null,
  }) {
    return _then(_$StudentRescheduleSessionsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedTime: freezed == selectedTime
          ? _value.selectedTime
          : selectedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as StudentRescheduleSessionsEvent?,
      suggestedSessions: null == suggestedSessions
          ? _value._suggestedSessions
          : suggestedSessions // ignore: cast_nullable_to_non_nullable
              as List<TimeData>,
    ));
  }
}

/// @nodoc

class _$StudentRescheduleSessionsStateImpl
    implements _StudentRescheduleSessionsState {
  const _$StudentRescheduleSessionsStateImpl(
      {this.status = const BaseStatus.initial(),
      this.selectedDay,
      this.selectedTime,
      this.event,
      final List<TimeData> suggestedSessions = const []})
      : _suggestedSessions = suggestedSessions;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  final int? selectedDay;
  @override
  final String? selectedTime;
  @override
  final StudentRescheduleSessionsEvent? event;
  final List<TimeData> _suggestedSessions;
  @override
  @JsonKey()
  List<TimeData> get suggestedSessions {
    if (_suggestedSessions is EqualUnmodifiableListView)
      return _suggestedSessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedSessions);
  }

  @override
  String toString() {
    return 'StudentRescheduleSessionsState(status: $status, selectedDay: $selectedDay, selectedTime: $selectedTime, event: $event, suggestedSessions: $suggestedSessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentRescheduleSessionsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.selectedTime, selectedTime) ||
                other.selectedTime == selectedTime) &&
            (identical(other.event, event) || other.event == event) &&
            const DeepCollectionEquality()
                .equals(other._suggestedSessions, _suggestedSessions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      selectedDay,
      selectedTime,
      event,
      const DeepCollectionEquality().hash(_suggestedSessions));

  /// Create a copy of StudentRescheduleSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentRescheduleSessionsStateImplCopyWith<
          _$StudentRescheduleSessionsStateImpl>
      get copyWith => __$$StudentRescheduleSessionsStateImplCopyWithImpl<
          _$StudentRescheduleSessionsStateImpl>(this, _$identity);
}

abstract class _StudentRescheduleSessionsState
    implements StudentRescheduleSessionsState {
  const factory _StudentRescheduleSessionsState(
          {final BaseStatus<dynamic> status,
          final int? selectedDay,
          final String? selectedTime,
          final StudentRescheduleSessionsEvent? event,
          final List<TimeData> suggestedSessions}) =
      _$StudentRescheduleSessionsStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  int? get selectedDay;
  @override
  String? get selectedTime;
  @override
  StudentRescheduleSessionsEvent? get event;
  @override
  List<TimeData> get suggestedSessions;

  /// Create a copy of StudentRescheduleSessionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentRescheduleSessionsStateImplCopyWith<
          _$StudentRescheduleSessionsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
