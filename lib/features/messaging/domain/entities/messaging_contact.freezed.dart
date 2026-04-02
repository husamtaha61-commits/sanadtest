// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messaging_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessagingContact {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get conversationId => throw _privateConstructorUsedError;

  /// Create a copy of MessagingContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessagingContactCopyWith<MessagingContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagingContactCopyWith<$Res> {
  factory $MessagingContactCopyWith(
          MessagingContact value, $Res Function(MessagingContact) then) =
      _$MessagingContactCopyWithImpl<$Res, MessagingContact>;
  @useResult
  $Res call(
      {int id,
      String firstName,
      String? middleName,
      String lastName,
      String? profileImageUrl,
      String? conversationId});
}

/// @nodoc
class _$MessagingContactCopyWithImpl<$Res, $Val extends MessagingContact>
    implements $MessagingContactCopyWith<$Res> {
  _$MessagingContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessagingContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? lastName = null,
    Object? profileImageUrl = freezed,
    Object? conversationId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessagingContactImplCopyWith<$Res>
    implements $MessagingContactCopyWith<$Res> {
  factory _$$MessagingContactImplCopyWith(_$MessagingContactImpl value,
          $Res Function(_$MessagingContactImpl) then) =
      __$$MessagingContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstName,
      String? middleName,
      String lastName,
      String? profileImageUrl,
      String? conversationId});
}

/// @nodoc
class __$$MessagingContactImplCopyWithImpl<$Res>
    extends _$MessagingContactCopyWithImpl<$Res, _$MessagingContactImpl>
    implements _$$MessagingContactImplCopyWith<$Res> {
  __$$MessagingContactImplCopyWithImpl(_$MessagingContactImpl _value,
      $Res Function(_$MessagingContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessagingContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? lastName = null,
    Object? profileImageUrl = freezed,
    Object? conversationId = freezed,
  }) {
    return _then(_$MessagingContactImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MessagingContactImpl implements _MessagingContact {
  const _$MessagingContactImpl(
      {required this.id,
      required this.firstName,
      this.middleName,
      required this.lastName,
      this.profileImageUrl,
      this.conversationId});

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String? middleName;
  @override
  final String lastName;
  @override
  final String? profileImageUrl;
  @override
  final String? conversationId;

  @override
  String toString() {
    return 'MessagingContact(id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName, profileImageUrl: $profileImageUrl, conversationId: $conversationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagingContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, middleName,
      lastName, profileImageUrl, conversationId);

  /// Create a copy of MessagingContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagingContactImplCopyWith<_$MessagingContactImpl> get copyWith =>
      __$$MessagingContactImplCopyWithImpl<_$MessagingContactImpl>(
          this, _$identity);
}

abstract class _MessagingContact implements MessagingContact {
  const factory _MessagingContact(
      {required final int id,
      required final String firstName,
      final String? middleName,
      required final String lastName,
      final String? profileImageUrl,
      final String? conversationId}) = _$MessagingContactImpl;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String? get middleName;
  @override
  String get lastName;
  @override
  String? get profileImageUrl;
  @override
  String? get conversationId;

  /// Create a copy of MessagingContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessagingContactImplCopyWith<_$MessagingContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
