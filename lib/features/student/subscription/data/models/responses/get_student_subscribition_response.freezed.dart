// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_student_subscribition_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) {
  return _SubscriptionModel.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionModel {
  int get id => throw _privateConstructorUsedError;
  String get program => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get recitation => throw _privateConstructorUsedError;
  List<RejectionReasonModel>? get rejectionReasons =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  SubscriptionStatus get status => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool? get paid => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool? get isInstallment => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 550.0)
  double? get programPrice => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <InstallmentModel>[])
  List<InstallmentModel>? get installments =>
      throw _privateConstructorUsedError;

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionModelCopyWith<SubscriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionModelCopyWith<$Res> {
  factory $SubscriptionModelCopyWith(
          SubscriptionModel value, $Res Function(SubscriptionModel) then) =
      _$SubscriptionModelCopyWithImpl<$Res, SubscriptionModel>;
  @useResult
  $Res call(
      {int id,
      String program,
      String createdAt,
      String? recitation,
      List<RejectionReasonModel>? rejectionReasons,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      SubscriptionStatus status,
      @JsonKey(defaultValue: false) bool? paid,
      @JsonKey(defaultValue: false) bool? isInstallment,
      @JsonKey(defaultValue: 550.0) double? programPrice,
      @JsonKey(defaultValue: <InstallmentModel>[])
      List<InstallmentModel>? installments});
}

/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res, $Val extends SubscriptionModel>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? program = null,
    Object? createdAt = null,
    Object? recitation = freezed,
    Object? rejectionReasons = freezed,
    Object? status = null,
    Object? paid = freezed,
    Object? isInstallment = freezed,
    Object? programPrice = freezed,
    Object? installments = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      program: null == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      recitation: freezed == recitation
          ? _value.recitation
          : recitation // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReasons: freezed == rejectionReasons
          ? _value.rejectionReasons
          : rejectionReasons // ignore: cast_nullable_to_non_nullable
              as List<RejectionReasonModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInstallment: freezed == isInstallment
          ? _value.isInstallment
          : isInstallment // ignore: cast_nullable_to_non_nullable
              as bool?,
      programPrice: freezed == programPrice
          ? _value.programPrice
          : programPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      installments: freezed == installments
          ? _value.installments
          : installments // ignore: cast_nullable_to_non_nullable
              as List<InstallmentModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionModelImplCopyWith<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  factory _$$SubscriptionModelImplCopyWith(_$SubscriptionModelImpl value,
          $Res Function(_$SubscriptionModelImpl) then) =
      __$$SubscriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String program,
      String createdAt,
      String? recitation,
      List<RejectionReasonModel>? rejectionReasons,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      SubscriptionStatus status,
      @JsonKey(defaultValue: false) bool? paid,
      @JsonKey(defaultValue: false) bool? isInstallment,
      @JsonKey(defaultValue: 550.0) double? programPrice,
      @JsonKey(defaultValue: <InstallmentModel>[])
      List<InstallmentModel>? installments});
}

