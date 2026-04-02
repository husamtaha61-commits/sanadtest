// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_subscription_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentSubscriptionData {
  String get token => throw _privateConstructorUsedError;
  String get whatsAppUrl => throw _privateConstructorUsedError;

  /// Create a copy of StudentSubscriptionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentSubscriptionDataCopyWith<StudentSubscriptionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentSubscriptionDataCopyWith<$Res> {
  factory $StudentSubscriptionDataCopyWith(StudentSubscriptionData value,
          $Res Function(StudentSubscriptionData) then) =
      _$StudentSubscriptionDataCopyWithImpl<$Res, StudentSubscriptionData>;
  @useResult
  $Res call({String token, String whatsAppUrl});
}

/// @nodoc
class _$StudentSubscriptionDataCopyWithImpl<$Res,
        $Val extends StudentSubscriptionData>
    implements $StudentSubscriptionDataCopyWith<$Res> {
  _$StudentSubscriptionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentSubscriptionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? whatsAppUrl = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      whatsAppUrl: null == whatsAppUrl
          ? _value.whatsAppUrl
          : whatsAppUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentSubscriptionDataImplCopyWith<$Res>
    implements $StudentSubscriptionDataCopyWith<$Res> {
  factory _$$StudentSubscriptionDataImplCopyWith(
          _$StudentSubscriptionDataImpl value,
          $Res Function(_$StudentSubscriptionDataImpl) then) =
      __$$StudentSubscriptionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String whatsAppUrl});
}

/// @nodoc
class __$$StudentSubscriptionDataImplCopyWithImpl<$Res>
    extends _$StudentSubscriptionDataCopyWithImpl<$Res,
        _$StudentSubscriptionDataImpl>
    implements _$$StudentSubscriptionDataImplCopyWith<$Res> {
  __$$StudentSubscriptionDataImplCopyWithImpl(
      _$StudentSubscriptionDataImpl _value,
      $Res Function(_$StudentSubscriptionDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentSubscriptionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? whatsAppUrl = null,
  }) {
    return _then(_$StudentSubscriptionDataImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      whatsAppUrl: null == whatsAppUrl
          ? _value.whatsAppUrl
          : whatsAppUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StudentSubscriptionDataImpl implements _StudentSubscriptionData {
  const _$StudentSubscriptionDataImpl(
      {required this.token, required this.whatsAppUrl});

  @override
  final String token;
  @override
  final String whatsAppUrl;

  @override
  String toString() {
    return 'StudentSubscriptionData(token: $token, whatsAppUrl: $whatsAppUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentSubscriptionDataImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.whatsAppUrl, whatsAppUrl) ||
                other.whatsAppUrl == whatsAppUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, whatsAppUrl);

  /// Create a copy of StudentSubscriptionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentSubscriptionDataImplCopyWith<_$StudentSubscriptionDataImpl>
      get copyWith => __$$StudentSubscriptionDataImplCopyWithImpl<
          _$StudentSubscriptionDataImpl>(this, _$identity);
}

abstract class _StudentSubscriptionData implements StudentSubscriptionData {
  const factory _StudentSubscriptionData(
      {required final String token,
      required final String whatsAppUrl}) = _$StudentSubscriptionDataImpl;

  @override
  String get token;
  @override
  String get whatsAppUrl;

  /// Create a copy of StudentSubscriptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentSubscriptionDataImplCopyWith<_$StudentSubscriptionDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
