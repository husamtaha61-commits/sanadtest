// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Skill {
  int get id => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool? get isGained => throw _privateConstructorUsedError;
  List<Skill>? get children => throw _privateConstructorUsedError;
  SkillType get type => throw _privateConstructorUsedError;
  double? get percent => throw _privateConstructorUsedError;

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillCopyWith<Skill> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillCopyWith<$Res> {
  factory $SkillCopyWith(Skill value, $Res Function(Skill) then) =
      _$SkillCopyWithImpl<$Res, Skill>;
  @useResult
  $Res call(
      {int id,
      int? parentId,
      String name,
      bool? isGained,
      List<Skill>? children,
      SkillType type,
      double? percent});
}

/// @nodoc
class _$SkillCopyWithImpl<$Res, $Val extends Skill>
    implements $SkillCopyWith<$Res> {
  _$SkillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? name = null,
    Object? isGained = freezed,
    Object? children = freezed,
    Object? type = null,
    Object? percent = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isGained: freezed == isGained
          ? _value.isGained
          : isGained // ignore: cast_nullable_to_non_nullable
              as bool?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Skill>?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SkillType,
      percent: freezed == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillImplCopyWith<$Res> implements $SkillCopyWith<$Res> {
  factory _$$SkillImplCopyWith(
          _$SkillImpl value, $Res Function(_$SkillImpl) then) =
      __$$SkillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? parentId,
      String name,
      bool? isGained,
      List<Skill>? children,
      SkillType type,
      double? percent});
}

/// @nodoc
class __$$SkillImplCopyWithImpl<$Res>
    extends _$SkillCopyWithImpl<$Res, _$SkillImpl>
    implements _$$SkillImplCopyWith<$Res> {
  __$$SkillImplCopyWithImpl(
      _$SkillImpl _value, $Res Function(_$SkillImpl) _then)
      : super(_value, _then);

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? name = null,
    Object? isGained = freezed,
    Object? children = freezed,
    Object? type = null,
    Object? percent = freezed,
  }) {
    return _then(_$SkillImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isGained: freezed == isGained
          ? _value.isGained
          : isGained // ignore: cast_nullable_to_non_nullable
              as bool?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Skill>?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SkillType,
      percent: freezed == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$SkillImpl extends _Skill {
  const _$SkillImpl(
      {required this.id,
      this.parentId,
      required this.name,
      this.isGained,
      final List<Skill>? children,
      this.type = SkillType.undefined,
      this.percent = 0.0})
      : _children = children,
        super._();

  @override
  final int id;
  @override
  final int? parentId;
  @override
  final String name;
  @override
  final bool? isGained;
  final List<Skill>? _children;
  @override
  List<Skill>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final SkillType type;
  @override
  @JsonKey()
  final double? percent;

  @override
  String toString() {
    return 'Skill(id: $id, parentId: $parentId, name: $name, isGained: $isGained, children: $children, type: $type, percent: $percent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isGained, isGained) ||
                other.isGained == isGained) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, parentId, name, isGained,
      const DeepCollectionEquality().hash(_children), type, percent);

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillImplCopyWith<_$SkillImpl> get copyWith =>
      __$$SkillImplCopyWithImpl<_$SkillImpl>(this, _$identity);
}

abstract class _Skill extends Skill {
  const factory _Skill(
      {required final int id,
      final int? parentId,
      required final String name,
      final bool? isGained,
      final List<Skill>? children,
      final SkillType type,
      final double? percent}) = _$SkillImpl;
  const _Skill._() : super._();

  @override
  int get id;
  @override
  int? get parentId;
  @override
  String get name;
  @override
  bool? get isGained;
  @override
  List<Skill>? get children;
  @override
  SkillType get type;
  @override
  double? get percent;

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillImplCopyWith<_$SkillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
