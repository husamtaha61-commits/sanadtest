// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_field_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseFieldResponse _$BaseFieldResponseFromJson(Map<String, dynamic> json) {
  return _BaseFieldResponse.fromJson(json);
}

/// @nodoc
mixin _$BaseFieldResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this BaseFieldResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaseFieldResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseFieldResponseCopyWith<BaseFieldResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseFieldResponseCopyWith<$Res> {
  factory $BaseFieldResponseCopyWith(
          BaseFieldResponse value, $Res Function(BaseFieldResponse) then) =
      _$BaseFieldResponseCopyWithImpl<$Res, BaseFieldResponse>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$BaseFieldResponseCopyWithImpl<$Res, $Val extends BaseFieldResponse>
    implements $BaseFieldResponseCopyWith<$Res> {
  _$BaseFieldResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseFieldResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseFieldResponseImplCopyWith<$Res>
    implements $BaseFieldResponseCopyWith<$Res> {
  factory _$$BaseFieldResponseImplCopyWith(_$BaseFieldResponseImpl value,
          $Res Function(_$BaseFieldResponseImpl) then) =
      __$$BaseFieldResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$BaseFieldResponseImplCopyWithImpl<$Res>
    extends _$BaseFieldResponseCopyWithImpl<$Res, _$BaseFieldResponseImpl>
    implements _$$BaseFieldResponseImplCopyWith<$Res> {
  __$$BaseFieldResponseImplCopyWithImpl(_$BaseFieldResponseImpl _value,
      $Res Function(_$BaseFieldResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaseFieldResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$BaseFieldResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseFieldResponseImpl implements _BaseFieldResponse {
  const _$BaseFieldResponseImpl({this.id, this.name});

  factory _$BaseFieldResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseFieldResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'BaseFieldResponse(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseFieldResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of BaseFieldResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseFieldResponseImplCopyWith<_$BaseFieldResponseImpl> get copyWith =>
      __$$BaseFieldResponseImplCopyWithImpl<_$BaseFieldResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseFieldResponseImplToJson(
      this,
    );
  }
}

abstract class _BaseFieldResponse implements BaseFieldResponse {
  const factory _BaseFieldResponse({final int? id, final String? name}) =
      _$BaseFieldResponseImpl;

  factory _BaseFieldResponse.fromJson(Map<String, dynamic> json) =
      _$BaseFieldResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of BaseFieldResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseFieldResponseImplCopyWith<_$BaseFieldResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
