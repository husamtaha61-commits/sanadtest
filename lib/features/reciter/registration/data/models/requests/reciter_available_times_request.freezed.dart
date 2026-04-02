// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter_available_times_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReciterAvailableTimesRequest {
  int get dayId => throw _privateConstructorUsedError;
  List<int> get hoursIds => throw _privateConstructorUsedError;

  /// Create a copy of ReciterAvailableTimesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterAvailableTimesRequestCopyWith<ReciterAvailableTimesRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterAvailableTimesRequestCopyWith<$Res> {
  factory $ReciterAvailableTimesRequestCopyWith(
          ReciterAvailableTimesRequest value,
          $Res Function(ReciterAvailableTimesRequest) then) =
      _$ReciterAvailableTimesRequestCopyWithImpl<$Res,
          ReciterAvailableTimesRequest>;
  @useResult
  $Res call({int dayId, List<int> hoursIds});
}

/// @nodoc
class _$ReciterAvailableTimesRequestCopyWithImpl<$Res,
        $Val extends ReciterAvailableTimesRequest>
    implements $ReciterAvailableTimesRequestCopyWith<$Res> {
  _$ReciterAvailableTimesRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReciterAvailableTimesRequest
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
abstract class _$$ReciterAvailableTimesRequestImplCopyWith<$Res>
    implements $ReciterAvailableTimesRequestCopyWith<$Res> {
  factory _$$ReciterAvailableTimesRequestImplCopyWith(
          _$ReciterAvailableTimesRequestImpl value,
          $Res Function(_$ReciterAvailableTimesRequestImpl) then) =
      __$$ReciterAvailableTimesRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int dayId, List<int> hoursIds});
}

/// @nodoc
class __$$ReciterAvailableTimesRequestImplCopyWithImpl<$Res>
    extends _$ReciterAvailableTimesRequestCopyWithImpl<$Res,
        _$ReciterAvailableTimesRequestImpl>
    implements _$$ReciterAvailableTimesRequestImplCopyWith<$Res> {
  __$$ReciterAvailableTimesRequestImplCopyWithImpl(
      _$ReciterAvailableTimesRequestImpl _value,
      $Res Function(_$ReciterAvailableTimesRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReciterAvailableTimesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayId = null,
    Object? hoursIds = null,
  }) {
    return _then(_$ReciterAvailableTimesRequestImpl(
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

class _$ReciterAvailableTimesRequestImpl
    implements _ReciterAvailableTimesRequest {
  const _$ReciterAvailableTimesRequestImpl(
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
    return 'ReciterAvailableTimesRequest(dayId: $dayId, hoursIds: $hoursIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterAvailableTimesRequestImpl &&
            (identical(other.dayId, dayId) || other.dayId == dayId) &&
            const DeepCollectionEquality().equals(other._hoursIds, _hoursIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, dayId, const DeepCollectionEquality().hash(_hoursIds));

  /// Create a copy of ReciterAvailableTimesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterAvailableTimesRequestImplCopyWith<
          _$ReciterAvailableTimesRequestImpl>
      get copyWith => __$$ReciterAvailableTimesRequestImplCopyWithImpl<
          _$ReciterAvailableTimesRequestImpl>(this, _$identity);
}

abstract class _ReciterAvailableTimesRequest
    implements ReciterAvailableTimesRequest {
  const factory _ReciterAvailableTimesRequest(
      {required final int dayId,
      required final List<int> hoursIds}) = _$ReciterAvailableTimesRequestImpl;

  @override
  int get dayId;
  @override
  List<int> get hoursIds;

  /// Create a copy of ReciterAvailableTimesRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterAvailableTimesRequestImplCopyWith<
          _$ReciterAvailableTimesRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
