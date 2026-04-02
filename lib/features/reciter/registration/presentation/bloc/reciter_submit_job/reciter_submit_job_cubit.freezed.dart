// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter_submit_job_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReciterSubmitJobState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  int get activeIndex => throw _privateConstructorUsedError;
  BaseField? get document => throw _privateConstructorUsedError;
  XFile? get frontImage => throw _privateConstructorUsedError;
  XFile? get backImage => throw _privateConstructorUsedError;
  List<CertificateData> get certificates => throw _privateConstructorUsedError;
  List<XFile> get otherCertificates => throw _privateConstructorUsedError;

  /// Create a copy of ReciterSubmitJobState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterSubmitJobStateCopyWith<ReciterSubmitJobState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterSubmitJobStateCopyWith<$Res> {
  factory $ReciterSubmitJobStateCopyWith(ReciterSubmitJobState value,
          $Res Function(ReciterSubmitJobState) then) =
      _$ReciterSubmitJobStateCopyWithImpl<$Res, ReciterSubmitJobState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int activeIndex,
      BaseField? document,
      XFile? frontImage,
      XFile? backImage,
      List<CertificateData> certificates,
      List<XFile> otherCertificates});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$ReciterSubmitJobStateCopyWithImpl<$Res,
        $Val extends ReciterSubmitJobState>
    implements $ReciterSubmitJobStateCopyWith<$Res> {
  _$ReciterSubmitJobStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReciterSubmitJobState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeIndex = null,
    Object? document = freezed,
    Object? frontImage = freezed,
    Object? backImage = freezed,
    Object? certificates = null,
    Object? otherCertificates = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      document: freezed == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as BaseField?,
      frontImage: freezed == frontImage
          ? _value.frontImage
          : frontImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      backImage: freezed == backImage
          ? _value.backImage
          : backImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      certificates: null == certificates
          ? _value.certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<CertificateData>,
      otherCertificates: null == otherCertificates
          ? _value.otherCertificates
          : otherCertificates // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ) as $Val);
  }

  /// Create a copy of ReciterSubmitJobState
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
abstract class _$$ReciterSubmitJobStateImplCopyWith<$Res>
    implements $ReciterSubmitJobStateCopyWith<$Res> {
  factory _$$ReciterSubmitJobStateImplCopyWith(
          _$ReciterSubmitJobStateImpl value,
          $Res Function(_$ReciterSubmitJobStateImpl) then) =
      __$$ReciterSubmitJobStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int activeIndex,
      BaseField? document,
      XFile? frontImage,
      XFile? backImage,
      List<CertificateData> certificates,
      List<XFile> otherCertificates});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$ReciterSubmitJobStateImplCopyWithImpl<$Res>
    extends _$ReciterSubmitJobStateCopyWithImpl<$Res,
        _$ReciterSubmitJobStateImpl>
    implements _$$ReciterSubmitJobStateImplCopyWith<$Res> {
  __$$ReciterSubmitJobStateImplCopyWithImpl(_$ReciterSubmitJobStateImpl _value,
      $Res Function(_$ReciterSubmitJobStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReciterSubmitJobState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeIndex = null,
    Object? document = freezed,
    Object? frontImage = freezed,
    Object? backImage = freezed,
    Object? certificates = null,
    Object? otherCertificates = null,
  }) {
    return _then(_$ReciterSubmitJobStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      document: freezed == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as BaseField?,
      frontImage: freezed == frontImage
          ? _value.frontImage
          : frontImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      backImage: freezed == backImage
          ? _value.backImage
          : backImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      certificates: null == certificates
          ? _value._certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<CertificateData>,
      otherCertificates: null == otherCertificates
          ? _value._otherCertificates
          : otherCertificates // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ));
  }
}

/// @nodoc

class _$ReciterSubmitJobStateImpl implements _ReciterSubmitJobState {
  const _$ReciterSubmitJobStateImpl(
      {this.status = const BaseStatus.initial(),
      this.activeIndex = 1,
      this.document,
      this.frontImage,
      this.backImage,
      final List<CertificateData> certificates = const [],
      final List<XFile> otherCertificates = const []})
      : _certificates = certificates,
        _otherCertificates = otherCertificates;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final int activeIndex;
  @override
  final BaseField? document;
  @override
  final XFile? frontImage;
  @override
  final XFile? backImage;
  final List<CertificateData> _certificates;
  @override
  @JsonKey()
  List<CertificateData> get certificates {
    if (_certificates is EqualUnmodifiableListView) return _certificates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_certificates);
  }

  final List<XFile> _otherCertificates;
  @override
  @JsonKey()
  List<XFile> get otherCertificates {
    if (_otherCertificates is EqualUnmodifiableListView)
      return _otherCertificates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherCertificates);
  }

  @override
  String toString() {
    return 'ReciterSubmitJobState(status: $status, activeIndex: $activeIndex, document: $document, frontImage: $frontImage, backImage: $backImage, certificates: $certificates, otherCertificates: $otherCertificates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterSubmitJobStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.document, document) ||
                other.document == document) &&
            (identical(other.frontImage, frontImage) ||
                other.frontImage == frontImage) &&
            (identical(other.backImage, backImage) ||
                other.backImage == backImage) &&
            const DeepCollectionEquality()
                .equals(other._certificates, _certificates) &&
            const DeepCollectionEquality()
                .equals(other._otherCertificates, _otherCertificates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      activeIndex,
      document,
      frontImage,
      backImage,
      const DeepCollectionEquality().hash(_certificates),
      const DeepCollectionEquality().hash(_otherCertificates));

  /// Create a copy of ReciterSubmitJobState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterSubmitJobStateImplCopyWith<_$ReciterSubmitJobStateImpl>
      get copyWith => __$$ReciterSubmitJobStateImplCopyWithImpl<
          _$ReciterSubmitJobStateImpl>(this, _$identity);
}

abstract class _ReciterSubmitJobState implements ReciterSubmitJobState {
  const factory _ReciterSubmitJobState(
      {final BaseStatus<dynamic> status,
      final int activeIndex,
      final BaseField? document,
      final XFile? frontImage,
      final XFile? backImage,
      final List<CertificateData> certificates,
      final List<XFile> otherCertificates}) = _$ReciterSubmitJobStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  int get activeIndex;
  @override
  BaseField? get document;
  @override
  XFile? get frontImage;
  @override
  XFile? get backImage;
  @override
  List<CertificateData> get certificates;
  @override
  List<XFile> get otherCertificates;

  /// Create a copy of ReciterSubmitJobState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterSubmitJobStateImplCopyWith<_$ReciterSubmitJobStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
