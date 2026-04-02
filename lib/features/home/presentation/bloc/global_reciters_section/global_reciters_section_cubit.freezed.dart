// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_reciters_section_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GlobalRecitersSectionState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  GlobalRecitersSection? get globalRecitersSection =>
      throw _privateConstructorUsedError;

  /// Create a copy of GlobalRecitersSectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalRecitersSectionStateCopyWith<GlobalRecitersSectionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalRecitersSectionStateCopyWith<$Res> {
  factory $GlobalRecitersSectionStateCopyWith(GlobalRecitersSectionState value,
          $Res Function(GlobalRecitersSectionState) then) =
      _$GlobalRecitersSectionStateCopyWithImpl<$Res,
          GlobalRecitersSectionState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      GlobalRecitersSection? globalRecitersSection});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$GlobalRecitersSectionStateCopyWithImpl<$Res,
        $Val extends GlobalRecitersSectionState>
    implements $GlobalRecitersSectionStateCopyWith<$Res> {
  _$GlobalRecitersSectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalRecitersSectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? globalRecitersSection = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      globalRecitersSection: freezed == globalRecitersSection
          ? _value.globalRecitersSection
          : globalRecitersSection // ignore: cast_nullable_to_non_nullable
              as GlobalRecitersSection?,
    ) as $Val);
  }

  /// Create a copy of GlobalRecitersSectionState
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
abstract class _$$GlobalRecitersSectionStateImplCopyWith<$Res>
    implements $GlobalRecitersSectionStateCopyWith<$Res> {
  factory _$$GlobalRecitersSectionStateImplCopyWith(
          _$GlobalRecitersSectionStateImpl value,
          $Res Function(_$GlobalRecitersSectionStateImpl) then) =
      __$$GlobalRecitersSectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      GlobalRecitersSection? globalRecitersSection});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$GlobalRecitersSectionStateImplCopyWithImpl<$Res>
    extends _$GlobalRecitersSectionStateCopyWithImpl<$Res,
        _$GlobalRecitersSectionStateImpl>
    implements _$$GlobalRecitersSectionStateImplCopyWith<$Res> {
  __$$GlobalRecitersSectionStateImplCopyWithImpl(
      _$GlobalRecitersSectionStateImpl _value,
      $Res Function(_$GlobalRecitersSectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalRecitersSectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? globalRecitersSection = freezed,
  }) {
    return _then(_$GlobalRecitersSectionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      globalRecitersSection: freezed == globalRecitersSection
          ? _value.globalRecitersSection
          : globalRecitersSection // ignore: cast_nullable_to_non_nullable
              as GlobalRecitersSection?,
    ));
  }
}

/// @nodoc

class _$GlobalRecitersSectionStateImpl implements _GlobalRecitersSectionState {
  const _$GlobalRecitersSectionStateImpl(
      {this.status = const BaseStatus.initial(), this.globalRecitersSection});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  final GlobalRecitersSection? globalRecitersSection;

  @override
  String toString() {
    return 'GlobalRecitersSectionState(status: $status, globalRecitersSection: $globalRecitersSection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalRecitersSectionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.globalRecitersSection, globalRecitersSection) ||
                other.globalRecitersSection == globalRecitersSection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, globalRecitersSection);

  /// Create a copy of GlobalRecitersSectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalRecitersSectionStateImplCopyWith<_$GlobalRecitersSectionStateImpl>
      get copyWith => __$$GlobalRecitersSectionStateImplCopyWithImpl<
          _$GlobalRecitersSectionStateImpl>(this, _$identity);
}

abstract class _GlobalRecitersSectionState
    implements GlobalRecitersSectionState {
  const factory _GlobalRecitersSectionState(
          {final BaseStatus<dynamic> status,
          final GlobalRecitersSection? globalRecitersSection}) =
      _$GlobalRecitersSectionStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  GlobalRecitersSection? get globalRecitersSection;

  /// Create a copy of GlobalRecitersSectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalRecitersSectionStateImplCopyWith<_$GlobalRecitersSectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
