// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  int get activeIndex => throw _privateConstructorUsedError;
  int get programId => throw _privateConstructorUsedError;
  bool get isCheckedDate => throw _privateConstructorUsedError;
  BaseField? get document => throw _privateConstructorUsedError;
  XFile? get frontImage => throw _privateConstructorUsedError;
  XFile? get backImage => throw _privateConstructorUsedError;
  XFile? get video => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  SubscriptionModel? get currentResubmittingSub =>
      throw _privateConstructorUsedError;
  bool get isCheckedVideo => throw _privateConstructorUsedError;
  bool get isCheckedVidRecord => throw _privateConstructorUsedError;
  bool get phoneNumberIsExist => throw _privateConstructorUsedError;
  int get sentBytes => throw _privateConstructorUsedError;
  List<SubscriptionModel> get subscriptions =>
      throw _privateConstructorUsedError;
  bool get allowEditingAllFields => throw _privateConstructorUsedError;
  bool get isResubmitting => throw _privateConstructorUsedError;
  int get totalBytes => throw _privateConstructorUsedError;
  int get evaluationMethod => throw _privateConstructorUsedError;
  String get whatsAppUrl => throw _privateConstructorUsedError;
  bool get showSuccessDialog => throw _privateConstructorUsedError;
  int? get recieverId => throw _privateConstructorUsedError;
  int? get dayId => throw _privateConstructorUsedError;
  int? get timeId => throw _privateConstructorUsedError;
  String? get suggestionTime => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionStateCopyWith<SubscriptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionStateCopyWith<$Res> {
  factory $SubscriptionStateCopyWith(
          SubscriptionState value, $Res Function(SubscriptionState) then) =
      _$SubscriptionStateCopyWithImpl<$Res, SubscriptionState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int activeIndex,
      int programId,
      bool isCheckedDate,
      BaseField? document,
      XFile? frontImage,
      XFile? backImage,
      XFile? video,
      String? videoUrl,
      SubscriptionModel? currentResubmittingSub,
      bool isCheckedVideo,
      bool isCheckedVidRecord,
      bool phoneNumberIsExist,
      int sentBytes,
      List<SubscriptionModel> subscriptions,
      bool allowEditingAllFields,
      bool isResubmitting,
      int totalBytes,
      int evaluationMethod,
      String whatsAppUrl,
      bool showSuccessDialog,
      int? recieverId,
      int? dayId,
      int? timeId,
      String? suggestionTime});

  $BaseStatusCopyWith<dynamic, $Res> get status;
  $SubscriptionModelCopyWith<$Res>? get currentResubmittingSub;
}

