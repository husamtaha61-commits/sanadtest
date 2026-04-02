// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_center.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActionCenter {
  int get id => throw _privateConstructorUsedError;
  String get actionName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic> get metaDataObject => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;

  /// Create a copy of ActionCenter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActionCenterCopyWith<ActionCenter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionCenterCopyWith<$Res> {
  factory $ActionCenterCopyWith(
          ActionCenter value, $Res Function(ActionCenter) then) =
      _$ActionCenterCopyWithImpl<$Res, ActionCenter>;
  @useResult
  $Res call(
      {int id,
      String actionName,
      String title,
      String message,
      Map<String, dynamic> metaDataObject,
      DateTime creationDate});
}

/// @nodoc
class _$ActionCenterCopyWithImpl<$Res, $Val extends ActionCenter>
    implements $ActionCenterCopyWith<$Res> {
  _$ActionCenterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionCenter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actionName = null,
    Object? title = null,
    Object? message = null,
    Object? metaDataObject = null,
    Object? creationDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      actionName: null == actionName
          ? _value.actionName
          : actionName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      metaDataObject: null == metaDataObject
          ? _value.metaDataObject
          : metaDataObject // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionCenterImplCopyWith<$Res>
    implements $ActionCenterCopyWith<$Res> {
  factory _$$ActionCenterImplCopyWith(
          _$ActionCenterImpl value, $Res Function(_$ActionCenterImpl) then) =
      __$$ActionCenterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String actionName,
      String title,
      String message,
      Map<String, dynamic> metaDataObject,
      DateTime creationDate});
}

/// @nodoc
class __$$ActionCenterImplCopyWithImpl<$Res>
    extends _$ActionCenterCopyWithImpl<$Res, _$ActionCenterImpl>
    implements _$$ActionCenterImplCopyWith<$Res> {
  __$$ActionCenterImplCopyWithImpl(
      _$ActionCenterImpl _value, $Res Function(_$ActionCenterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionCenter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actionName = null,
    Object? title = null,
    Object? message = null,
    Object? metaDataObject = null,
    Object? creationDate = null,
  }) {
    return _then(_$ActionCenterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      actionName: null == actionName
          ? _value.actionName
          : actionName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      metaDataObject: null == metaDataObject
          ? _value._metaDataObject
          : metaDataObject // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ActionCenterImpl implements _ActionCenter {
  const _$ActionCenterImpl(
      {required this.id,
      required this.actionName,
      required this.title,
      required this.message,
      required final Map<String, dynamic> metaDataObject,
      required this.creationDate})
      : _metaDataObject = metaDataObject;

  @override
  final int id;
  @override
  final String actionName;
  @override
  final String title;
  @override
  final String message;
  final Map<String, dynamic> _metaDataObject;
  @override
  Map<String, dynamic> get metaDataObject {
    if (_metaDataObject is EqualUnmodifiableMapView) return _metaDataObject;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metaDataObject);
  }

  @override
  final DateTime creationDate;

  @override
  String toString() {
    return 'ActionCenter(id: $id, actionName: $actionName, title: $title, message: $message, metaDataObject: $metaDataObject, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionCenterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actionName, actionName) ||
                other.actionName == actionName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._metaDataObject, _metaDataObject) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, actionName, title, message,
      const DeepCollectionEquality().hash(_metaDataObject), creationDate);

  /// Create a copy of ActionCenter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionCenterImplCopyWith<_$ActionCenterImpl> get copyWith =>
      __$$ActionCenterImplCopyWithImpl<_$ActionCenterImpl>(this, _$identity);
}

abstract class _ActionCenter implements ActionCenter {
  const factory _ActionCenter(
      {required final int id,
      required final String actionName,
      required final String title,
      required final String message,
      required final Map<String, dynamic> metaDataObject,
      required final DateTime creationDate}) = _$ActionCenterImpl;

  @override
  int get id;
  @override
  String get actionName;
  @override
  String get title;
  @override
  String get message;
  @override
  Map<String, dynamic> get metaDataObject;
  @override
  DateTime get creationDate;

  /// Create a copy of ActionCenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionCenterImplCopyWith<_$ActionCenterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