/// @nodoc
class __$$SubscriptionModelImplCopyWithImpl<$Res>
    extends _$SubscriptionModelCopyWithImpl<$Res, _$SubscriptionModelImpl>
    implements _$$SubscriptionModelImplCopyWith<$Res> {
  __$$SubscriptionModelImplCopyWithImpl(_$SubscriptionModelImpl _value,
      $Res Function(_$SubscriptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? program = null,
    Object? createdAt = null,
    Object? recitation = freezed,
    Object? rejectionReasons = freezed,
    Object? status = null,
    Object? paid = freezed,
    Object? isInstallment = freezed,
    Object? programPrice = freezed,
    Object? installments = freezed,
  }) {
    return _then(_$SubscriptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      program: null == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      recitation: freezed == recitation
          ? _value.recitation
          : recitation // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReasons: freezed == rejectionReasons
          ? _value._rejectionReasons
          : rejectionReasons // ignore: cast_nullable_to_non_nullable
              as List<RejectionReasonModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInstallment: freezed == isInstallment
          ? _value.isInstallment
          : isInstallment // ignore: cast_nullable_to_non_nullable
              as bool?,
      programPrice: freezed == programPrice
          ? _value.programPrice
          : programPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      installments: freezed == installments
          ? _value._installments
          : installments // ignore: cast_nullable_to_non_nullable
              as List<InstallmentModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionModelImpl implements _SubscriptionModel {
  const _$SubscriptionModelImpl(
      {required this.id,
      required this.program,
      required this.createdAt,
      this.recitation,
      final List<RejectionReasonModel>? rejectionReasons,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      required this.status,
      @JsonKey(defaultValue: false) this.paid,
      @JsonKey(defaultValue: false) this.isInstallment,
      @JsonKey(defaultValue: 550.0) this.programPrice,
      @JsonKey(defaultValue: <InstallmentModel>[])
      final List<InstallmentModel>? installments})
      : _rejectionReasons = rejectionReasons,
        _installments = installments;

  factory _$SubscriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String program;
  @override
  final String createdAt;
  @override
  final String? recitation;
  final List<RejectionReasonModel>? _rejectionReasons;
  @override
  List<RejectionReasonModel>? get rejectionReasons {
    final value = _rejectionReasons;
    if (value == null) return null;
    if (_rejectionReasons is EqualUnmodifiableListView)
      return _rejectionReasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  final SubscriptionStatus status;
  @override
  @JsonKey(defaultValue: false)
  final bool? paid;
  @override
  @JsonKey(defaultValue: false)
  final bool? isInstallment;
  @override
  @JsonKey(defaultValue: 550.0)
  final double? programPrice;
  final List<InstallmentModel>? _installments;
  @override
  @JsonKey(defaultValue: <InstallmentModel>[])
  List<InstallmentModel>? get installments {
    final value = _installments;
    if (value == null) return null;
    if (_installments is EqualUnmodifiableListView) return _installments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubscriptionModel(id: $id, program: $program, createdAt: $createdAt, recitation: $recitation, rejectionReasons: $rejectionReasons, status: $status, paid: $paid, isInstallment: $isInstallment, programPrice: $programPrice, installments: $installments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.program, program) || other.program == program) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.recitation, recitation) ||
                other.recitation == recitation) &&
            const DeepCollectionEquality()
                .equals(other._rejectionReasons, _rejectionReasons) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.isInstallment, isInstallment) ||
                other.isInstallment == isInstallment) &&
            (identical(other.programPrice, programPrice) ||
                other.programPrice == programPrice) &&
            const DeepCollectionEquality()
                .equals(other._installments, _installments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      program,
      createdAt,
      recitation,
      const DeepCollectionEquality().hash(_rejectionReasons),
      status,
      paid,
      isInstallment,
      programPrice,
      const DeepCollectionEquality().hash(_installments));

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionModelImplCopyWith<_$SubscriptionModelImpl> get copyWith =>
      __$$SubscriptionModelImplCopyWithImpl<_$SubscriptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionModelImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionModel implements SubscriptionModel {
  const factory _SubscriptionModel(
      {required final int id,
      required final String program,
      required final String createdAt,
      final String? recitation,
      final List<RejectionReasonModel>? rejectionReasons,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      required final SubscriptionStatus status,
      @JsonKey(defaultValue: false) final bool? paid,
      @JsonKey(defaultValue: false) final bool? isInstallment,
      @JsonKey(defaultValue: 550.0) final double? programPrice,
      @JsonKey(defaultValue: <InstallmentModel>[])
      final List<InstallmentModel>? installments}) = _$SubscriptionModelImpl;

  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) =
      _$SubscriptionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get program;
  @override
  String get createdAt;
  @override
  String? get recitation;
  @override
  List<RejectionReasonModel>? get rejectionReasons;
  @override
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  SubscriptionStatus get status;
  @override
  @JsonKey(defaultValue: false)
  bool? get paid;
  @override
  @JsonKey(defaultValue: false)
  bool? get isInstallment;
  @override
  @JsonKey(defaultValue: 550.0)
  double? get programPrice;
  @override
  @JsonKey(defaultValue: <InstallmentModel>[])
  List<InstallmentModel>? get installments;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionModelImplCopyWith<_$SubscriptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RejectionReasonModel _$RejectionReasonModelFromJson(Map<String, dynamic> json) {
  return _RejectionReasonModel.fromJson(json);
}

/// @nodoc
mixin _$RejectionReasonModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "rejectionReason")
  String get rejectionReason => throw _privateConstructorUsedError;
  @JsonKey(name: "reasonDetail")
  String? get reasonDetail => throw _privateConstructorUsedError;

  /// Serializes this RejectionReasonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RejectionReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RejectionReasonModelCopyWith<RejectionReasonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectionReasonModelCopyWith<$Res> {
  factory $RejectionReasonModelCopyWith(RejectionReasonModel value,
          $Res Function(RejectionReasonModel) then) =
      _$RejectionReasonModelCopyWithImpl<$Res, RejectionReasonModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "rejectionReason") String rejectionReason,
      @JsonKey(name: "reasonDetail") String? reasonDetail});
}

