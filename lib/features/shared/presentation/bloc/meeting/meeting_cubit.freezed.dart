// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MeetingState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool get sessionStarted => throw _privateConstructorUsedError;

  /// Create a copy of MeetingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeetingStateCopyWith<MeetingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingStateCopyWith<$Res> {
  factory $MeetingStateCopyWith(
          MeetingState value, $Res Function(MeetingState) then) =
      _$MeetingStateCopyWithImpl<$Res, MeetingState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, String url, bool sessionStarted});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$MeetingStateCopyWithImpl<$Res, $Val extends MeetingState>
    implements $MeetingStateCopyWith<$Res> {
  _$MeetingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeetingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? url = null,
    Object? sessionStarted = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      sessionStarted: null == sessionStarted
          ? _value.sessionStarted
          : sessionStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of MeetingState
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
abstract class _$$MeetingStateImplCopyWith<$Res>
    implements $MeetingStateCopyWith<$Res> {
  factory _$$MeetingStateImplCopyWith(
          _$MeetingStateImpl value, $Res Function(_$MeetingStateImpl) then) =
      __$$MeetingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, String url, bool sessionStarted});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$MeetingStateImplCopyWithImpl<$Res>
    extends _$MeetingStateCopyWithImpl<$Res, _$MeetingStateImpl>
    implements _$$MeetingStateImplCopyWith<$Res> {
  __$$MeetingStateImplCopyWithImpl(
      _$MeetingStateImpl _value, $Res Function(_$MeetingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeetingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? url = null,
    Object? sessionStarted = null,
  }) {
    return _then(_$MeetingStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      sessionStarted: null == sessionStarted
          ? _value.sessionStarted
          : sessionStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MeetingStateImpl implements _MeetingState {
  const _$MeetingStateImpl(
      {this.status = const BaseStatus.initial(),
      this.url = '',
      this.sessionStarted = false});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final bool sessionStarted;

  @override
  String toString() {
    return 'MeetingState(status: $status, url: $url, sessionStarted: $sessionStarted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeetingStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.sessionStarted, sessionStarted) ||
                other.sessionStarted == sessionStarted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, url, sessionStarted);

  /// Create a copy of MeetingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeetingStateImplCopyWith<_$MeetingStateImpl> get copyWith =>
      __$$MeetingStateImplCopyWithImpl<_$MeetingStateImpl>(this, _$identity);
}

abstract class _MeetingState implements MeetingState {
  const factory _MeetingState(
      {final BaseStatus<dynamic> status,
      final String url,
      final bool sessionStarted}) = _$MeetingStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  String get url;
  @override
  bool get sessionStarted;

  /// Create a copy of MeetingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeetingStateImplCopyWith<_$MeetingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
