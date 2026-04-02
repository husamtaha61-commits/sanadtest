// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_center_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActionCenterState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<ActionCenter> get actions => throw _privateConstructorUsedError;

  /// Create a copy of ActionCenterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActionCenterStateCopyWith<ActionCenterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionCenterStateCopyWith<$Res> {
  factory $ActionCenterStateCopyWith(
          ActionCenterState value, $Res Function(ActionCenterState) then) =
      _$ActionCenterStateCopyWithImpl<$Res, ActionCenterState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, List<ActionCenter> actions});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$ActionCenterStateCopyWithImpl<$Res, $Val extends ActionCenterState>
    implements $ActionCenterStateCopyWith<$Res> {
  _$ActionCenterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionCenterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? actions = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<ActionCenter>,
    ) as $Val);
  }

  /// Create a copy of ActionCenterState
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
abstract class _$$ActionCenterStateImplCopyWith<$Res>
    implements $ActionCenterStateCopyWith<$Res> {
  factory _$$ActionCenterStateImplCopyWith(_$ActionCenterStateImpl value,
          $Res Function(_$ActionCenterStateImpl) then) =
      __$$ActionCenterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, List<ActionCenter> actions});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$ActionCenterStateImplCopyWithImpl<$Res>
    extends _$ActionCenterStateCopyWithImpl<$Res, _$ActionCenterStateImpl>
    implements _$$ActionCenterStateImplCopyWith<$Res> {
  __$$ActionCenterStateImplCopyWithImpl(_$ActionCenterStateImpl _value,
      $Res Function(_$ActionCenterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionCenterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? actions = null,
  }) {
    return _then(_$ActionCenterStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<ActionCenter>,
    ));
  }
}

/// @nodoc

class _$ActionCenterStateImpl implements _ActionCenterState {
  const _$ActionCenterStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<ActionCenter> actions = const []})
      : _actions = actions;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<ActionCenter> _actions;
  @override
  @JsonKey()
  List<ActionCenter> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'ActionCenterState(status: $status, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionCenterStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_actions));

  /// Create a copy of ActionCenterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionCenterStateImplCopyWith<_$ActionCenterStateImpl> get copyWith =>
      __$$ActionCenterStateImplCopyWithImpl<_$ActionCenterStateImpl>(
          this, _$identity);
}

abstract class _ActionCenterState implements ActionCenterState {
  const factory _ActionCenterState(
      {final BaseStatus<dynamic> status,
      final List<ActionCenter> actions}) = _$ActionCenterStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<ActionCenter> get actions;

  /// Create a copy of ActionCenterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionCenterStateImplCopyWith<_$ActionCenterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
