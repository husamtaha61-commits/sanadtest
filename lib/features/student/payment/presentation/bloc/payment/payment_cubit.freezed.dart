// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<PaymentPlan> get plans => throw _privateConstructorUsedError;
  PaymentPlan? get selectedPlan => throw _privateConstructorUsedError;
  String? get paymentUrl => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isProcessingPayment => throw _privateConstructorUsedError;
  PaymentCheckoutResponse? get checkoutResponse =>
      throw _privateConstructorUsedError;
  bool get isPaymentSuccessful => throw _privateConstructorUsedError;
  bool? get isPaid => throw _privateConstructorUsedError;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentStateCopyWith<PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<PaymentPlan> plans,
      PaymentPlan? selectedPlan,
      String? paymentUrl,
      String? errorMessage,
      bool isProcessingPayment,
      PaymentCheckoutResponse? checkoutResponse,
      bool isPaymentSuccessful,
      bool? isPaid});

  $BaseStatusCopyWith<dynamic, $Res> get status;
  $PaymentPlanCopyWith<$Res>? get selectedPlan;
  $PaymentCheckoutResponseCopyWith<$Res>? get checkoutResponse;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? plans = null,
    Object? selectedPlan = freezed,
    Object? paymentUrl = freezed,
    Object? errorMessage = freezed,
    Object? isProcessingPayment = null,
    Object? checkoutResponse = freezed,
    Object? isPaymentSuccessful = null,
    Object? isPaid = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      plans: null == plans
          ? _value.plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<PaymentPlan>,
      selectedPlan: freezed == selectedPlan
          ? _value.selectedPlan
          : selectedPlan // ignore: cast_nullable_to_non_nullable
              as PaymentPlan?,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isProcessingPayment: null == isProcessingPayment
          ? _value.isProcessingPayment
          : isProcessingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      checkoutResponse: freezed == checkoutResponse
          ? _value.checkoutResponse
          : checkoutResponse // ignore: cast_nullable_to_non_nullable
              as PaymentCheckoutResponse?,
      isPaymentSuccessful: null == isPaymentSuccessful
          ? _value.isPaymentSuccessful
          : isPaymentSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get status {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentPlanCopyWith<$Res>? get selectedPlan {
    if (_value.selectedPlan == null) {
      return null;
    }

    return $PaymentPlanCopyWith<$Res>(_value.selectedPlan!, (value) {
      return _then(_value.copyWith(selectedPlan: value) as $Val);
    });
  }

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentCheckoutResponseCopyWith<$Res>? get checkoutResponse {
    if (_value.checkoutResponse == null) {
      return null;
    }

    return $PaymentCheckoutResponseCopyWith<$Res>(_value.checkoutResponse!,
        (value) {
      return _then(_value.copyWith(checkoutResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentStateImplCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory _$$PaymentStateImplCopyWith(
          _$PaymentStateImpl value, $Res Function(_$PaymentStateImpl) then) =
      __$$PaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<PaymentPlan> plans,
      PaymentPlan? selectedPlan,
      String? paymentUrl,
      String? errorMessage,
      bool isProcessingPayment,
      PaymentCheckoutResponse? checkoutResponse,
      bool isPaymentSuccessful,
      bool? isPaid});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
  @override
  $PaymentPlanCopyWith<$Res>? get selectedPlan;
  @override
  $PaymentCheckoutResponseCopyWith<$Res>? get checkoutResponse;
}

/// @nodoc
class __$$PaymentStateImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentStateImpl>
    implements _$$PaymentStateImplCopyWith<$Res> {
  __$$PaymentStateImplCopyWithImpl(
      _$PaymentStateImpl _value, $Res Function(_$PaymentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? plans = null,
    Object? selectedPlan = freezed,
    Object? paymentUrl = freezed,
    Object? errorMessage = freezed,
    Object? isProcessingPayment = null,
    Object? checkoutResponse = freezed,
    Object? isPaymentSuccessful = null,
    Object? isPaid = freezed,
  }) {
    return _then(_$PaymentStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      plans: null == plans
          ? _value._plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<PaymentPlan>,
      selectedPlan: freezed == selectedPlan
          ? _value.selectedPlan
          : selectedPlan // ignore: cast_nullable_to_non_nullable
              as PaymentPlan?,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isProcessingPayment: null == isProcessingPayment
          ? _value.isProcessingPayment
          : isProcessingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      checkoutResponse: freezed == checkoutResponse
          ? _value.checkoutResponse
          : checkoutResponse // ignore: cast_nullable_to_non_nullable
              as PaymentCheckoutResponse?,
      isPaymentSuccessful: null == isPaymentSuccessful
          ? _value.isPaymentSuccessful
          : isPaymentSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$PaymentStateImpl implements _PaymentState {
  const _$PaymentStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<PaymentPlan> plans = const [],
      this.selectedPlan,
      this.paymentUrl,
      this.errorMessage,
      this.isProcessingPayment = false,
      this.checkoutResponse,
      this.isPaymentSuccessful = false,
      this.isPaid})
      : _plans = plans;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<PaymentPlan> _plans;
  @override
  @JsonKey()
  List<PaymentPlan> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  @override
  final PaymentPlan? selectedPlan;
  @override
  final String? paymentUrl;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isProcessingPayment;
  @override
  final PaymentCheckoutResponse? checkoutResponse;
  @override
  @JsonKey()
  final bool isPaymentSuccessful;
  @override
  final bool? isPaid;

  @override
  String toString() {
    return 'PaymentState(status: $status, plans: $plans, selectedPlan: $selectedPlan, paymentUrl: $paymentUrl, errorMessage: $errorMessage, isProcessingPayment: $isProcessingPayment, checkoutResponse: $checkoutResponse, isPaymentSuccessful: $isPaymentSuccessful, isPaid: $isPaid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._plans, _plans) &&
            (identical(other.selectedPlan, selectedPlan) ||
                other.selectedPlan == selectedPlan) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isProcessingPayment, isProcessingPayment) ||
                other.isProcessingPayment == isProcessingPayment) &&
            (identical(other.checkoutResponse, checkoutResponse) ||
                other.checkoutResponse == checkoutResponse) &&
            (identical(other.isPaymentSuccessful, isPaymentSuccessful) ||
                other.isPaymentSuccessful == isPaymentSuccessful) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_plans),
      selectedPlan,
      paymentUrl,
      errorMessage,
      isProcessingPayment,
      checkoutResponse,
      isPaymentSuccessful,
      isPaid);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentStateImplCopyWith<_$PaymentStateImpl> get copyWith =>
      __$$PaymentStateImplCopyWithImpl<_$PaymentStateImpl>(this, _$identity);
}

abstract class _PaymentState implements PaymentState {
  const factory _PaymentState(
      {final BaseStatus<dynamic> status,
      final List<PaymentPlan> plans,
      final PaymentPlan? selectedPlan,
      final String? paymentUrl,
      final String? errorMessage,
      final bool isProcessingPayment,
      final PaymentCheckoutResponse? checkoutResponse,
      final bool isPaymentSuccessful,
      final bool? isPaid}) = _$PaymentStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<PaymentPlan> get plans;
  @override
  PaymentPlan? get selectedPlan;
  @override
  String? get paymentUrl;
  @override
  String? get errorMessage;
  @override
  bool get isProcessingPayment;
  @override
  PaymentCheckoutResponse? get checkoutResponse;
  @override
  bool get isPaymentSuccessful;
  @override
  bool? get isPaid;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentStateImplCopyWith<_$PaymentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
