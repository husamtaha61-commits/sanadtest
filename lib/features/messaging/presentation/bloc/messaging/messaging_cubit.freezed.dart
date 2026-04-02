// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messaging_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessagingState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  Map<String, MessagingConversation> get conversations =>
      throw _privateConstructorUsedError;
  bool get isTwilioClientSync => throw _privateConstructorUsedError;
  bool get isNewConversation => throw _privateConstructorUsedError;

  /// Create a copy of MessagingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessagingStateCopyWith<MessagingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagingStateCopyWith<$Res> {
  factory $MessagingStateCopyWith(
          MessagingState value, $Res Function(MessagingState) then) =
      _$MessagingStateCopyWithImpl<$Res, MessagingState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      String token,
      Map<String, MessagingConversation> conversations,
      bool isTwilioClientSync,
      bool isNewConversation});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$MessagingStateCopyWithImpl<$Res, $Val extends MessagingState>
    implements $MessagingStateCopyWith<$Res> {
  _$MessagingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessagingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? token = null,
    Object? conversations = null,
    Object? isTwilioClientSync = null,
    Object? isNewConversation = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      conversations: null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as Map<String, MessagingConversation>,
      isTwilioClientSync: null == isTwilioClientSync
          ? _value.isTwilioClientSync
          : isTwilioClientSync // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewConversation: null == isNewConversation
          ? _value.isNewConversation
          : isNewConversation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of MessagingState
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
abstract class _$$MessagingStateImplCopyWith<$Res>
    implements $MessagingStateCopyWith<$Res> {
  factory _$$MessagingStateImplCopyWith(_$MessagingStateImpl value,
          $Res Function(_$MessagingStateImpl) then) =
      __$$MessagingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      String token,
      Map<String, MessagingConversation> conversations,
      bool isTwilioClientSync,
      bool isNewConversation});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$MessagingStateImplCopyWithImpl<$Res>
    extends _$MessagingStateCopyWithImpl<$Res, _$MessagingStateImpl>
    implements _$$MessagingStateImplCopyWith<$Res> {
  __$$MessagingStateImplCopyWithImpl(
      _$MessagingStateImpl _value, $Res Function(_$MessagingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessagingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? token = null,
    Object? conversations = null,
    Object? isTwilioClientSync = null,
    Object? isNewConversation = null,
  }) {
    return _then(_$MessagingStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      conversations: null == conversations
          ? _value._conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as Map<String, MessagingConversation>,
      isTwilioClientSync: null == isTwilioClientSync
          ? _value.isTwilioClientSync
          : isTwilioClientSync // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewConversation: null == isNewConversation
          ? _value.isNewConversation
          : isNewConversation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MessagingStateImpl implements _MessagingState {
  const _$MessagingStateImpl(
      {this.status = const BaseStatus.initial(),
      this.token = '',
      final Map<String, MessagingConversation> conversations = const {},
      this.isTwilioClientSync = false,
      this.isNewConversation = false})
      : _conversations = conversations;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final String token;
  final Map<String, MessagingConversation> _conversations;
  @override
  @JsonKey()
  Map<String, MessagingConversation> get conversations {
    if (_conversations is EqualUnmodifiableMapView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_conversations);
  }

  @override
  @JsonKey()
  final bool isTwilioClientSync;
  @override
  @JsonKey()
  final bool isNewConversation;

  @override
  String toString() {
    return 'MessagingState(status: $status, token: $token, conversations: $conversations, isTwilioClientSync: $isTwilioClientSync, isNewConversation: $isNewConversation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagingStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations) &&
            (identical(other.isTwilioClientSync, isTwilioClientSync) ||
                other.isTwilioClientSync == isTwilioClientSync) &&
            (identical(other.isNewConversation, isNewConversation) ||
                other.isNewConversation == isNewConversation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      token,
      const DeepCollectionEquality().hash(_conversations),
      isTwilioClientSync,
      isNewConversation);

  /// Create a copy of MessagingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagingStateImplCopyWith<_$MessagingStateImpl> get copyWith =>
      __$$MessagingStateImplCopyWithImpl<_$MessagingStateImpl>(
          this, _$identity);
}

abstract class _MessagingState implements MessagingState {
  const factory _MessagingState(
      {final BaseStatus<dynamic> status,
      final String token,
      final Map<String, MessagingConversation> conversations,
      final bool isTwilioClientSync,
      final bool isNewConversation}) = _$MessagingStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  String get token;
  @override
  Map<String, MessagingConversation> get conversations;
  @override
  bool get isTwilioClientSync;
  @override
  bool get isNewConversation;

  /// Create a copy of MessagingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessagingStateImplCopyWith<_$MessagingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
