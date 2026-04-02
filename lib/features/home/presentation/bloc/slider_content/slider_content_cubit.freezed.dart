// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider_content_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SliderContentState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<SliderContent> get sliderContent => throw _privateConstructorUsedError;

  /// Create a copy of SliderContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SliderContentStateCopyWith<SliderContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderContentStateCopyWith<$Res> {
  factory $SliderContentStateCopyWith(
          SliderContentState value, $Res Function(SliderContentState) then) =
      _$SliderContentStateCopyWithImpl<$Res, SliderContentState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, List<SliderContent> sliderContent});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$SliderContentStateCopyWithImpl<$Res, $Val extends SliderContentState>
    implements $SliderContentStateCopyWith<$Res> {
  _$SliderContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SliderContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sliderContent = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      sliderContent: null == sliderContent
          ? _value.sliderContent
          : sliderContent // ignore: cast_nullable_to_non_nullable
              as List<SliderContent>,
    ) as $Val);
  }

  /// Create a copy of SliderContentState
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
abstract class _$$SliderContentStateImplCopyWith<$Res>
    implements $SliderContentStateCopyWith<$Res> {
  factory _$$SliderContentStateImplCopyWith(_$SliderContentStateImpl value,
          $Res Function(_$SliderContentStateImpl) then) =
      __$$SliderContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, List<SliderContent> sliderContent});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$SliderContentStateImplCopyWithImpl<$Res>
    extends _$SliderContentStateCopyWithImpl<$Res, _$SliderContentStateImpl>
    implements _$$SliderContentStateImplCopyWith<$Res> {
  __$$SliderContentStateImplCopyWithImpl(_$SliderContentStateImpl _value,
      $Res Function(_$SliderContentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SliderContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sliderContent = null,
  }) {
    return _then(_$SliderContentStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      sliderContent: null == sliderContent
          ? _value._sliderContent
          : sliderContent // ignore: cast_nullable_to_non_nullable
              as List<SliderContent>,
    ));
  }
}

/// @nodoc

class _$SliderContentStateImpl implements _SliderContentState {
  const _$SliderContentStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<SliderContent> sliderContent = const []})
      : _sliderContent = sliderContent;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<SliderContent> _sliderContent;
  @override
  @JsonKey()
  List<SliderContent> get sliderContent {
    if (_sliderContent is EqualUnmodifiableListView) return _sliderContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sliderContent);
  }

  @override
  String toString() {
    return 'SliderContentState(status: $status, sliderContent: $sliderContent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderContentStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._sliderContent, _sliderContent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_sliderContent));

  /// Create a copy of SliderContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderContentStateImplCopyWith<_$SliderContentStateImpl> get copyWith =>
      __$$SliderContentStateImplCopyWithImpl<_$SliderContentStateImpl>(
          this, _$identity);
}

abstract class _SliderContentState implements SliderContentState {
  const factory _SliderContentState(
      {final BaseStatus<dynamic> status,
      final List<SliderContent> sliderContent}) = _$SliderContentStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<SliderContent> get sliderContent;

  /// Create a copy of SliderContentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SliderContentStateImplCopyWith<_$SliderContentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
