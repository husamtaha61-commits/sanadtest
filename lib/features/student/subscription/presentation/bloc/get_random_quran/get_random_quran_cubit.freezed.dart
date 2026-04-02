// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_random_quran_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetRandomQuranState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  GetRandomQuranResponse? get quranTemplate =>
      throw _privateConstructorUsedError;
  bool get isFontLoaded => throw _privateConstructorUsedError;
  bool get isStartRecording => throw _privateConstructorUsedError;

  /// Create a copy of GetRandomQuranState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetRandomQuranStateCopyWith<GetRandomQuranState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRandomQuranStateCopyWith<$Res> {
  factory $GetRandomQuranStateCopyWith(
          GetRandomQuranState value, $Res Function(GetRandomQuranState) then) =
      _$GetRandomQuranStateCopyWithImpl<$Res, GetRandomQuranState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      GetRandomQuranResponse? quranTemplate,
      bool isFontLoaded,
      bool isStartRecording});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$GetRandomQuranStateCopyWithImpl<$Res, $Val extends GetRandomQuranState>
    implements $GetRandomQuranStateCopyWith<$Res> {
  _$GetRandomQuranStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetRandomQuranState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? quranTemplate = freezed,
    Object? isFontLoaded = null,
    Object? isStartRecording = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      quranTemplate: freezed == quranTemplate
          ? _value.quranTemplate
          : quranTemplate // ignore: cast_nullable_to_non_nullable
              as GetRandomQuranResponse?,
      isFontLoaded: null == isFontLoaded
          ? _value.isFontLoaded
          : isFontLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isStartRecording: null == isStartRecording
          ? _value.isStartRecording
          : isStartRecording // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of GetRandomQuranState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get status {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetRandomQuranStateImplCopyWith<$Res>
    implements $GetRandomQuranStateCopyWith<$Res> {
  factory _$$GetRandomQuranStateImplCopyWith(_$GetRandomQuranStateImpl value,
          $Res Function(_$GetRandomQuranStateImpl) then) =
      __$$GetRandomQuranStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      GetRandomQuranResponse? quranTemplate,
      bool isFontLoaded,
      bool isStartRecording});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$GetRandomQuranStateImplCopyWithImpl<$Res>
    extends _$GetRandomQuranStateCopyWithImpl<$Res, _$GetRandomQuranStateImpl>
    implements _$$GetRandomQuranStateImplCopyWith<$Res> {
  __$$GetRandomQuranStateImplCopyWithImpl(_$GetRandomQuranStateImpl _value,
      $Res Function(_$GetRandomQuranStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetRandomQuranState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? quranTemplate = freezed,
    Object? isFontLoaded = null,
    Object? isStartRecording = null,
  }) {
    return _then(_$GetRandomQuranStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      quranTemplate: freezed == quranTemplate
          ? _value.quranTemplate
          : quranTemplate // ignore: cast_nullable_to_non_nullable
              as GetRandomQuranResponse?,
      isFontLoaded: null == isFontLoaded
          ? _value.isFontLoaded
          : isFontLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isStartRecording: null == isStartRecording
          ? _value.isStartRecording
          : isStartRecording // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetRandomQuranStateImpl implements _GetRandomQuranState {
  const _$GetRandomQuranStateImpl(
      {this.status = const BaseStatus.initial(),
      this.quranTemplate,
      this.isFontLoaded = false,
      this.isStartRecording = false});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  final GetRandomQuranResponse? quranTemplate;
  @override
  @JsonKey()
  final bool isFontLoaded;
  @override
  @JsonKey()
  final bool isStartRecording;

  @override
  String toString() {
    return 'GetRandomQuranState(status: $status, quranTemplate: $quranTemplate, isFontLoaded: $isFontLoaded, isStartRecording: $isStartRecording)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRandomQuranStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.quranTemplate, quranTemplate) ||
                other.quranTemplate == quranTemplate) &&
            (identical(other.isFontLoaded, isFontLoaded) ||
                other.isFontLoaded == isFontLoaded) &&
            (identical(other.isStartRecording, isStartRecording) ||
                other.isStartRecording == isStartRecording));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, quranTemplate, isFontLoaded, isStartRecording);

  /// Create a copy of GetRandomQuranState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRandomQuranStateImplCopyWith<_$GetRandomQuranStateImpl> get copyWith =>
      __$$GetRandomQuranStateImplCopyWithImpl<_$GetRandomQuranStateImpl>(
          this, _$identity);
}

abstract class _GetRandomQuranState implements GetRandomQuranState {
  const factory _GetRandomQuranState(
      {final BaseStatus<dynamic> status,
      final GetRandomQuranResponse? quranTemplate,
      final bool isFontLoaded,
      final bool isStartRecording}) = _$GetRandomQuranStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  GetRandomQuranResponse? get quranTemplate;
  @override
  bool get isFontLoaded;
  @override
  bool get isStartRecording;

  /// Create a copy of GetRandomQuranState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetRandomQuranStateImplCopyWith<_$GetRandomQuranStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
