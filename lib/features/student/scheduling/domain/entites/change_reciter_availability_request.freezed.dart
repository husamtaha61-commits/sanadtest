// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_reciter_availability_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChangeReciterAvailabilityRequest {
  int get dayId => throw _privateConstructorUsedError;
  List<int> get hoursIds => throw _privateConstructorUsedError;

  /// Serializes this ChangeReciterAvailabilityRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangeReciterAvailabilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangeReciterAvailabilityRequestCopyWith<ChangeReciterAvailabilityRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeReciterAvailabilityRequestCopyWith<$Res> {
  factory $ChangeReciterAvailabilityRequestCopyWith(
          ChangeReciterAvailabilityRequest value,
          $Res Function(ChangeReciterAvailabilityRequest) then) =
      _$ChangeReciterAvailabilityRequestCopyWithImpl<$Res,
          ChangeReciterAvailabilityRequest>;
  @useResult
  $Res call({int dayId, List<int> hoursIds});
}

/// @nodoc
class _$ChangeReciterAvailabilityRequestCopyWithImpl<$Res,
        $Val extends ChangeReciterAvailabilityRequest>
    implements $ChangeReciterAvailabilityRequestCopyWith<$Res> {
  _$ChangeReciterAvailabilityRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangeReciterAvailabilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayId = null,
    Object? hoursIds = null,
  }) {
    return _then(_value.copyWith(
      dayId: null == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as int,
      hoursIds: null == hoursIds
          ? _value.hoursIds
          : hoursIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeReciterAvailabilityRequestImplCopyWith<$Res>
    implements $ChangeReciterAvailabilityRequestCopyWith<$Res> {
  factory _$$ChangeReciterAvailabilityRequestImplCopyWith(
          _$ChangeReciterAvailabilityRequestImpl value,
          $Res Function(_$ChangeReciterAvailabilityRequestImpl) then) =
      __$$ChangeReciterAvailabilityRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int dayId, List<int> hoursIds});
}

/// @nodoc
class __$$ChangeReciterAvailabilityRequestImplCopyWithImpl<$Res>
    extends _$ChangeReciterAvailabilityRequestCopyWithImpl<$Res,
        _$ChangeReciterAvailabilityRequestImpl>
    implements _$$ChangeReciterAvailabilityRequestImplCopyWith<$Res> {
  __$$ChangeReciterAvailabilityRequestImplCopyWithImpl(
      _$ChangeReciterAvailabilityRequestImpl _value,
      $Res Function(_$ChangeReciterAvailabilityRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangeReciterAvailabilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayId = null,
    Object? hoursIds = null,
  }) {
    return _then(_$ChangeReciterAvailabilityRequestImpl(
      dayId: null == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as int,
      hoursIds: null == hoursIds
          ? _value._hoursIds
          : hoursIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ChangeReciterAvailabilityRequestImpl
    implements _ChangeReciterAvailabilityRequest {
  const _$ChangeReciterAvailabilityRequestImpl(
      {required this.dayId, required final List<int> hoursIds})
      : _hoursIds = hoursIds;

  @override
  final int dayId;
  final List<int> _hoursIds;
  @override
  List<int> get hoursIds {
    if (_hoursIds is EqualUnmodifiableListView) return _hoursIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hoursIds);
  }

  @override
  String toString() {
    return 'ChangeReciterAvailabilityRequest(dayId: $dayId, hoursIds: $hoursIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeReciterAvailabilityRequestImpl &&
            (identical(other.dayId, dayId) || other.dayId == dayId) &&
            const DeepCollectionEquality().equals(other._hoursIds, _hoursIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, dayId, const DeepCollectionEquality().hash(_hoursIds));

  /// Create a copy of ChangeReciterAvailabilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeReciterAvailabilityRequestImplCopyWith<
          _$ChangeReciterAvailabilityRequestImpl>
      get copyWith => __$$ChangeReciterAvailabilityRequestImplCopyWithImpl<
          _$ChangeReciterAvailabilityRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangeReciterAvailabilityRequestImplToJson(
      this,
    );
  }
}

abstract class _ChangeReciterAvailabilityRequest
    implements ChangeReciterAvailabilityRequest {
  const factory _ChangeReciterAvailabilityRequest(
          {required final int dayId, required final List<int> hoursIds}) =
      _$ChangeReciterAvailabilityRequestImpl;

  @override
  int get dayId;
  @override
  List<int> get hoursIds;

  /// Create a copy of ChangeReciterAvailabilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeReciterAvailabilityRequestImplCopyWith<
          _$ChangeReciterAvailabilityRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
