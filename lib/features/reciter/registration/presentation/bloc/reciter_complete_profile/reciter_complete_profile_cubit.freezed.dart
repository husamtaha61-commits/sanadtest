// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter_complete_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReciterCompleteProfileState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  int get activeIndex => throw _privateConstructorUsedError;
  bool get isChecked1 => throw _privateConstructorUsedError;
  bool get isChecked2 => throw _privateConstructorUsedError;
  XFile? get profilePicture => throw _privateConstructorUsedError;
  XFile? get video => throw _privateConstructorUsedError;
  int? get paymentTypeId => throw _privateConstructorUsedError;
  String? get bankIban => throw _privateConstructorUsedError;
  String? get bankSwiftCode => throw _privateConstructorUsedError;
  String? get bankName => throw _privateConstructorUsedError;
  String? get payPalAccountNumber => throw _privateConstructorUsedError;
  String? get westernUploadedId => throw _privateConstructorUsedError;
  List<ReciterAvailableTimesRequest> get reciterAvailableTimes =>
      throw _privateConstructorUsedError;

  /// Create a copy of ReciterCompleteProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterCompleteProfileStateCopyWith<ReciterCompleteProfileState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterCompleteProfileStateCopyWith<$Res> {
  factory $ReciterCompleteProfileStateCopyWith(
          ReciterCompleteProfileState value,
          $Res Function(ReciterCompleteProfileState) then) =
      _$ReciterCompleteProfileStateCopyWithImpl<$Res,
          ReciterCompleteProfileState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int activeIndex,
      bool isChecked1,
      bool isChecked2,
      XFile? profilePicture,
      XFile? video,
      int? paymentTypeId,
      String? bankIban,
      String? bankSwiftCode,
      String? bankName,
      String? payPalAccountNumber,
      String? westernUploadedId,
      List<ReciterAvailableTimesRequest> reciterAvailableTimes});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$ReciterCompleteProfileStateCopyWithImpl<$Res,
        $Val extends ReciterCompleteProfileState>
    implements $ReciterCompleteProfileStateCopyWith<$Res> {
  _$ReciterCompleteProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReciterCompleteProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeIndex = null,
    Object? isChecked1 = null,
    Object? isChecked2 = null,
    Object? profilePicture = freezed,
    Object? video = freezed,
    Object? paymentTypeId = freezed,
    Object? bankIban = freezed,
    Object? bankSwiftCode = freezed,
    Object? bankName = freezed,
    Object? payPalAccountNumber = freezed,
    Object? westernUploadedId = freezed,
    Object? reciterAvailableTimes = null,
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
      isChecked1: null == isChecked1
          ? _value.isChecked1
          : isChecked1 // ignore: cast_nullable_to_non_nullable
              as bool,
      isChecked2: null == isChecked2
          ? _value.isChecked2
          : isChecked2 // ignore: cast_nullable_to_non_nullable
              as bool,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as XFile?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as XFile?,
      paymentTypeId: freezed == paymentTypeId
          ? _value.paymentTypeId
          : paymentTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankIban: freezed == bankIban
          ? _value.bankIban
          : bankIban // ignore: cast_nullable_to_non_nullable
              as String?,
      bankSwiftCode: freezed == bankSwiftCode
          ? _value.bankSwiftCode
          : bankSwiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      payPalAccountNumber: freezed == payPalAccountNumber
          ? _value.payPalAccountNumber
          : payPalAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      westernUploadedId: freezed == westernUploadedId
          ? _value.westernUploadedId
          : westernUploadedId // ignore: cast_nullable_to_non_nullable
              as String?,
      reciterAvailableTimes: null == reciterAvailableTimes
          ? _value.reciterAvailableTimes
          : reciterAvailableTimes // ignore: cast_nullable_to_non_nullable
              as List<ReciterAvailableTimesRequest>,
    ) as $Val);
  }

  /// Create a copy of ReciterCompleteProfileState
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
abstract class _$$ReciterCompleteProfileStateImplCopyWith<$Res>
    implements $ReciterCompleteProfileStateCopyWith<$Res> {
  factory _$$ReciterCompleteProfileStateImplCopyWith(
          _$ReciterCompleteProfileStateImpl value,
          $Res Function(_$ReciterCompleteProfileStateImpl) then) =
      __$$ReciterCompleteProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int activeIndex,
      bool isChecked1,
      bool isChecked2,
      XFile? profilePicture,
      XFile? video,
      int? paymentTypeId,
      String? bankIban,
      String? bankSwiftCode,
      String? bankName,
      String? payPalAccountNumber,
      String? westernUploadedId,
      List<ReciterAvailableTimesRequest> reciterAvailableTimes});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$ReciterCompleteProfileStateImplCopyWithImpl<$Res>
    extends _$ReciterCompleteProfileStateCopyWithImpl<$Res,
        _$ReciterCompleteProfileStateImpl>
    implements _$$ReciterCompleteProfileStateImplCopyWith<$Res> {
  __$$ReciterCompleteProfileStateImplCopyWithImpl(
      _$ReciterCompleteProfileStateImpl _value,
      $Res Function(_$ReciterCompleteProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReciterCompleteProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeIndex = null,
    Object? isChecked1 = null,
    Object? isChecked2 = null,
    Object? profilePicture = freezed,
    Object? video = freezed,
    Object? paymentTypeId = freezed,
    Object? bankIban = freezed,
    Object? bankSwiftCode = freezed,
    Object? bankName = freezed,
    Object? payPalAccountNumber = freezed,
    Object? westernUploadedId = freezed,
    Object? reciterAvailableTimes = null,
  }) {
    return _then(_$ReciterCompleteProfileStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isChecked1: null == isChecked1
          ? _value.isChecked1
          : isChecked1 // ignore: cast_nullable_to_non_nullable
              as bool,
      isChecked2: null == isChecked2
          ? _value.isChecked2
          : isChecked2 // ignore: cast_nullable_to_non_nullable
              as bool,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as XFile?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as XFile?,
      paymentTypeId: freezed == paymentTypeId
          ? _value.paymentTypeId
          : paymentTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankIban: freezed == bankIban
          ? _value.bankIban
          : bankIban // ignore: cast_nullable_to_non_nullable
              as String?,
      bankSwiftCode: freezed == bankSwiftCode
          ? _value.bankSwiftCode
          : bankSwiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      payPalAccountNumber: freezed == payPalAccountNumber
          ? _value.payPalAccountNumber
          : payPalAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      westernUploadedId: freezed == westernUploadedId
          ? _value.westernUploadedId
          : westernUploadedId // ignore: cast_nullable_to_non_nullable
              as String?,
      reciterAvailableTimes: null == reciterAvailableTimes
          ? _value._reciterAvailableTimes
          : reciterAvailableTimes // ignore: cast_nullable_to_non_nullable
              as List<ReciterAvailableTimesRequest>,
    ));
  }
}

