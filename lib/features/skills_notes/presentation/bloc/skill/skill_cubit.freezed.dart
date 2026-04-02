// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SkillState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<Skill> get skills => throw _privateConstructorUsedError;

  /// Create a copy of SkillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillStateCopyWith<SkillState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillStateCopyWith<$Res> {
  factory $SkillStateCopyWith(
          SkillState value, $Res Function(SkillState) then) =
      _$SkillStateCopyWithImpl<$Res, SkillState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, List<Skill> skills});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$SkillStateCopyWithImpl<$Res, $Val extends SkillState>
    implements $SkillStateCopyWith<$Res> {
  _$SkillStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? skills = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
    ) as $Val);
  }

  /// Create a copy of SkillState
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
abstract class _$$SkillStateImplCopyWith<$Res>
    implements $SkillStateCopyWith<$Res> {
  factory _$$SkillStateImplCopyWith(
          _$SkillStateImpl value, $Res Function(_$SkillStateImpl) then) =
      __$$SkillStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, List<Skill> skills});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$SkillStateImplCopyWithImpl<$Res>
    extends _$SkillStateCopyWithImpl<$Res, _$SkillStateImpl>
    implements _$$SkillStateImplCopyWith<$Res> {
  __$$SkillStateImplCopyWithImpl(
      _$SkillStateImpl _value, $Res Function(_$SkillStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? skills = null,
  }) {
    return _then(_$SkillStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
    ));
  }
}

/// @nodoc

class _$SkillStateImpl implements _SkillState {
  const _$SkillStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<Skill> skills = const []})
      : _skills = skills;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<Skill> _skills;
  @override
  @JsonKey()
  List<Skill> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  String toString() {
    return 'SkillState(status: $status, skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_skills));

  /// Create a copy of SkillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillStateImplCopyWith<_$SkillStateImpl> get copyWith =>
      __$$SkillStateImplCopyWithImpl<_$SkillStateImpl>(this, _$identity);
}

abstract class _SkillState implements SkillState {
  const factory _SkillState(
      {final BaseStatus<dynamic> status,
      final List<Skill> skills}) = _$SkillStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<Skill> get skills;

  /// Create a copy of SkillState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillStateImplCopyWith<_$SkillStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
