// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter_favorite_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReciterFavoriteState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  bool get isFav => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;

  /// Create a copy of ReciterFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterFavoriteStateCopyWith<ReciterFavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterFavoriteStateCopyWith<$Res> {
  factory $ReciterFavoriteStateCopyWith(ReciterFavoriteState value,
          $Res Function(ReciterFavoriteState) then) =
      _$ReciterFavoriteStateCopyWithImpl<$Res, ReciterFavoriteState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, bool isFav, String msg});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$ReciterFavoriteStateCopyWithImpl<$Res,
        $Val extends ReciterFavoriteState>
    implements $ReciterFavoriteStateCopyWith<$Res> {
  _$ReciterFavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReciterFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isFav = null,
    Object? msg = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      isFav: null == isFav
          ? _value.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of ReciterFavoriteState
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
abstract class _$$ReciterFavoriteStateImplCopyWith<$Res>
    implements $ReciterFavoriteStateCopyWith<$Res> {
  factory _$$ReciterFavoriteStateImplCopyWith(_$ReciterFavoriteStateImpl value,
          $Res Function(_$ReciterFavoriteStateImpl) then) =
      __$$ReciterFavoriteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, bool isFav, String msg});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$ReciterFavoriteStateImplCopyWithImpl<$Res>
    extends _$ReciterFavoriteStateCopyWithImpl<$Res, _$ReciterFavoriteStateImpl>
    implements _$$ReciterFavoriteStateImplCopyWith<$Res> {
  __$$ReciterFavoriteStateImplCopyWithImpl(_$ReciterFavoriteStateImpl _value,
      $Res Function(_$ReciterFavoriteStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReciterFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isFav = null,
    Object? msg = null,
  }) {
    return _then(_$ReciterFavoriteStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      isFav: null == isFav
          ? _value.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReciterFavoriteStateImpl implements _ReciterFavoriteState {
  const _$ReciterFavoriteStateImpl(
      {this.status = const BaseStatus.initial(),
      this.isFav = false,
      this.msg = ''});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final bool isFav;
  @override
  @JsonKey()
  final String msg;

  @override
  String toString() {
    return 'ReciterFavoriteState(status: $status, isFav: $isFav, msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterFavoriteStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isFav, isFav) || other.isFav == isFav) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, isFav, msg);

  /// Create a copy of ReciterFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterFavoriteStateImplCopyWith<_$ReciterFavoriteStateImpl>
      get copyWith =>
          __$$ReciterFavoriteStateImplCopyWithImpl<_$ReciterFavoriteStateImpl>(
              this, _$identity);
}

abstract class _ReciterFavoriteState implements ReciterFavoriteState {
  const factory _ReciterFavoriteState(
      {final BaseStatus<dynamic> status,
      final bool isFav,
      final String msg}) = _$ReciterFavoriteStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  bool get isFav;
  @override
  String get msg;

  /// Create a copy of ReciterFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterFavoriteStateImplCopyWith<_$ReciterFavoriteStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