/// @nodoc
class _$SubscriptionStateCopyWithImpl<$Res, $Val extends SubscriptionState>
    implements $SubscriptionStateCopyWith<$Res> {
  _$SubscriptionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeIndex = null,
    Object? programId = null,
    Object? isCheckedDate = null,
    Object? document = freezed,
    Object? frontImage = freezed,
    Object? backImage = freezed,
    Object? video = freezed,
    Object? videoUrl = freezed,
    Object? currentResubmittingSub = freezed,
    Object? isCheckedVideo = null,
    Object? isCheckedVidRecord = null,
    Object? phoneNumberIsExist = null,
    Object? sentBytes = null,
    Object? subscriptions = null,
    Object? allowEditingAllFields = null,
    Object? isResubmitting = null,
    Object? totalBytes = null,
    Object? evaluationMethod = null,
    Object? whatsAppUrl = null,
    Object? showSuccessDialog = null,
    Object? recieverId = freezed,
    Object? dayId = freezed,
    Object? timeId = freezed,
    Object? suggestionTime = freezed,
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
      programId: null == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as int,
      isCheckedDate: null == isCheckedDate
          ? _value.isCheckedDate
          : isCheckedDate // ignore: cast_nullable_to_non_nullable
              as bool,
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
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as XFile?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currentResubmittingSub: freezed == currentResubmittingSub
          ? _value.currentResubmittingSub
          : currentResubmittingSub // ignore: cast_nullable_to_non_nullable
              as SubscriptionModel?,
      isCheckedVideo: null == isCheckedVideo
          ? _value.isCheckedVideo
          : isCheckedVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckedVidRecord: null == isCheckedVidRecord
          ? _value.isCheckedVidRecord
          : isCheckedVidRecord // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumberIsExist: null == phoneNumberIsExist
          ? _value.phoneNumberIsExist
          : phoneNumberIsExist // ignore: cast_nullable_to_non_nullable
              as bool,
      sentBytes: null == sentBytes
          ? _value.sentBytes
          : sentBytes // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptions: null == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionModel>,
      allowEditingAllFields: null == allowEditingAllFields
          ? _value.allowEditingAllFields
          : allowEditingAllFields // ignore: cast_nullable_to_non_nullable
              as bool,
      isResubmitting: null == isResubmitting
          ? _value.isResubmitting
          : isResubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      totalBytes: null == totalBytes
          ? _value.totalBytes
          : totalBytes // ignore: cast_nullable_to_non_nullable
              as int,
      evaluationMethod: null == evaluationMethod
          ? _value.evaluationMethod
          : evaluationMethod // ignore: cast_nullable_to_non_nullable
              as int,
      whatsAppUrl: null == whatsAppUrl
          ? _value.whatsAppUrl
          : whatsAppUrl // ignore: cast_nullable_to_non_nullable
              as String,
      showSuccessDialog: null == showSuccessDialog
          ? _value.showSuccessDialog
          : showSuccessDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      recieverId: freezed == recieverId
          ? _value.recieverId
          : recieverId // ignore: cast_nullable_to_non_nullable
              as int?,
      dayId: freezed == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeId: freezed == timeId
          ? _value.timeId
          : timeId // ignore: cast_nullable_to_non_nullable
              as int?,
      suggestionTime: freezed == suggestionTime
          ? _value.suggestionTime
          : suggestionTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get status {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionModelCopyWith<$Res>? get currentResubmittingSub {
    if (_value.currentResubmittingSub == null) {
      return null;
    }

    return $SubscriptionModelCopyWith<$Res>(_value.currentResubmittingSub!,
        (value) {
      return _then(_value.copyWith(currentResubmittingSub: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubscriptionStateImplCopyWith<$Res>
    implements $SubscriptionStateCopyWith<$Res> {
  factory _$$SubscriptionStateImplCopyWith(_$SubscriptionStateImpl value,
          $Res Function(_$SubscriptionStateImpl) then) =
      __$$SubscriptionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int activeIndex,
      int programId,
      bool isCheckedDate,
      BaseField? document,
      XFile? frontImage,
      XFile? backImage,
      XFile? video,
      String? videoUrl,
      SubscriptionModel? currentResubmittingSub,
      bool isCheckedVideo,
      bool isCheckedVidRecord,
      bool phoneNumberIsExist,
      int sentBytes,
      List<SubscriptionModel> subscriptions,
      bool allowEditingAllFields,
      bool isResubmitting,
      int totalBytes,
      int evaluationMethod,
      String whatsAppUrl,
      bool showSuccessDialog,
      int? recieverId,
      int? dayId,
      int? timeId,
      String? suggestionTime});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
  @override
  $SubscriptionModelCopyWith<$Res>? get currentResubmittingSub;
}

/// @nodoc
class __$$SubscriptionStateImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$SubscriptionStateImpl>
    implements _$$SubscriptionStateImplCopyWith<$Res> {
  __$$SubscriptionStateImplCopyWithImpl(_$SubscriptionStateImpl _value,
      $Res Function(_$SubscriptionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeIndex = null,
    Object? programId = null,
    Object? isCheckedDate = null,
    Object? document = freezed,
    Object? frontImage = freezed,
    Object? backImage = freezed,
    Object? video = freezed,
    Object? videoUrl = freezed,
    Object? currentResubmittingSub = freezed,
    Object? isCheckedVideo = null,
    Object? isCheckedVidRecord = null,
    Object? phoneNumberIsExist = null,
    Object? sentBytes = null,
    Object? subscriptions = null,
    Object? allowEditingAllFields = null,
    Object? isResubmitting = null,
    Object? totalBytes = null,
    Object? evaluationMethod = null,
    Object? whatsAppUrl = null,
    Object? showSuccessDialog = null,
    Object? recieverId = freezed,
    Object? dayId = freezed,
    Object? timeId = freezed,
    Object? suggestionTime = freezed,
  }) {
    return _then(_$SubscriptionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      programId: null == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as int,
      isCheckedDate: null == isCheckedDate
          ? _value.isCheckedDate
          : isCheckedDate // ignore: cast_nullable_to_non_nullable
              as bool,
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
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as XFile?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currentResubmittingSub: freezed == currentResubmittingSub
          ? _value.currentResubmittingSub
          : currentResubmittingSub // ignore: cast_nullable_to_non_nullable
              as SubscriptionModel?,
      isCheckedVideo: null == isCheckedVideo
          ? _value.isCheckedVideo
          : isCheckedVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckedVidRecord: null == isCheckedVidRecord
          ? _value.isCheckedVidRecord
          : isCheckedVidRecord // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumberIsExist: null == phoneNumberIsExist
          ? _value.phoneNumberIsExist
          : phoneNumberIsExist // ignore: cast_nullable_to_non_nullable
              as bool,
      sentBytes: null == sentBytes
          ? _value.sentBytes
          : sentBytes // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptions: null == subscriptions
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionModel>,
      allowEditingAllFields: null == allowEditingAllFields
          ? _value.allowEditingAllFields
          : allowEditingAllFields // ignore: cast_nullable_to_non_nullable
              as bool,
      isResubmitting: null == isResubmitting
          ? _value.isResubmitting
          : isResubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      totalBytes: null == totalBytes
          ? _value.totalBytes
          : totalBytes // ignore: cast_nullable_to_non_nullable
              as int,
      evaluationMethod: null == evaluationMethod
          ? _value.evaluationMethod
          : evaluationMethod // ignore: cast_nullable_to_non_nullable
              as int,
      whatsAppUrl: null == whatsAppUrl
          ? _value.whatsAppUrl
          : whatsAppUrl // ignore: cast_nullable_to_non_nullable
              as String,
      showSuccessDialog: null == showSuccessDialog
          ? _value.showSuccessDialog
          : showSuccessDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      recieverId: freezed == recieverId
          ? _value.recieverId
          : recieverId // ignore: cast_nullable_to_non_nullable
              as int?,
      dayId: freezed == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeId: freezed == timeId
          ? _value.timeId
          : timeId // ignore: cast_nullable_to_non_nullable
              as int?,
      suggestionTime: freezed == suggestionTime
          ? _value.suggestionTime
          : suggestionTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubscriptionStateImpl implements _SubscriptionState {
  const _$SubscriptionStateImpl(
      {this.status = const BaseStatus.initial(),
      this.activeIndex = 1,
      this.programId = 0,
      this.isCheckedDate = false,
      this.document,
      this.frontImage,
      this.backImage,
      this.video,
      this.videoUrl,
      this.currentResubmittingSub,
      this.isCheckedVideo = false,
      this.isCheckedVidRecord = false,
      this.phoneNumberIsExist = false,
      this.sentBytes = -1,
      final List<SubscriptionModel> subscriptions = const [],
      this.allowEditingAllFields = true,
      this.isResubmitting = false,
      this.totalBytes = -1,
      this.evaluationMethod = 1,
      this.whatsAppUrl = '',
      this.showSuccessDialog = false,
      this.recieverId,
      this.dayId,
      this.timeId,
      this.suggestionTime})
      : _subscriptions = subscriptions;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final int activeIndex;
  @override
  @JsonKey()
  final int programId;
  @override
  @JsonKey()
  final bool isCheckedDate;
  @override
  final BaseField? document;
  @override
  final XFile? frontImage;
  @override
  final XFile? backImage;
  @override
  final XFile? video;
  @override
  final String? videoUrl;
  @override
  final SubscriptionModel? currentResubmittingSub;
  @override
  @JsonKey()
  final bool isCheckedVideo;
  @override
  @JsonKey()
  final bool isCheckedVidRecord;
  @override
  @JsonKey()
  final bool phoneNumberIsExist;
  @override
  @JsonKey()
  final int sentBytes;
  final List<SubscriptionModel> _subscriptions;
  @override
  @JsonKey()
  List<SubscriptionModel> get subscriptions {
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  @override
  @JsonKey()
  final bool allowEditingAllFields;
  @override
  @JsonKey()
  final bool isResubmitting;
  @override
  @JsonKey()
  final int totalBytes;
  @override
  @JsonKey()
  final int evaluationMethod;
  @override
  @JsonKey()
  final String whatsAppUrl;
  @override
  @JsonKey()
  final bool showSuccessDialog;
  @override
  final int? recieverId;
  @override
  final int? dayId;
  @override
  final int? timeId;
  @override
  final String? suggestionTime;

  @override
  String toString() {
    return 'SubscriptionState(status: $status, activeIndex: $activeIndex, programId: $programId, isCheckedDate: $isCheckedDate, document: $document, frontImage: $frontImage, backImage: $backImage, video: $video, videoUrl: $videoUrl, currentResubmittingSub: $currentResubmittingSub, isCheckedVideo: $isCheckedVideo, isCheckedVidRecord: $isCheckedVidRecord, phoneNumberIsExist: $phoneNumberIsExist, sentBytes: $sentBytes, subscriptions: $subscriptions, allowEditingAllFields: $allowEditingAllFields, isResubmitting: $isResubmitting, totalBytes: $totalBytes, evaluationMethod: $evaluationMethod, whatsAppUrl: $whatsAppUrl, showSuccessDialog: $showSuccessDialog, recieverId: $recieverId, dayId: $dayId, timeId: $timeId, suggestionTime: $suggestionTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.programId, programId) ||
                other.programId == programId) &&
            (identical(other.isCheckedDate, isCheckedDate) ||
                other.isCheckedDate == isCheckedDate) &&
            (identical(other.document, document) ||
                other.document == document) &&
            (identical(other.frontImage, frontImage) ||
                other.frontImage == frontImage) &&
            (identical(other.backImage, backImage) ||
                other.backImage == backImage) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.currentResubmittingSub, currentResubmittingSub) ||
                other.currentResubmittingSub == currentResubmittingSub) &&
            (identical(other.isCheckedVideo, isCheckedVideo) ||
                other.isCheckedVideo == isCheckedVideo) &&
            (identical(other.isCheckedVidRecord, isCheckedVidRecord) ||
                other.isCheckedVidRecord == isCheckedVidRecord) &&
            (identical(other.phoneNumberIsExist, phoneNumberIsExist) ||
                other.phoneNumberIsExist == phoneNumberIsExist) &&
            (identical(other.sentBytes, sentBytes) ||
                other.sentBytes == sentBytes) &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions) &&
            (identical(other.allowEditingAllFields, allowEditingAllFields) ||
                other.allowEditingAllFields == allowEditingAllFields) &&
            (identical(other.isResubmitting, isResubmitting) ||
                other.isResubmitting == isResubmitting) &&
            (identical(other.totalBytes, totalBytes) ||
                other.totalBytes == totalBytes) &&
            (identical(other.evaluationMethod, evaluationMethod) ||
                other.evaluationMethod == evaluationMethod) &&
            (identical(other.whatsAppUrl, whatsAppUrl) ||
                other.whatsAppUrl == whatsAppUrl) &&
            (identical(other.showSuccessDialog, showSuccessDialog) ||
                other.showSuccessDialog == showSuccessDialog) &&
            (identical(other.recieverId, recieverId) ||
                other.recieverId == recieverId) &&
            (identical(other.dayId, dayId) || other.dayId == dayId) &&
            (identical(other.timeId, timeId) || other.timeId == timeId) &&
            (identical(other.suggestionTime, suggestionTime) ||
                other.suggestionTime == suggestionTime));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        activeIndex,
        programId,
        isCheckedDate,
        document,
        frontImage,
        backImage,
        video,
        videoUrl,
        currentResubmittingSub,
        isCheckedVideo,
        isCheckedVidRecord,
        phoneNumberIsExist,
        sentBytes,
        const DeepCollectionEquality().hash(_subscriptions),
        allowEditingAllFields,
        isResubmitting,
        totalBytes,
        evaluationMethod,
        whatsAppUrl,
        showSuccessDialog,
        recieverId,
        dayId,
        timeId,
        suggestionTime
      ]);

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionStateImplCopyWith<_$SubscriptionStateImpl> get copyWith =>
      __$$SubscriptionStateImplCopyWithImpl<_$SubscriptionStateImpl>(
          this, _$identity);
}

abstract class _SubscriptionState implements SubscriptionState {
  const factory _SubscriptionState(
      {final BaseStatus<dynamic> status,
      final int activeIndex,
      final int programId,
      final bool isCheckedDate,
      final BaseField? document,
      final XFile? frontImage,
      final XFile? backImage,
      final XFile? video,
      final String? videoUrl,
      final SubscriptionModel? currentResubmittingSub,
      final bool isCheckedVideo,
      final bool isCheckedVidRecord,
      final bool phoneNumberIsExist,
      final int sentBytes,
      final List<SubscriptionModel> subscriptions,
      final bool allowEditingAllFields,
      final bool isResubmitting,
      final int totalBytes,
      final int evaluationMethod,
      final String whatsAppUrl,
      final bool showSuccessDialog,
      final int? recieverId,
      final int? dayId,
      final int? timeId,
      final String? suggestionTime}) = _$SubscriptionStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  int get activeIndex;
  @override
  int get programId;
  @override
  bool get isCheckedDate;
  @override
  BaseField? get document;
  @override
  XFile? get frontImage;
  @override
  XFile? get backImage;
  @override
  XFile? get video;
  @override
  String? get videoUrl;
  @override
  SubscriptionModel? get currentResubmittingSub;
  @override
  bool get isCheckedVideo;
  @override
  bool get isCheckedVidRecord;
  @override
  bool get phoneNumberIsExist;
  @override
  int get sentBytes;
  @override
  List<SubscriptionModel> get subscriptions;
  @override
  bool get allowEditingAllFields;
  @override
  bool get isResubmitting;
  @override
  int get totalBytes;
  @override
  int get evaluationMethod;
  @override
  String get whatsAppUrl;
  @override
  bool get showSuccessDialog;
  @override
  int? get recieverId;
  @override
  int? get dayId;
  @override
  int? get timeId;
  @override
  String? get suggestionTime;

  /// Create a copy of SubscriptionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionStateImplCopyWith<_$SubscriptionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
