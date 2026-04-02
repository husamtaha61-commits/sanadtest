// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_times_options_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeDataResponse _$TimeDataResponseFromJson(Map<String, dynamic> json) {
  return _TimeDataResponse.fromJson(json);
}

/// @nodoc
mixin _$TimeDataResponse {
  int? get dayId => throw _privateConstructorUsedError;
  int? get timeId => throw _privateConstructorUsedError;
  String? get timeValue => throw _privateConstructorUsedError;
  bool? get isReserved => throw _privateConstructorUsedError;
  String? get dateTime => throw _privateConstructorUsedError;

  /// Create a copy of TimeDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeDataResponseCopyWith<TimeDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeDataResponseCopyWith<$Res> {
  factory $TimeDataResponseCopyWith(
          TimeDataResponse value, $Res Function(TimeDataResponse) then) =
      _$TimeDataResponseCopyWithImpl<$Res, TimeDataResponse>;
  @useResult
  $Res call(
      {int? dayId,
      int? timeId,
      String? timeValue,
      bool? isReserved,
      String? dateTime});
}

/// @nodoc
class _$TimeDataResponseCopyWithImpl<$Res, $Val extends TimeDataResponse>
    implements $TimeDataResponseCopyWith<$Res> {
  _$TimeDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayId = freezed,
    Object? timeId = freezed,
    Object? timeValue = freezed,
    Object? isReserved = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      dayId: freezed == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeId: freezed == timeId
          ? _value.timeId
          : timeId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeValue: freezed == timeValue
          ? _value.timeValue
          : timeValue // ignore: cast_nullable_to_non_nullable
              as String?,
      isReserved: freezed == isReserved
          ? _value.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeDataResponseImplCopyWith<$Res>
    implements $TimeDataResponseCopyWith<$Res> {
  factory _$$TimeDataResponseImplCopyWith(_$TimeDataResponseImpl value,
          $Res Function(_$TimeDataResponseImpl) then) =
      __$$TimeDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? dayId,
      int? timeId,
      String? timeValue,
      bool? isReserved,
      String? dateTime});
}

/// @nodoc
class __$$TimeDataResponseImplCopyWithImpl<$Res>
    extends _$TimeDataResponseCopyWithImpl<$Res, _$TimeDataResponseImpl>
    implements _$$TimeDataResponseImplCopyWith<$Res> {
  __$$TimeDataResponseImplCopyWithImpl(_$TimeDataResponseImpl _value,
      $Res Function(_$TimeDataResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayId = freezed,
    Object? timeId = freezed,
    Object? timeValue = freezed,
    Object? isReserved = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_$TimeDataResponseImpl(
      dayId: freezed == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeId: freezed == timeId
          ? _value.timeId
          : timeId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeValue: freezed == timeValue
          ? _value.timeValue
          : timeValue // ignore: cast_nullable_to_non_nullable
              as String?,
      isReserved: freezed == isReserved
          ? _value.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$TimeDataResponseImpl implements _TimeDataResponse {
  const _$TimeDataResponseImpl(
      {required this.dayId,
      required this.timeId,
      required this.timeValue,
      required this.isReserved,
      this.dateTime});

  factory _$TimeDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeDataResponseImplFromJson(json);

  @override
  final int? dayId;
  @override
  final int? timeId;
  @override
  final String? timeValue;
  @override
  final bool? isReserved;
  @override
  final String? dateTime;

  @override
  String toString() {
    return 'TimeDataResponse(dayId: $dayId, timeId: $timeId, timeValue: $timeValue, isReserved: $isReserved, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeDataResponseImpl &&
            (identical(other.dayId, dayId) || other.dayId == dayId) &&
            (identical(other.timeId, timeId) || other.timeId == timeId) &&
            (identical(other.timeValue, timeValue) ||
                other.timeValue == timeValue) &&
            (identical(other.isReserved, isReserved) ||
                other.isReserved == isReserved) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dayId, timeId, timeValue, isReserved, dateTime);

  /// Create a copy of TimeDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeDataResponseImplCopyWith<_$TimeDataResponseImpl> get copyWith =>
      __$$TimeDataResponseImplCopyWithImpl<_$TimeDataResponseImpl>(
          this, _$identity);
}

abstract class _TimeDataResponse implements TimeDataResponse {
  const factory _TimeDataResponse(
      {required final int? dayId,
      required final int? timeId,
      required final String? timeValue,
      required final bool? isReserved,
      final String? dateTime}) = _$TimeDataResponseImpl;

  factory _TimeDataResponse.fromJson(Map<String, dynamic> json) =
      _$TimeDataResponseImpl.fromJson;

  @override
  int? get dayId;
  @override
  int? get timeId;
  @override
  String? get timeValue;
  @override
  bool? get isReserved;
  @override
  String? get dateTime;

  /// Create a copy of TimeDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeDataResponseImplCopyWith<_$TimeDataResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
