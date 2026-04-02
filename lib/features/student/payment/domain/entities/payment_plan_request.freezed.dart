// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_plan_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentPlan _$PaymentPlanFromJson(Map<String, dynamic> json) {
  return _PaymentPlan.fromJson(json);
}

/// @nodoc
mixin _$PaymentPlan {
  PaymentPlanType get type => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<InstallmentModel>? get installments =>
      throw _privateConstructorUsedError;

  /// Serializes this PaymentPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentPlanCopyWith<PaymentPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentPlanCopyWith<$Res> {
  factory $PaymentPlanCopyWith(
          PaymentPlan value, $Res Function(PaymentPlan) then) =
      _$PaymentPlanCopyWithImpl<$Res, PaymentPlan>;
  @useResult
  $Res call(
      {PaymentPlanType type,
      double price,
      List<InstallmentModel>? installments});
}

/// @nodoc
class _$PaymentPlanCopyWithImpl<$Res, $Val extends PaymentPlan>
    implements $PaymentPlanCopyWith<$Res> {
  _$PaymentPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? price = null,
    Object? installments = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentPlanType,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      installments: freezed == installments
          ? _value.installments
          : installments // ignore: cast_nullable_to_non_nullable
              as List<InstallmentModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentPlanImplCopyWith<$Res>
    implements $PaymentPlanCopyWith<$Res> {
  factory _$$PaymentPlanImplCopyWith(
          _$PaymentPlanImpl value, $Res Function(_$PaymentPlanImpl) then) =
      __$$PaymentPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentPlanType type,
      double price,
      List<InstallmentModel>? installments});
}

/// @nodoc
class __$$PaymentPlanImplCopyWithImpl<$Res>
    extends _$PaymentPlanCopyWithImpl<$Res, _$PaymentPlanImpl>
    implements _$$PaymentPlanImplCopyWith<$Res> {
  __$$PaymentPlanImplCopyWithImpl(
      _$PaymentPlanImpl _value, $Res Function(_$PaymentPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? price = null,
    Object? installments = freezed,
  }) {
    return _then(_$PaymentPlanImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentPlanType,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      installments: freezed == installments
          ? _value._installments
          : installments // ignore: cast_nullable_to_non_nullable
              as List<InstallmentModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentPlanImpl implements _PaymentPlan {
  const _$PaymentPlanImpl(
      {required this.type,
      required this.price,
      final List<InstallmentModel>? installments})
      : _installments = installments;

  factory _$PaymentPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentPlanImplFromJson(json);

  @override
  final PaymentPlanType type;
  @override
  final double price;
  final List<InstallmentModel>? _installments;
  @override
  List<InstallmentModel>? get installments {
    final value = _installments;
    if (value == null) return null;
    if (_installments is EqualUnmodifiableListView) return _installments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaymentPlan(type: $type, price: $price, installments: $installments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentPlanImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._installments, _installments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, price,
      const DeepCollectionEquality().hash(_installments));

  /// Create a copy of PaymentPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentPlanImplCopyWith<_$PaymentPlanImpl> get copyWith =>
      __$$PaymentPlanImplCopyWithImpl<_$PaymentPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentPlanImplToJson(
      this,
    );
  }
}

abstract class _PaymentPlan implements PaymentPlan {
  const factory _PaymentPlan(
      {required final PaymentPlanType type,
      required final double price,
      final List<InstallmentModel>? installments}) = _$PaymentPlanImpl;

  factory _PaymentPlan.fromJson(Map<String, dynamic> json) =
      _$PaymentPlanImpl.fromJson;

  @override
  PaymentPlanType get type;
  @override
  double get price;
  @override
  List<InstallmentModel>? get installments;

  /// Create a copy of PaymentPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentPlanImplCopyWith<_$PaymentPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
