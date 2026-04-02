// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_time_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionTimeDate _$SessionTimeDateFromJson(Map<String, dynamic> json) {
  return _SessionTimeDate.fromJson(json);
}

/// @nodoc
mixin _$SessionTimeDate {
  int? get newDayId => throw _privateConstructorUsedError;
  int? get newTimeId => throw _privateConstructorUsedError;
  TimeData get timeDataResponse => throw _privateConstructorUsedError;

  /// Create a copy of SessionTimeDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionTimeDateCopyWith<SessionTimeDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionTimeDateCopyWith<$Res> {
  factory $SessionTimeDateCopyWith(
          SessionTimeDate value, $Res Function(SessionTimeDate) then) =
      _$SessionTimeDateCopyWithImpl<$Res, SessionTimeDate>;
  @useResult
  $Res call({int? newDayId, int? newTimeId, TimeData timeDataResponse});

  $TimeDataCopyWith<$Res> get timeDataResponse;
}

/// @nodoc
class _$SessionTimeDateCopyWithImpl<$Res, $Val extends SessionTimeDate>
    implements $SessionTimeDateCopyWith<$Res> {
  _$SessionTimeDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionTimeDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newDayId = freezed,
    Object? newTimeId = freezed,
    Object? timeDataResponse = null,
  }) {
    return _then(_value.copyWith(
      newDayId: freezed == newDayId
          ? _value.newDayId
          : newDayId // ignore: cast_nullable_to_non_nullable
              as int?,
      newTimeId: freezed == newTimeId
          ? _value.newTimeId
          : newTimeId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeDataResponse: null == timeDataResponse
          ? _value.timeDataResponse
          : timeDataResponse // ignore: cast_nullable_to_non_nullable
              as TimeData,
    ) as $Val);
  }

  /// Create a copy of SessionTimeDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeDataCopyWith<$Res> get timeDataResponse {
    return $TimeDataCopyWith<$Res>(_value.timeDataResponse, (value) {
      return _then(_value.copyWith(timeDataResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionTimeDateImplCopyWith<$Res>
    implements $SessionTimeDateCopyWith<$Res> {
  factory _$$SessionTimeDateImplCopyWith(_$SessionTimeDateImpl value,
          $Res Function(_$SessionTimeDateImpl) then) =
      __$$SessionTimeDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? newDayId, int? newTimeId, TimeData timeDataResponse});

  @override
  $TimeDataCopyWith<$Res> get timeDataResponse;
}

/// @nodoc
class __$$SessionTimeDateImplCopyWithImpl<$Res>
    extends _$SessionTimeDateCopyWithImpl<$Res, _$SessionTimeDateImpl>
    implements _$$SessionTimeDateImplCopyWith<$Res> {
  __$$SessionTimeDateImplCopyWithImpl(
      _$SessionTimeDateImpl _value, $Res Function(_$SessionTimeDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionTimeDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newDayId = freezed,
    Object? newTimeId = freezed,
    Object? timeDataResponse = null,
  }) {
    return _then(_$SessionTimeDateImpl(
      newDayId: freezed == newDayId
          ? _value.newDayId
          : newDayId // ignore: cast_nullable_to_non_nullable
              as int?,
      newTimeId: freezed == newTimeId
          ? _value.newTimeId
          : newTimeId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeDataResponse: null == timeDataResponse
          ? _value.timeDataResponse
          : timeDataResponse // ignore: cast_nullable_to_non_nullable
              as TimeData,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$SessionTimeDateImpl implements _SessionTimeDate {
  const _$SessionTimeDateImpl(
      {this.newDayId, this.newTimeId, required this.timeDataResponse});

  factory _$SessionTimeDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionTimeDateImplFromJson(json);

  @override
  final int? newDayId;
  @override
  final int? newTimeId;
  @override
  final TimeData timeDataResponse;

  @override
  String toString() {
    return 'SessionTimeDate(newDayId: $newDayId, newTimeId: $newTimeId, timeDataResponse: $timeDataResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionTimeDateImpl &&
            (identical(other.newDayId, newDayId) ||
                other.newDayId == newDayId) &&
            (identical(other.newTimeId, newTimeId) ||
                other.newTimeId == newTimeId) &&
            (identical(other.timeDataResponse, timeDataResponse) ||
                other.timeDataResponse == timeDataResponse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, newDayId, newTimeId, timeDataResponse);

  /// Create a copy of SessionTimeDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionTimeDateImplCopyWith<_$SessionTimeDateImpl> get copyWith =>
      __$$SessionTimeDateImplCopyWithImpl<_$SessionTimeDateImpl>(
          this, _$identity);
}

abstract class _SessionTimeDate implements SessionTimeDate {
  const factory _SessionTimeDate(
      {final int? newDayId,
      final int? newTimeId,
      required final TimeData timeDataResponse}) = _$SessionTimeDateImpl;

  factory _SessionTimeDate.fromJson(Map<String, dynamic> json) =
      _$SessionTimeDateImpl.fromJson;

  @override
  int? get newDayId;
  @override
  int? get newTimeId;
  @override
  TimeData get timeDataResponse;

  /// Create a copy of SessionTimeDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionTimeDateImplCopyWith<_$SessionTimeDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
