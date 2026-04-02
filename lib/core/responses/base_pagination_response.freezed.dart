// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_pagination_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BasePaginationResponse<T> _$BasePaginationResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _BasePaginationResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$BasePaginationResponse<T> {
  List<T> get data => throw _privateConstructorUsedError;
  int get totalRecords => throw _privateConstructorUsedError;
  int get totalDisplayRecords => throw _privateConstructorUsedError;

  /// Create a copy of BasePaginationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasePaginationResponseCopyWith<T, BasePaginationResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasePaginationResponseCopyWith<T, $Res> {
  factory $BasePaginationResponseCopyWith(BasePaginationResponse<T> value,
          $Res Function(BasePaginationResponse<T>) then) =
      _$BasePaginationResponseCopyWithImpl<T, $Res, BasePaginationResponse<T>>;
  @useResult
  $Res call({List<T> data, int totalRecords, int totalDisplayRecords});
}

/// @nodoc
class _$BasePaginationResponseCopyWithImpl<T, $Res,
        $Val extends BasePaginationResponse<T>>
    implements $BasePaginationResponseCopyWith<T, $Res> {
  _$BasePaginationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasePaginationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? totalRecords = null,
    Object? totalDisplayRecords = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      totalDisplayRecords: null == totalDisplayRecords
          ? _value.totalDisplayRecords
          : totalDisplayRecords // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasePaginationResponseImplCopyWith<T, $Res>
    implements $BasePaginationResponseCopyWith<T, $Res> {
  factory _$$BasePaginationResponseImplCopyWith(
          _$BasePaginationResponseImpl<T> value,
          $Res Function(_$BasePaginationResponseImpl<T>) then) =
      __$$BasePaginationResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> data, int totalRecords, int totalDisplayRecords});
}

/// @nodoc
class __$$BasePaginationResponseImplCopyWithImpl<T, $Res>
    extends _$BasePaginationResponseCopyWithImpl<T, $Res,
        _$BasePaginationResponseImpl<T>>
    implements _$$BasePaginationResponseImplCopyWith<T, $Res> {
  __$$BasePaginationResponseImplCopyWithImpl(
      _$BasePaginationResponseImpl<T> _value,
      $Res Function(_$BasePaginationResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of BasePaginationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? totalRecords = null,
    Object? totalDisplayRecords = null,
  }) {
    return _then(_$BasePaginationResponseImpl<T>(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      totalDisplayRecords: null == totalDisplayRecords
          ? _value.totalDisplayRecords
          : totalDisplayRecords // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class _$BasePaginationResponseImpl<T> implements _BasePaginationResponse<T> {
  const _$BasePaginationResponseImpl(
      {final List<T> data = const [],
      this.totalRecords = 0,
      this.totalDisplayRecords = 0})
      : _data = data;

  factory _$BasePaginationResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BasePaginationResponseImplFromJson(json, fromJsonT);

  final List<T> _data;
  @override
  @JsonKey()
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final int totalRecords;
  @override
  @JsonKey()
  final int totalDisplayRecords;

  @override
  String toString() {
    return 'BasePaginationResponse<$T>(data: $data, totalRecords: $totalRecords, totalDisplayRecords: $totalDisplayRecords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasePaginationResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.totalDisplayRecords, totalDisplayRecords) ||
                other.totalDisplayRecords == totalDisplayRecords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      totalRecords,
      totalDisplayRecords);

  /// Create a copy of BasePaginationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasePaginationResponseImplCopyWith<T, _$BasePaginationResponseImpl<T>>
      get copyWith => __$$BasePaginationResponseImplCopyWithImpl<T,
          _$BasePaginationResponseImpl<T>>(this, _$identity);
}

abstract class _BasePaginationResponse<T> implements BasePaginationResponse<T> {
  const factory _BasePaginationResponse(
      {final List<T> data,
      final int totalRecords,
      final int totalDisplayRecords}) = _$BasePaginationResponseImpl<T>;

  factory _BasePaginationResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BasePaginationResponseImpl<T>.fromJson;

  @override
  List<T> get data;
  @override
  int get totalRecords;
  @override
  int get totalDisplayRecords;

  /// Create a copy of BasePaginationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasePaginationResponseImplCopyWith<T, _$BasePaginationResponseImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
