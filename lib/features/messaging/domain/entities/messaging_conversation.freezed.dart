// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messaging_conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessagingConversation {
  String get id => throw _privateConstructorUsedError;
  MessagingContact get otherParticipantInfo =>
      throw _privateConstructorUsedError;
  int get numberOfUnreadMessages => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  DateTime? get lastMessageDateCreation => throw _privateConstructorUsedError;
  PagingController<int, MessagingConversationMessage>? get pagingController =>
      throw _privateConstructorUsedError;

  /// Create a copy of MessagingConversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessagingConversationCopyWith<MessagingConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagingConversationCopyWith<$Res> {
  factory $MessagingConversationCopyWith(MessagingConversation value,
          $Res Function(MessagingConversation) then) =
      _$MessagingConversationCopyWithImpl<$Res, MessagingConversation>;
  @useResult
  $Res call(
      {String id,
      MessagingContact otherParticipantInfo,
      int numberOfUnreadMessages,
      String? lastMessage,
      DateTime? lastMessageDateCreation,
      PagingController<int, MessagingConversationMessage>? pagingController});

  $MessagingContactCopyWith<$Res> get otherParticipantInfo;
}

/// @nodoc
class _$MessagingConversationCopyWithImpl<$Res,
        $Val extends MessagingConversation>
    implements $MessagingConversationCopyWith<$Res> {
  _$MessagingConversationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessagingConversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? otherParticipantInfo = null,
    Object? numberOfUnreadMessages = null,
    Object? lastMessage = freezed,
    Object? lastMessageDateCreation = freezed,
    Object? pagingController = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      otherParticipantInfo: null == otherParticipantInfo
          ? _value.otherParticipantInfo
          : otherParticipantInfo // ignore: cast_nullable_to_non_nullable
              as MessagingContact,
      numberOfUnreadMessages: null == numberOfUnreadMessages
          ? _value.numberOfUnreadMessages
          : numberOfUnreadMessages // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageDateCreation: freezed == lastMessageDateCreation
          ? _value.lastMessageDateCreation
          : lastMessageDateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pagingController: freezed == pagingController
          ? _value.pagingController
          : pagingController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, MessagingConversationMessage>?,
    ) as $Val);
  }

  /// Create a copy of MessagingConversation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessagingContactCopyWith<$Res> get otherParticipantInfo {
    return $MessagingContactCopyWith<$Res>(_value.otherParticipantInfo,
        (value) {
      return _then(_value.copyWith(otherParticipantInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessagingConversationImplCopyWith<$Res>
    implements $MessagingConversationCopyWith<$Res> {
  factory _$$MessagingConversationImplCopyWith(
          _$MessagingConversationImpl value,
          $Res Function(_$MessagingConversationImpl) then) =
      __$$MessagingConversationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      MessagingContact otherParticipantInfo,
      int numberOfUnreadMessages,
      String? lastMessage,
      DateTime? lastMessageDateCreation,
      PagingController<int, MessagingConversationMessage>? pagingController});

  @override
  $MessagingContactCopyWith<$Res> get otherParticipantInfo;
}

/// @nodoc
class __$$MessagingConversationImplCopyWithImpl<$Res>
    extends _$MessagingConversationCopyWithImpl<$Res,
        _$MessagingConversationImpl>
    implements _$$MessagingConversationImplCopyWith<$Res> {
  __$$MessagingConversationImplCopyWithImpl(_$MessagingConversationImpl _value,
      $Res Function(_$MessagingConversationImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessagingConversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? otherParticipantInfo = null,
    Object? numberOfUnreadMessages = null,
    Object? lastMessage = freezed,
    Object? lastMessageDateCreation = freezed,
    Object? pagingController = freezed,
  }) {
    return _then(_$MessagingConversationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      otherParticipantInfo: null == otherParticipantInfo
          ? _value.otherParticipantInfo
          : otherParticipantInfo // ignore: cast_nullable_to_non_nullable
              as MessagingContact,
      numberOfUnreadMessages: null == numberOfUnreadMessages
          ? _value.numberOfUnreadMessages
          : numberOfUnreadMessages // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageDateCreation: freezed == lastMessageDateCreation
          ? _value.lastMessageDateCreation
          : lastMessageDateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pagingController: freezed == pagingController
          ? _value.pagingController
          : pagingController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, MessagingConversationMessage>?,
    ));
  }
}

/// @nodoc

class _$MessagingConversationImpl implements _MessagingConversation {
  const _$MessagingConversationImpl(
      {required this.id,
      required this.otherParticipantInfo,
      required this.numberOfUnreadMessages,
      this.lastMessage,
      this.lastMessageDateCreation,
      this.pagingController});

  @override
  final String id;
  @override
  final MessagingContact otherParticipantInfo;
  @override
  final int numberOfUnreadMessages;
  @override
  final String? lastMessage;
  @override
  final DateTime? lastMessageDateCreation;
  @override
  final PagingController<int, MessagingConversationMessage>? pagingController;

  @override
  String toString() {
    return 'MessagingConversation(id: $id, otherParticipantInfo: $otherParticipantInfo, numberOfUnreadMessages: $numberOfUnreadMessages, lastMessage: $lastMessage, lastMessageDateCreation: $lastMessageDateCreation, pagingController: $pagingController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagingConversationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.otherParticipantInfo, otherParticipantInfo) ||
                other.otherParticipantInfo == otherParticipantInfo) &&
            (identical(other.numberOfUnreadMessages, numberOfUnreadMessages) ||
                other.numberOfUnreadMessages == numberOfUnreadMessages) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(
                    other.lastMessageDateCreation, lastMessageDateCreation) ||
                other.lastMessageDateCreation == lastMessageDateCreation) &&
            (identical(other.pagingController, pagingController) ||
                other.pagingController == pagingController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      otherParticipantInfo,
      numberOfUnreadMessages,
      lastMessage,
      lastMessageDateCreation,
      pagingController);

  /// Create a copy of MessagingConversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagingConversationImplCopyWith<_$MessagingConversationImpl>
      get copyWith => __$$MessagingConversationImplCopyWithImpl<
          _$MessagingConversationImpl>(this, _$identity);
}

abstract class _MessagingConversation implements MessagingConversation {
  const factory _MessagingConversation(
      {required final String id,
      required final MessagingContact otherParticipantInfo,
      required final int numberOfUnreadMessages,
      final String? lastMessage,
      final DateTime? lastMessageDateCreation,
      final PagingController<int, MessagingConversationMessage>?
          pagingController}) = _$MessagingConversationImpl;

  @override
  String get id;
  @override
  MessagingContact get otherParticipantInfo;
  @override
  int get numberOfUnreadMessages;
  @override
  String? get lastMessage;
  @override
  DateTime? get lastMessageDateCreation;
  @override
  PagingController<int, MessagingConversationMessage>? get pagingController;

  /// Create a copy of MessagingConversation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessagingConversationImplCopyWith<_$MessagingConversationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
