// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_checkout_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentCheckoutRequest _$PaymentCheckoutRequestFromJson(
    Map<String, dynamic> json) {
  return _PaymentCheckoutRequest.fromJson(json);
}

/// @nodoc
mixin _$PaymentCheckoutRequest {
  int get subscriptionId => throw _privateConstructorUsedError;
  bool get isInstallment => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get customerEmail => throw _privateConstructorUsedError;

  /// Serializes this PaymentCheckoutRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentCheckoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCheckoutRequestCopyWith<PaymentCheckoutRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCheckoutRequestCopyWith<$Res> {
  factory $PaymentCheckoutRequestCopyWith(PaymentCheckoutRequest value,
          $Res Function(PaymentCheckoutRequest) then) =
      _$PaymentCheckoutRequestCopyWithImpl<$Res, PaymentCheckoutRequest>;
  @useResult
  $Res call(
      {int subscriptionId,
      bool isInstallment,
      String currency,
      String customerEmail});
}

/// @nodoc
class _$PaymentCheckoutRequestCopyWithImpl<$Res,
        $Val extends PaymentCheckoutRequest>
    implements $PaymentCheckoutRequestCopyWith<$Res> {
  _$PaymentCheckoutRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentCheckoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptionId = null,
    Object? isInstallment = null,
    Object? currency = null,
    Object? customerEmail = null,
  }) {
    return _then(_value.copyWith(
      subscriptionId: null == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as int,
      isInstallment: null == isInstallment
          ? _value.isInstallment
          : isInstallment // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      customerEmail: null == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentCheckoutRequestImplCopyWith<$Res>
    implements $PaymentCheckoutRequestCopyWith<$Res> {
  factory _$$PaymentCheckoutRequestImplCopyWith(
          _$PaymentCheckoutRequestImpl value,
          $Res Function(_$PaymentCheckoutRequestImpl) then) =
      __$$PaymentCheckoutRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int subscriptionId,
      bool isInstallment,
      String currency,
      String customerEmail});
}

/// @nodoc
class __$$PaymentCheckoutRequestImplCopyWithImpl<$Res>
    extends _$PaymentCheckoutRequestCopyWithImpl<$Res,
        _$PaymentCheckoutRequestImpl>
    implements _$$PaymentCheckoutRequestImplCopyWith<$Res> {
  __$$PaymentCheckoutRequestImplCopyWithImpl(
      _$PaymentCheckoutRequestImpl _value,
      $Res Function(_$PaymentCheckoutRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentCheckoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptionId = null,
    Object? isInstallment = null,
    Object? currency = null,
    Object? customerEmail = null,
  }) {
    return _then(_$PaymentCheckoutRequestImpl(
      subscriptionId: null == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as int,
      isInstallment: null == isInstallment
          ? _value.isInstallment
          : isInstallment // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      customerEmail: null == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentCheckoutRequestImpl implements _PaymentCheckoutRequest {
  const _$PaymentCheckoutRequestImpl(
      {required this.subscriptionId,
      required this.isInstallment,
      required this.currency,
      required this.customerEmail});

  factory _$PaymentCheckoutRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentCheckoutRequestImplFromJson(json);

  @override
  final int subscriptionId;
  @override
  final bool isInstallment;
  @override
  final String currency;
  @override
  final String customerEmail;

  @override
  String toString() {
    return 'PaymentCheckoutRequest(subscriptionId: $subscriptionId, isInstallment: $isInstallment, currency: $currency, customerEmail: $customerEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCheckoutRequestImpl &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.isInstallment, isInstallment) ||
                other.isInstallment == isInstallment) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, subscriptionId, isInstallment, currency, customerEmail);

  /// Create a copy of PaymentCheckoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCheckoutRequestImplCopyWith<_$PaymentCheckoutRequestImpl>
      get copyWith => __$$PaymentCheckoutRequestImplCopyWithImpl<
          _$PaymentCheckoutRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentCheckoutRequestImplToJson(
      this,
    );
  }
}

abstract class _PaymentCheckoutRequest implements PaymentCheckoutRequest {
  const factory _PaymentCheckoutRequest(
      {required final int subscriptionId,
      required final bool isInstallment,
      required final String currency,
      required final String customerEmail}) = _$PaymentCheckoutRequestImpl;

  factory _PaymentCheckoutRequest.fromJson(Map<String, dynamic> json) =
      _$PaymentCheckoutRequestImpl.fromJson;

  @override
  int get subscriptionId;
  @override
  bool get isInstallment;
  @override
  String get currency;
  @override
  String get customerEmail;

  /// Create a copy of PaymentCheckoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentCheckoutRequestImplCopyWith<_$PaymentCheckoutRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
