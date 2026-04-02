// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProgramState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<Program> get programs => throw _privateConstructorUsedError;

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgramStateCopyWith<ProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramStateCopyWith<$Res> {
  factory $ProgramStateCopyWith(
          ProgramState value, $Res Function(ProgramState) then) =
      _$ProgramStateCopyWithImpl<$Res, ProgramState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, List<Program> programs});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$ProgramStateCopyWithImpl<$Res, $Val extends ProgramState>
    implements $ProgramStateCopyWith<$Res> {
  _$ProgramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? programs = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      programs: null == programs
          ? _value.programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<Program>,
    ) as $Val);
  }

  /// Create a copy of ProgramState
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
abstract class _$$ProgramStateImplCopyWith<$Res>
    implements $ProgramStateCopyWith<$Res> {
  factory _$$ProgramStateImplCopyWith(
          _$ProgramStateImpl value, $Res Function(_$ProgramStateImpl) then) =
      __$$ProgramStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, List<Program> programs});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$ProgramStateImplCopyWithImpl<$Res>
    extends _$ProgramStateCopyWithImpl<$Res, _$ProgramStateImpl>
    implements _$$ProgramStateImplCopyWith<$Res> {
  __$$ProgramStateImplCopyWithImpl(
      _$ProgramStateImpl _value, $Res Function(_$ProgramStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? programs = null,
  }) {
    return _then(_$ProgramStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      programs: null == programs
          ? _value._programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<Program>,
    ));
  }
}

/// @nodoc

class _$ProgramStateImpl implements _ProgramState {
  const _$ProgramStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<Program> programs = const []})
      : _programs = programs;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<Program> _programs;
  @override
  @JsonKey()
  List<Program> get programs {
    if (_programs is EqualUnmodifiableListView) return _programs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_programs);
  }

  @override
  String toString() {
    return 'ProgramState(status: $status, programs: $programs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._programs, _programs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_programs));

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramStateImplCopyWith<_$ProgramStateImpl> get copyWith =>
      __$$ProgramStateImplCopyWithImpl<_$ProgramStateImpl>(this, _$identity);
}

abstract class _ProgramState implements ProgramState {
  const factory _ProgramState(
      {final BaseStatus<dynamic> status,
      final List<Program> programs}) = _$ProgramStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<Program> get programs;

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgramStateImplCopyWith<_$ProgramStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
