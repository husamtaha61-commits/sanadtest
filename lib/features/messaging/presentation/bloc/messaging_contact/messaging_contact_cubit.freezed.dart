// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messaging_contact_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessagingContactState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<MessagingContact> get contacts => throw _privateConstructorUsedError;

  /// Create a copy of MessagingContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessagingContactStateCopyWith<MessagingContactState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagingContactStateCopyWith<$Res> {
  factory $MessagingContactStateCopyWith(MessagingContactState value,
          $Res Function(MessagingContactState) then) =
      _$MessagingContactStateCopyWithImpl<$Res, MessagingContactState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, List<MessagingContact> contacts});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$MessagingContactStateCopyWithImpl<$Res,
        $Val extends MessagingContactState>
    implements $MessagingContactStateCopyWith<$Res> {
  _$MessagingContactStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessagingContactState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? contacts = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<MessagingContact>,
    ) as $Val);
  }

  /// Create a copy of MessagingContactState
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
abstract class _$$MessagingContactStateImplCopyWith<$Res>
    implements $MessagingContactStateCopyWith<$Res> {
  factory _$$MessagingContactStateImplCopyWith(
          _$MessagingContactStateImpl value,
          $Res Function(_$MessagingContactStateImpl) then) =
      __$$MessagingContactStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, List<MessagingContact> contacts});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$MessagingContactStateImplCopyWithImpl<$Res>
    extends _$MessagingContactStateCopyWithImpl<$Res,
        _$MessagingContactStateImpl>
    implements _$$MessagingContactStateImplCopyWith<$Res> {
  __$$MessagingContactStateImplCopyWithImpl(_$MessagingContactStateImpl _value,
      $Res Function(_$MessagingContactStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessagingContactState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? contacts = null,
  }) {
    return _then(_$MessagingContactStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<MessagingContact>,
    ));
  }
}

/// @nodoc

class _$MessagingContactStateImpl implements _MessagingContactState {
  const _$MessagingContactStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<MessagingContact> contacts = const []})
      : _contacts = contacts;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<MessagingContact> _contacts;
  @override
  @JsonKey()
  List<MessagingContact> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'MessagingContactState(status: $status, contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagingContactStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_contacts));

  /// Create a copy of MessagingContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagingContactStateImplCopyWith<_$MessagingContactStateImpl>
      get copyWith => __$$MessagingContactStateImplCopyWithImpl<
          _$MessagingContactStateImpl>(this, _$identity);
}

abstract class _MessagingContactState implements MessagingContactState {
  const factory _MessagingContactState(
      {final BaseStatus<dynamic> status,
      final List<MessagingContact> contacts}) = _$MessagingContactStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<MessagingContact> get contacts;

  /// Create a copy of MessagingContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessagingContactStateImplCopyWith<_$MessagingContactStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
