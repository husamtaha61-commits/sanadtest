// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messaging_conversation_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessagingConversationMessage {
  String get id => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  DateTime? get dateCreation => throw _privateConstructorUsedError;
  int get authorId => throw _privateConstructorUsedError;

  /// Create a copy of MessagingConversationMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessagingConversationMessageCopyWith<MessagingConversationMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagingConversationMessageCopyWith<$Res> {
  factory $MessagingConversationMessageCopyWith(
          MessagingConversationMessage value,
          $Res Function(MessagingConversationMessage) then) =
      _$MessagingConversationMessageCopyWithImpl<$Res,
          MessagingConversationMessage>;
  @useResult
  $Res call(
      {String id,
      String? body,
      bool? isRead,
      DateTime? dateCreation,
      int authorId});
}

/// @nodoc
class _$MessagingConversationMessageCopyWithImpl<$Res,
        $Val extends MessagingConversationMessage>
    implements $MessagingConversationMessageCopyWith<$Res> {
  _$MessagingConversationMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessagingConversationMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = freezed,
    Object? isRead = freezed,
    Object? dateCreation = freezed,
    Object? authorId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateCreation: freezed == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessagingConversationMessageImplCopyWith<$Res>
    implements $MessagingConversationMessageCopyWith<$Res> {
  factory _$$MessagingConversationMessageImplCopyWith(
          _$MessagingConversationMessageImpl value,
          $Res Function(_$MessagingConversationMessageImpl) then) =
      __$$MessagingConversationMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? body,
      bool? isRead,
      DateTime? dateCreation,
      int authorId});
}

/// @nodoc
class __$$MessagingConversationMessageImplCopyWithImpl<$Res>
    extends _$MessagingConversationMessageCopyWithImpl<$Res,
        _$MessagingConversationMessageImpl>
    implements _$$MessagingConversationMessageImplCopyWith<$Res> {
  __$$MessagingConversationMessageImplCopyWithImpl(
      _$MessagingConversationMessageImpl _value,
      $Res Function(_$MessagingConversationMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessagingConversationMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = freezed,
    Object? isRead = freezed,
    Object? dateCreation = freezed,
    Object? authorId = null,
  }) {
    return _then(_$MessagingConversationMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateCreation: freezed == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MessagingConversationMessageImpl
    implements _MessagingConversationMessage {
  const _$MessagingConversationMessageImpl(
      {required this.id,
      this.body,
      this.isRead,
      this.dateCreation,
      required this.authorId});

  @override
  final String id;
  @override
  final String? body;
  @override
  final bool? isRead;
  @override
  final DateTime? dateCreation;
  @override
  final int authorId;

  @override
  String toString() {
    return 'MessagingConversationMessage(id: $id, body: $body, isRead: $isRead, dateCreation: $dateCreation, authorId: $authorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagingConversationMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.dateCreation, dateCreation) ||
                other.dateCreation == dateCreation) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, body, isRead, dateCreation, authorId);

  /// Create a copy of MessagingConversationMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagingConversationMessageImplCopyWith<
          _$MessagingConversationMessageImpl>
      get copyWith => __$$MessagingConversationMessageImplCopyWithImpl<
          _$MessagingConversationMessageImpl>(this, _$identity);
}

abstract class _MessagingConversationMessage
    implements MessagingConversationMessage {
  const factory _MessagingConversationMessage(
      {required final String id,
      final String? body,
      final bool? isRead,
      final DateTime? dateCreation,
      required final int authorId}) = _$MessagingConversationMessageImpl;

  @override
  String get id;
  @override
  String? get body;
  @override
  bool? get isRead;
  @override
  DateTime? get dateCreation;
  @override
  int get authorId;

  /// Create a copy of MessagingConversationMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessagingConversationMessageImplCopyWith<
          _$MessagingConversationMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}
