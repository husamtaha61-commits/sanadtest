// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_student_subscribition_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentSubscriptionDataModel _$StudentSubscriptionDataModelFromJson(
    Map<String, dynamic> json) {
  return _StudentSubscriptionDataModel.fromJson(json);
}

/// @nodoc
mixin _$StudentSubscriptionDataModel {
  String get token => throw _privateConstructorUsedError;
  String get whatsAppUrl => throw _privateConstructorUsedError;

  /// Serializes this StudentSubscriptionDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentSubscriptionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentSubscriptionDataModelCopyWith<StudentSubscriptionDataModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentSubscriptionDataModelCopyWith<$Res> {
  factory $StudentSubscriptionDataModelCopyWith(
          StudentSubscriptionDataModel value,
          $Res Function(StudentSubscriptionDataModel) then) =
      _$StudentSubscriptionDataModelCopyWithImpl<$Res,
          StudentSubscriptionDataModel>;
  @useResult
  $Res call({String token, String whatsAppUrl});
}

/// @nodoc
class _$StudentSubscriptionDataModelCopyWithImpl<$Res,
        $Val extends StudentSubscriptionDataModel>
    implements $StudentSubscriptionDataModelCopyWith<$Res> {
  _$StudentSubscriptionDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentSubscriptionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? whatsAppUrl = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      whatsAppUrl: null == whatsAppUrl
          ? _value.whatsAppUrl
          : whatsAppUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentSubscriptionDataModelImplCopyWith<$Res>
    implements $StudentSubscriptionDataModelCopyWith<$Res> {
  factory _$$StudentSubscriptionDataModelImplCopyWith(
          _$StudentSubscriptionDataModelImpl value,
          $Res Function(_$StudentSubscriptionDataModelImpl) then) =
      __$$StudentSubscriptionDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String whatsAppUrl});
}

/// @nodoc
class __$$StudentSubscriptionDataModelImplCopyWithImpl<$Res>
    extends _$StudentSubscriptionDataModelCopyWithImpl<$Res,
        _$StudentSubscriptionDataModelImpl>
    implements _$$StudentSubscriptionDataModelImplCopyWith<$Res> {
  __$$StudentSubscriptionDataModelImplCopyWithImpl(
      _$StudentSubscriptionDataModelImpl _value,
      $Res Function(_$StudentSubscriptionDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentSubscriptionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? whatsAppUrl = null,
  }) {
    return _then(_$StudentSubscriptionDataModelImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      whatsAppUrl: null == whatsAppUrl
          ? _value.whatsAppUrl
          : whatsAppUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentSubscriptionDataModelImpl
    implements _StudentSubscriptionDataModel {
  const _$StudentSubscriptionDataModelImpl(
      {this.token = '', this.whatsAppUrl = ''});

  factory _$StudentSubscriptionDataModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$StudentSubscriptionDataModelImplFromJson(json);

  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey()
  final String whatsAppUrl;

  @override
  String toString() {
    return 'StudentSubscriptionDataModel(token: $token, whatsAppUrl: $whatsAppUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentSubscriptionDataModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.whatsAppUrl, whatsAppUrl) ||
                other.whatsAppUrl == whatsAppUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, whatsAppUrl);

  /// Create a copy of StudentSubscriptionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentSubscriptionDataModelImplCopyWith<
          _$StudentSubscriptionDataModelImpl>
      get copyWith => __$$StudentSubscriptionDataModelImplCopyWithImpl<
          _$StudentSubscriptionDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentSubscriptionDataModelImplToJson(
      this,
    );
  }
}

abstract class _StudentSubscriptionDataModel
    implements StudentSubscriptionDataModel {
  const factory _StudentSubscriptionDataModel(
      {final String token,
      final String whatsAppUrl}) = _$StudentSubscriptionDataModelImpl;

  factory _StudentSubscriptionDataModel.fromJson(Map<String, dynamic> json) =
      _$StudentSubscriptionDataModelImpl.fromJson;

  @override
  String get token;
  @override
  String get whatsAppUrl;

  /// Create a copy of StudentSubscriptionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentSubscriptionDataModelImplCopyWith<
          _$StudentSubscriptionDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