/// @nodoc

class _$ReciterCompleteProfileStateImpl
    implements _ReciterCompleteProfileState {
  const _$ReciterCompleteProfileStateImpl(
      {this.status = const BaseStatus.initial(),
      this.activeIndex = 1,
      this.isChecked1 = false,
      this.isChecked2 = false,
      this.profilePicture,
      this.video,
      this.paymentTypeId = 1,
      this.bankIban = '',
      this.bankSwiftCode = '',
      this.bankName = '',
      this.payPalAccountNumber = '',
      this.westernUploadedId = '',
      final List<ReciterAvailableTimesRequest> reciterAvailableTimes =
          const []})
      : _reciterAvailableTimes = reciterAvailableTimes;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final int activeIndex;
  @override
  @JsonKey()
  final bool isChecked1;
  @override
  @JsonKey()
  final bool isChecked2;
  @override
  final XFile? profilePicture;
  @override
  final XFile? video;
  @override
  @JsonKey()
  final int? paymentTypeId;
  @override
  @JsonKey()
  final String? bankIban;
  @override
  @JsonKey()
  final String? bankSwiftCode;
  @override
  @JsonKey()
  final String? bankName;
  @override
  @JsonKey()
  final String? payPalAccountNumber;
  @override
  @JsonKey()
  final String? westernUploadedId;
  final List<ReciterAvailableTimesRequest> _reciterAvailableTimes;
  @override
  @JsonKey()
  List<ReciterAvailableTimesRequest> get reciterAvailableTimes {
    if (_reciterAvailableTimes is EqualUnmodifiableListView)
      return _reciterAvailableTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reciterAvailableTimes);
  }

  @override
  String toString() {
    return 'ReciterCompleteProfileState(status: $status, activeIndex: $activeIndex, isChecked1: $isChecked1, isChecked2: $isChecked2, profilePicture: $profilePicture, video: $video, paymentTypeId: $paymentTypeId, bankIban: $bankIban, bankSwiftCode: $bankSwiftCode, bankName: $bankName, payPalAccountNumber: $payPalAccountNumber, westernUploadedId: $westernUploadedId, reciterAvailableTimes: $reciterAvailableTimes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterCompleteProfileStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.isChecked1, isChecked1) ||
                other.isChecked1 == isChecked1) &&
            (identical(other.isChecked2, isChecked2) ||
                other.isChecked2 == isChecked2) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.paymentTypeId, paymentTypeId) ||
                other.paymentTypeId == paymentTypeId) &&
            (identical(other.bankIban, bankIban) ||
                other.bankIban == bankIban) &&
            (identical(other.bankSwiftCode, bankSwiftCode) ||
                other.bankSwiftCode == bankSwiftCode) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.payPalAccountNumber, payPalAccountNumber) ||
                other.payPalAccountNumber == payPalAccountNumber) &&
            (identical(other.westernUploadedId, westernUploadedId) ||
                other.westernUploadedId == westernUploadedId) &&
            const DeepCollectionEquality()
                .equals(other._reciterAvailableTimes, _reciterAvailableTimes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      activeIndex,
      isChecked1,
      isChecked2,
      profilePicture,
      video,
      paymentTypeId,
      bankIban,
      bankSwiftCode,
      bankName,
      payPalAccountNumber,
      westernUploadedId,
      const DeepCollectionEquality().hash(_reciterAvailableTimes));

  /// Create a copy of ReciterCompleteProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterCompleteProfileStateImplCopyWith<_$ReciterCompleteProfileStateImpl>
      get copyWith => __$$ReciterCompleteProfileStateImplCopyWithImpl<
          _$ReciterCompleteProfileStateImpl>(this, _$identity);
}

abstract class _ReciterCompleteProfileState
    implements ReciterCompleteProfileState {
  const factory _ReciterCompleteProfileState(
          {final BaseStatus<dynamic> status,
          final int activeIndex,
          final bool isChecked1,
          final bool isChecked2,
          final XFile? profilePicture,
          final XFile? video,
          final int? paymentTypeId,
          final String? bankIban,
          final String? bankSwiftCode,
          final String? bankName,
          final String? payPalAccountNumber,
          final String? westernUploadedId,
          final List<ReciterAvailableTimesRequest> reciterAvailableTimes}) =
      _$ReciterCompleteProfileStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  int get activeIndex;
  @override
  bool get isChecked1;
  @override
  bool get isChecked2;
  @override
  XFile? get profilePicture;
  @override
  XFile? get video;
  @override
  int? get paymentTypeId;
  @override
  String? get bankIban;
  @override
  String? get bankSwiftCode;
  @override
  String? get bankName;
  @override
  String? get payPalAccountNumber;
  @override
  String? get westernUploadedId;
  @override
  List<ReciterAvailableTimesRequest> get reciterAvailableTimes;

  /// Create a copy of ReciterCompleteProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterCompleteProfileStateImplCopyWith<_$ReciterCompleteProfileStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
