// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_available_times_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProgramAvailableTimesState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<AvailableTimesOptions> get programAvailableTimes =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProgramAvailableTimesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgramAvailableTimesStateCopyWith<ProgramAvailableTimesState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramAvailableTimesStateCopyWith<$Res> {
  factory $ProgramAvailableTimesStateCopyWith(ProgramAvailableTimesState value,
          $Res Function(ProgramAvailableTimesState) then) =
      _$ProgramAvailableTimesStateCopyWithImpl<$Res,
          ProgramAvailableTimesState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<AvailableTimesOptions> programAvailableTimes});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$ProgramAvailableTimesStateCopyWithImpl<$Res,
        $Val extends ProgramAvailableTimesState>
    implements $ProgramAvailableTimesStateCopyWith<$Res> {
  _$ProgramAvailableTimesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgramAvailableTimesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? programAvailableTimes = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      programAvailableTimes: null == programAvailableTimes
          ? _value.programAvailableTimes
          : programAvailableTimes // ignore: cast_nullable_to_non_nullable
              as List<AvailableTimesOptions>,
    ) as $Val);
  }

  /// Create a copy of ProgramAvailableTimesState
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
abstract class _$$ProgramAvailableTimesStateImplCopyWith<$Res>
    implements $ProgramAvailableTimesStateCopyWith<$Res> {
  factory _$$ProgramAvailableTimesStateImplCopyWith(
          _$ProgramAvailableTimesStateImpl value,
          $Res Function(_$ProgramAvailableTimesStateImpl) then) =
      __$$ProgramAvailableTimesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<AvailableTimesOptions> programAvailableTimes});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$ProgramAvailableTimesStateImplCopyWithImpl<$Res>
    extends _$ProgramAvailableTimesStateCopyWithImpl<$Res,
        _$ProgramAvailableTimesStateImpl>
    implements _$$ProgramAvailableTimesStateImplCopyWith<$Res> {
  __$$ProgramAvailableTimesStateImplCopyWithImpl(
      _$ProgramAvailableTimesStateImpl _value,
      $Res Function(_$ProgramAvailableTimesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgramAvailableTimesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? programAvailableTimes = null,
  }) {
    return _then(_$ProgramAvailableTimesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      programAvailableTimes: null == programAvailableTimes
          ? _value._programAvailableTimes
          : programAvailableTimes // ignore: cast_nullable_to_non_nullable
              as List<AvailableTimesOptions>,
    ));
  }
}

/// @nodoc

class _$ProgramAvailableTimesStateImpl implements _ProgramAvailableTimesState {
  const _$ProgramAvailableTimesStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<AvailableTimesOptions> programAvailableTimes = const []})
      : _programAvailableTimes = programAvailableTimes;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<AvailableTimesOptions> _programAvailableTimes;
  @override
  @JsonKey()
  List<AvailableTimesOptions> get programAvailableTimes {
    if (_programAvailableTimes is EqualUnmodifiableListView)
      return _programAvailableTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_programAvailableTimes);
  }

  @override
  String toString() {
    return 'ProgramAvailableTimesState(status: $status, programAvailableTimes: $programAvailableTimes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramAvailableTimesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._programAvailableTimes, _programAvailableTimes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_programAvailableTimes));

  /// Create a copy of ProgramAvailableTimesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramAvailableTimesStateImplCopyWith<_$ProgramAvailableTimesStateImpl>
      get copyWith => __$$ProgramAvailableTimesStateImplCopyWithImpl<
          _$ProgramAvailableTimesStateImpl>(this, _$identity);
}

abstract class _ProgramAvailableTimesState
    implements ProgramAvailableTimesState {
  const factory _ProgramAvailableTimesState(
          {final BaseStatus<dynamic> status,
          final List<AvailableTimesOptions> programAvailableTimes}) =
      _$ProgramAvailableTimesStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<AvailableTimesOptions> get programAvailableTimes;

  /// Create a copy of ProgramAvailableTimesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgramAvailableTimesStateImplCopyWith<_$ProgramAvailableTimesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
