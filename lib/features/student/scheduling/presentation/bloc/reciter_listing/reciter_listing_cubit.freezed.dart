// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter_listing_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReciterListingState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<Reciter> get reciters => throw _privateConstructorUsedError;

  /// Create a copy of ReciterListingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterListingStateCopyWith<ReciterListingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterListingStateCopyWith<$Res> {
  factory $ReciterListingStateCopyWith(
          ReciterListingState value, $Res Function(ReciterListingState) then) =
      _$ReciterListingStateCopyWithImpl<$Res, ReciterListingState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, List<Reciter> reciters});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$ReciterListingStateCopyWithImpl<$Res, $Val extends ReciterListingState>
    implements $ReciterListingStateCopyWith<$Res> {
  _$ReciterListingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReciterListingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? reciters = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      reciters: null == reciters
          ? _value.reciters
          : reciters // ignore: cast_nullable_to_non_nullable
              as List<Reciter>,
    ) as $Val);
  }

  /// Create a copy of ReciterListingState
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
abstract class _$$ReciterListingStateImplCopyWith<$Res>
    implements $ReciterListingStateCopyWith<$Res> {
  factory _$$ReciterListingStateImplCopyWith(_$ReciterListingStateImpl value,
          $Res Function(_$ReciterListingStateImpl) then) =
      __$$ReciterListingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, List<Reciter> reciters});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$ReciterListingStateImplCopyWithImpl<$Res>
    extends _$ReciterListingStateCopyWithImpl<$Res, _$ReciterListingStateImpl>
    implements _$$ReciterListingStateImplCopyWith<$Res> {
  __$$ReciterListingStateImplCopyWithImpl(_$ReciterListingStateImpl _value,
      $Res Function(_$ReciterListingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReciterListingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? reciters = null,
  }) {
    return _then(_$ReciterListingStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      reciters: null == reciters
          ? _value._reciters
          : reciters // ignore: cast_nullable_to_non_nullable
              as List<Reciter>,
    ));
  }
}

/// @nodoc

class _$ReciterListingStateImpl implements _ReciterListingState {
  const _$ReciterListingStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<Reciter> reciters = const []})
      : _reciters = reciters;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<Reciter> _reciters;
  @override
  @JsonKey()
  List<Reciter> get reciters {
    if (_reciters is EqualUnmodifiableListView) return _reciters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reciters);
  }

  @override
  String toString() {
    return 'ReciterListingState(status: $status, reciters: $reciters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterListingStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._reciters, _reciters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_reciters));

  /// Create a copy of ReciterListingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterListingStateImplCopyWith<_$ReciterListingStateImpl> get copyWith =>
      __$$ReciterListingStateImplCopyWithImpl<_$ReciterListingStateImpl>(
          this, _$identity);
}

abstract class _ReciterListingState implements ReciterListingState {
  const factory _ReciterListingState(
      {final BaseStatus<dynamic> status,
      final List<Reciter> reciters}) = _$ReciterListingStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<Reciter> get reciters;

  /// Create a copy of ReciterListingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterListingStateImplCopyWith<_$ReciterListingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
