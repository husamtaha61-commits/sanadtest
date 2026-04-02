// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter_student_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReciterStudentState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<ReciterStudent> get students => throw _privateConstructorUsedError;
  int get activeStudentId => throw _privateConstructorUsedError;

  /// Create a copy of ReciterStudentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterStudentStateCopyWith<ReciterStudentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterStudentStateCopyWith<$Res> {
  factory $ReciterStudentStateCopyWith(
          ReciterStudentState value, $Res Function(ReciterStudentState) then) =
      _$ReciterStudentStateCopyWithImpl<$Res, ReciterStudentState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<ReciterStudent> students,
      int activeStudentId});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$ReciterStudentStateCopyWithImpl<$Res, $Val extends ReciterStudentState>
    implements $ReciterStudentStateCopyWith<$Res> {
  _$ReciterStudentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReciterStudentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? students = null,
    Object? activeStudentId = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<ReciterStudent>,
      activeStudentId: null == activeStudentId
          ? _value.activeStudentId
          : activeStudentId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of ReciterStudentState
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
abstract class _$$ReciterStudentStateImplCopyWith<$Res>
    implements $ReciterStudentStateCopyWith<$Res> {
  factory _$$ReciterStudentStateImplCopyWith(_$ReciterStudentStateImpl value,
          $Res Function(_$ReciterStudentStateImpl) then) =
      __$$ReciterStudentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<ReciterStudent> students,
      int activeStudentId});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$ReciterStudentStateImplCopyWithImpl<$Res>
    extends _$ReciterStudentStateCopyWithImpl<$Res, _$ReciterStudentStateImpl>
    implements _$$ReciterStudentStateImplCopyWith<$Res> {
  __$$ReciterStudentStateImplCopyWithImpl(_$ReciterStudentStateImpl _value,
      $Res Function(_$ReciterStudentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReciterStudentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? students = null,
    Object? activeStudentId = null,
  }) {
    return _then(_$ReciterStudentStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      students: null == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<ReciterStudent>,
      activeStudentId: null == activeStudentId
          ? _value.activeStudentId
          : activeStudentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReciterStudentStateImpl implements _ReciterStudentState {
  const _$ReciterStudentStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<ReciterStudent> students = const [],
      this.activeStudentId = -1})
      : _students = students;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<ReciterStudent> _students;
  @override
  @JsonKey()
  List<ReciterStudent> get students {
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  @override
  @JsonKey()
  final int activeStudentId;

  @override
  String toString() {
    return 'ReciterStudentState(status: $status, students: $students, activeStudentId: $activeStudentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterStudentStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            (identical(other.activeStudentId, activeStudentId) ||
                other.activeStudentId == activeStudentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_students), activeStudentId);

  /// Create a copy of ReciterStudentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterStudentStateImplCopyWith<_$ReciterStudentStateImpl> get copyWith =>
      __$$ReciterStudentStateImplCopyWithImpl<_$ReciterStudentStateImpl>(
          this, _$identity);
}

abstract class _ReciterStudentState implements ReciterStudentState {
  const factory _ReciterStudentState(
      {final BaseStatus<dynamic> status,
      final List<ReciterStudent> students,
      final int activeStudentId}) = _$ReciterStudentStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<ReciterStudent> get students;
  @override
  int get activeStudentId;

  /// Create a copy of ReciterStudentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterStudentStateImplCopyWith<_$ReciterStudentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
