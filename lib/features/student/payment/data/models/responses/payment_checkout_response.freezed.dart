// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_checkout_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentCheckoutResponse _$PaymentCheckoutResponseFromJson(
    Map<String, dynamic> json) {
  return _PaymentCheckoutResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentCheckoutResponse {
  String get orderId => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get successIndicator => throw _privateConstructorUsedError;
  String get hostedPageUrl => throw _privateConstructorUsedError;

  /// Serializes this PaymentCheckoutResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentCheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCheckoutResponseCopyWith<PaymentCheckoutResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCheckoutResponseCopyWith<$Res> {
  factory $PaymentCheckoutResponseCopyWith(PaymentCheckoutResponse value,
          $Res Function(PaymentCheckoutResponse) then) =
      _$PaymentCheckoutResponseCopyWithImpl<$Res, PaymentCheckoutResponse>;
  @useResult
  $Res call(
      {String orderId,
      String sessionId,
      String successIndicator,
      String hostedPageUrl});
}

/// @nodoc
class _$PaymentCheckoutResponseCopyWithImpl<$Res,
        $Val extends PaymentCheckoutResponse>
    implements $PaymentCheckoutResponseCopyWith<$Res> {
  _$PaymentCheckoutResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentCheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? sessionId = null,
    Object? successIndicator = null,
    Object? hostedPageUrl = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      successIndicator: null == successIndicator
          ? _value.successIndicator
          : successIndicator // ignore: cast_nullable_to_non_nullable
              as String,
      hostedPageUrl: null == hostedPageUrl
          ? _value.hostedPageUrl
          : hostedPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentCheckoutResponseImplCopyWith<$Res>
    implements $PaymentCheckoutResponseCopyWith<$Res> {
  factory _$$PaymentCheckoutResponseImplCopyWith(
          _$PaymentCheckoutResponseImpl value,
          $Res Function(_$PaymentCheckoutResponseImpl) then) =
      __$$PaymentCheckoutResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      String sessionId,
      String successIndicator,
      String hostedPageUrl});
}

/// @nodoc
class __$$PaymentCheckoutResponseImplCopyWithImpl<$Res>
    extends _$PaymentCheckoutResponseCopyWithImpl<$Res,
        _$PaymentCheckoutResponseImpl>
    implements _$$PaymentCheckoutResponseImplCopyWith<$Res> {
  __$$PaymentCheckoutResponseImplCopyWithImpl(
      _$PaymentCheckoutResponseImpl _value,
      $Res Function(_$PaymentCheckoutResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentCheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? sessionId = null,
    Object? successIndicator = null,
    Object? hostedPageUrl = null,
  }) {
    return _then(_$PaymentCheckoutResponseImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      successIndicator: null == successIndicator
          ? _value.successIndicator
          : successIndicator // ignore: cast_nullable_to_non_nullable
              as String,
      hostedPageUrl: null == hostedPageUrl
          ? _value.hostedPageUrl
          : hostedPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentCheckoutResponseImpl implements _PaymentCheckoutResponse {
  const _$PaymentCheckoutResponseImpl(
      {required this.orderId,
      required this.sessionId,
      required this.successIndicator,
      required this.hostedPageUrl});

  factory _$PaymentCheckoutResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentCheckoutResponseImplFromJson(json);

  @override
  final String orderId;
  @override
  final String sessionId;
  @override
  final String successIndicator;
  @override
  final String hostedPageUrl;

  @override
  String toString() {
    return 'PaymentCheckoutResponse(orderId: $orderId, sessionId: $sessionId, successIndicator: $successIndicator, hostedPageUrl: $hostedPageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCheckoutResponseImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.successIndicator, successIndicator) ||
                other.successIndicator == successIndicator) &&
            (identical(other.hostedPageUrl, hostedPageUrl) ||
                other.hostedPageUrl == hostedPageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, orderId, sessionId, successIndicator, hostedPageUrl);

  /// Create a copy of PaymentCheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCheckoutResponseImplCopyWith<_$PaymentCheckoutResponseImpl>
      get copyWith => __$$PaymentCheckoutResponseImplCopyWithImpl<
          _$PaymentCheckoutResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentCheckoutResponseImplToJson(
      this,
    );
  }
}

abstract class _PaymentCheckoutResponse implements PaymentCheckoutResponse {
  const factory _PaymentCheckoutResponse(
      {required final String orderId,
      required final String sessionId,
      required final String successIndicator,
      required final String hostedPageUrl}) = _$PaymentCheckoutResponseImpl;

  factory _PaymentCheckoutResponse.fromJson(Map<String, dynamic> json) =
      _$PaymentCheckoutResponseImpl.fromJson;

  @override
  String get orderId;
  @override
  String get sessionId;
  @override
  String get successIndicator;
  @override
  String get hostedPageUrl;

  /// Create a copy of PaymentCheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentCheckoutResponseImplCopyWith<_$PaymentCheckoutResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
