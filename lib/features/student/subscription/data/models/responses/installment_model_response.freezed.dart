// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'installment_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstallmentModel _$InstallmentModelFromJson(Map<String, dynamic> json) {
  return _InstallmentModel.fromJson(json);
}

/// @nodoc
mixin _$InstallmentModel {
  int get number => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool? get paid => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this InstallmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InstallmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstallmentModelCopyWith<InstallmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstallmentModelCopyWith<$Res> {
  factory $InstallmentModelCopyWith(
          InstallmentModel value, $Res Function(InstallmentModel) then) =
      _$InstallmentModelCopyWithImpl<$Res, InstallmentModel>;
  @useResult
  $Res call(
      {int number, @JsonKey(defaultValue: false) bool? paid, double amount});
}

/// @nodoc
class _$InstallmentModelCopyWithImpl<$Res, $Val extends InstallmentModel>
    implements $InstallmentModelCopyWith<$Res> {
  _$InstallmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstallmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? paid = freezed,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstallmentModelImplCopyWith<$Res>
    implements $InstallmentModelCopyWith<$Res> {
  factory _$$InstallmentModelImplCopyWith(_$InstallmentModelImpl value,
          $Res Function(_$InstallmentModelImpl) then) =
      __$$InstallmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int number, @JsonKey(defaultValue: false) bool? paid, double amount});
}

/// @nodoc
class __$$InstallmentModelImplCopyWithImpl<$Res>
    extends _$InstallmentModelCopyWithImpl<$Res, _$InstallmentModelImpl>
    implements _$$InstallmentModelImplCopyWith<$Res> {
  __$$InstallmentModelImplCopyWithImpl(_$InstallmentModelImpl _value,
      $Res Function(_$InstallmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstallmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? paid = freezed,
    Object? amount = null,
  }) {
    return _then(_$InstallmentModelImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstallmentModelImpl implements _InstallmentModel {
  const _$InstallmentModelImpl(
      {required this.number,
      @JsonKey(defaultValue: false) this.paid,
      required this.amount});

  factory _$InstallmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstallmentModelImplFromJson(json);

  @override
  final int number;
  @override
  @JsonKey(defaultValue: false)
  final bool? paid;
  @override
  final double amount;

  @override
  String toString() {
    return 'InstallmentModel(number: $number, paid: $paid, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstallmentModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, paid, amount);

  /// Create a copy of InstallmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstallmentModelImplCopyWith<_$InstallmentModelImpl> get copyWith =>
      __$$InstallmentModelImplCopyWithImpl<_$InstallmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstallmentModelImplToJson(
      this,
    );
  }
}

abstract class _InstallmentModel implements InstallmentModel {
  const factory _InstallmentModel(
      {required final int number,
      @JsonKey(defaultValue: false) final bool? paid,
      required final double amount}) = _$InstallmentModelImpl;

  factory _InstallmentModel.fromJson(Map<String, dynamic> json) =
      _$InstallmentModelImpl.fromJson;

  @override
  int get number;
  @override
  @JsonKey(defaultValue: false)
  bool? get paid;
  @override
  double get amount;

  /// Create a copy of InstallmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstallmentModelImplCopyWith<_$InstallmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