/// @nodoc
class _$RejectionReasonModelCopyWithImpl<$Res,
        $Val extends RejectionReasonModel>
    implements $RejectionReasonModelCopyWith<$Res> {
  _$RejectionReasonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RejectionReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rejectionReason = null,
    Object? reasonDetail = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rejectionReason: null == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String,
      reasonDetail: freezed == reasonDetail
          ? _value.reasonDetail
          : reasonDetail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RejectionReasonModelImplCopyWith<$Res>
    implements $RejectionReasonModelCopyWith<$Res> {
  factory _$$RejectionReasonModelImplCopyWith(_$RejectionReasonModelImpl value,
          $Res Function(_$RejectionReasonModelImpl) then) =
      __$$RejectionReasonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "rejectionReason") String rejectionReason,
      @JsonKey(name: "reasonDetail") String? reasonDetail});
}

/// @nodoc
class __$$RejectionReasonModelImplCopyWithImpl<$Res>
    extends _$RejectionReasonModelCopyWithImpl<$Res, _$RejectionReasonModelImpl>
    implements _$$RejectionReasonModelImplCopyWith<$Res> {
  __$$RejectionReasonModelImplCopyWithImpl(_$RejectionReasonModelImpl _value,
      $Res Function(_$RejectionReasonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RejectionReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rejectionReason = null,
    Object? reasonDetail = freezed,
  }) {
    return _then(_$RejectionReasonModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rejectionReason: null == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String,
      reasonDetail: freezed == reasonDetail
          ? _value.reasonDetail
          : reasonDetail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RejectionReasonModelImpl implements _RejectionReasonModel {
  const _$RejectionReasonModelImpl(
      {required this.id,
      @JsonKey(name: "rejectionReason") required this.rejectionReason,
      @JsonKey(name: "reasonDetail") this.reasonDetail});

  factory _$RejectionReasonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RejectionReasonModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "rejectionReason")
  final String rejectionReason;
  @override
  @JsonKey(name: "reasonDetail")
  final String? reasonDetail;

  @override
  String toString() {
    return 'RejectionReasonModel(id: $id, rejectionReason: $rejectionReason, reasonDetail: $reasonDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectionReasonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.reasonDetail, reasonDetail) ||
                other.reasonDetail == reasonDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, rejectionReason, reasonDetail);

  /// Create a copy of RejectionReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectionReasonModelImplCopyWith<_$RejectionReasonModelImpl>
      get copyWith =>
          __$$RejectionReasonModelImplCopyWithImpl<_$RejectionReasonModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RejectionReasonModelImplToJson(
      this,
    );
  }
}

abstract class _RejectionReasonModel implements RejectionReasonModel {
  const factory _RejectionReasonModel(
      {required final int id,
      @JsonKey(name: "rejectionReason") required final String rejectionReason,
      @JsonKey(name: "reasonDetail")
      final String? reasonDetail}) = _$RejectionReasonModelImpl;

  factory _RejectionReasonModel.fromJson(Map<String, dynamic> json) =
      _$RejectionReasonModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "rejectionReason")
  String get rejectionReason;
  @override
  @JsonKey(name: "reasonDetail")
  String? get reasonDetail;

  /// Create a copy of RejectionReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectionReasonModelImplCopyWith<_$RejectionReasonModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
