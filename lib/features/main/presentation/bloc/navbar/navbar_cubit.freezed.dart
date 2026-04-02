// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navbar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavbarState {
  int get index => throw _privateConstructorUsedError;

  /// Create a copy of NavbarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NavbarStateCopyWith<NavbarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavbarStateCopyWith<$Res> {
  factory $NavbarStateCopyWith(
          NavbarState value, $Res Function(NavbarState) then) =
      _$NavbarStateCopyWithImpl<$Res, NavbarState>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$NavbarStateCopyWithImpl<$Res, $Val extends NavbarState>
    implements $NavbarStateCopyWith<$Res> {
  _$NavbarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NavbarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavbarStateImplCopyWith<$Res>
    implements $NavbarStateCopyWith<$Res> {
  factory _$$NavbarStateImplCopyWith(
          _$NavbarStateImpl value, $Res Function(_$NavbarStateImpl) then) =
      __$$NavbarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$NavbarStateImplCopyWithImpl<$Res>
    extends _$NavbarStateCopyWithImpl<$Res, _$NavbarStateImpl>
    implements _$$NavbarStateImplCopyWith<$Res> {
  __$$NavbarStateImplCopyWithImpl(
      _$NavbarStateImpl _value, $Res Function(_$NavbarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NavbarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$NavbarStateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NavbarStateImpl implements _NavbarState {
  const _$NavbarStateImpl({this.index = 2});

  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'NavbarState(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavbarStateImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of NavbarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavbarStateImplCopyWith<_$NavbarStateImpl> get copyWith =>
      __$$NavbarStateImplCopyWithImpl<_$NavbarStateImpl>(this, _$identity);
}

abstract class _NavbarState implements NavbarState {
  const factory _NavbarState({final int index}) = _$NavbarStateImpl;

  @override
  int get index;

  /// Create a copy of NavbarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavbarStateImplCopyWith<_$NavbarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
