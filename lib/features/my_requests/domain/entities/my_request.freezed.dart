// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyRequest _$MyRequestFromJson(Map<String, dynamic> json) {
  return _MyRequest.fromJson(json);
}

/// @nodoc
mixin _$MyRequest {
  int get requestId => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  BaseFieldResponse get type => throw _privateConstructorUsedError;
  UserSenderReciever get sender => throw _privateConstructorUsedError;
  UserSenderReciever get reciever => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  DateTime get oldSessionTime => throw _privateConstructorUsedError;
  List<TimeData> get scheduleTimes => throw _privateConstructorUsedError;
  List<TimeData> get previousScheduleTimes =>
      throw _privateConstructorUsedError;
  List<TimeSuggestionsResponse>? get timeSuggestions =>
      throw _privateConstructorUsedError;

  /// Create a copy of MyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyRequestCopyWith<MyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyRequestCopyWith<$Res> {
  factory $MyRequestCopyWith(MyRequest value, $Res Function(MyRequest) then) =
      _$MyRequestCopyWithImpl<$Res, MyRequest>;
  @useResult
  $Res call(
      {int requestId,
      Status status,
      BaseFieldResponse type,
      UserSenderReciever sender,
      UserSenderReciever reciever,
      String? note,
      DateTime creationDate,
      DateTime oldSessionTime,
      List<TimeData> scheduleTimes,
      List<TimeData> previousScheduleTimes,
      List<TimeSuggestionsResponse>? timeSuggestions});

  $StatusCopyWith<$Res> get status;
  $BaseFieldResponseCopyWith<$Res> get type;
  $UserSenderRecieverCopyWith<$Res> get sender;
  $UserSenderRecieverCopyWith<$Res> get reciever;
}

/// @nodoc
class _$MyRequestCopyWithImpl<$Res, $Val extends MyRequest>
    implements $MyRequestCopyWith<$Res> {
  _$MyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? status = null,
    Object? type = null,
    Object? sender = null,
    Object? reciever = null,
    Object? note = freezed,
    Object? creationDate = null,
    Object? oldSessionTime = null,
    Object? scheduleTimes = null,
    Object? previousScheduleTimes = null,
    Object? timeSuggestions = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BaseFieldResponse,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as UserSenderReciever,
      reciever: null == reciever
          ? _value.reciever
          : reciever // ignore: cast_nullable_to_non_nullable
              as UserSenderReciever,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      oldSessionTime: null == oldSessionTime
          ? _value.oldSessionTime
          : oldSessionTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduleTimes: null == scheduleTimes
          ? _value.scheduleTimes
          : scheduleTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeData>,
      previousScheduleTimes: null == previousScheduleTimes
          ? _value.previousScheduleTimes
          : previousScheduleTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeData>,
      timeSuggestions: freezed == timeSuggestions
          ? _value.timeSuggestions
          : timeSuggestions // ignore: cast_nullable_to_non_nullable
              as List<TimeSuggestionsResponse>?,
    ) as $Val);
  }

  /// Create a copy of MyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of MyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseFieldResponseCopyWith<$Res> get type {
    return $BaseFieldResponseCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  /// Create a copy of MyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSenderRecieverCopyWith<$Res> get sender {
    return $UserSenderRecieverCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }

  /// Create a copy of MyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSenderRecieverCopyWith<$Res> get reciever {
    return $UserSenderRecieverCopyWith<$Res>(_value.reciever, (value) {
      return _then(_value.copyWith(reciever: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyRequestImplCopyWith<$Res>
    implements $MyRequestCopyWith<$Res> {
  factory _$$MyRequestImplCopyWith(
          _$MyRequestImpl value, $Res Function(_$MyRequestImpl) then) =
      __$$MyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int requestId,
      Status status,
      BaseFieldResponse type,
      UserSenderReciever sender,
      UserSenderReciever reciever,
      String? note,
      DateTime creationDate,
      DateTime oldSessionTime,
      List<TimeData> scheduleTimes,
      List<TimeData> previousScheduleTimes,
      List<TimeSuggestionsResponse>? timeSuggestions});

  @override
  $StatusCopyWith<$Res> get status;
  @override
  $BaseFieldResponseCopyWith<$Res> get type;
  @override
  $UserSenderRecieverCopyWith<$Res> get sender;
  @override
  $UserSenderRecieverCopyWith<$Res> get reciever;
}

/// @nodoc
class __$$MyRequestImplCopyWithImpl<$Res>
    extends _$MyRequestCopyWithImpl<$Res, _$MyRequestImpl>
    implements _$$MyRequestImplCopyWith<$Res> {
  __$$MyRequestImplCopyWithImpl(
      _$MyRequestImpl _value, $Res Function(_$MyRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? status = null,
    Object? type = null,
    Object? sender = null,
    Object? reciever = null,
    Object? note = freezed,
    Object? creationDate = null,
    Object? oldSessionTime = null,
    Object? scheduleTimes = null,
    Object? previousScheduleTimes = null,
    Object? timeSuggestions = freezed,
  }) {
    return _then(_$MyRequestImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BaseFieldResponse,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as UserSenderReciever,
      reciever: null == reciever
          ? _value.reciever
          : reciever // ignore: cast_nullable_to_non_nullable
              as UserSenderReciever,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      oldSessionTime: null == oldSessionTime
          ? _value.oldSessionTime
          : oldSessionTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduleTimes: null == scheduleTimes
          ? _value._scheduleTimes
          : scheduleTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeData>,
      previousScheduleTimes: null == previousScheduleTimes
          ? _value._previousScheduleTimes
          : previousScheduleTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeData>,
      timeSuggestions: freezed == timeSuggestions
          ? _value._timeSuggestions
          : timeSuggestions // ignore: cast_nullable_to_non_nullable
              as List<TimeSuggestionsResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$MyRequestImpl implements _MyRequest {
  const _$MyRequestImpl(
      {required this.requestId,
      required this.status,
      required this.type,
      required this.sender,
      required this.reciever,
      this.note,
      required this.creationDate,
      required this.oldSessionTime,
      required final List<TimeData> scheduleTimes,
      required final List<TimeData> previousScheduleTimes,
      final List<TimeSuggestionsResponse>? timeSuggestions})
      : _scheduleTimes = scheduleTimes,
        _previousScheduleTimes = previousScheduleTimes,
        _timeSuggestions = timeSuggestions;

  factory _$MyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyRequestImplFromJson(json);

  @override
  final int requestId;
  @override
  final Status status;
  @override
  final BaseFieldResponse type;
  @override
  final UserSenderReciever sender;
  @override
  final UserSenderReciever reciever;
  @override
  final String? note;
  @override
  final DateTime creationDate;
  @override
  final DateTime oldSessionTime;
  final List<TimeData> _scheduleTimes;
  @override
  List<TimeData> get scheduleTimes {
    if (_scheduleTimes is EqualUnmodifiableListView) return _scheduleTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleTimes);
  }

  final List<TimeData> _previousScheduleTimes;
  @override
  List<TimeData> get previousScheduleTimes {
    if (_previousScheduleTimes is EqualUnmodifiableListView)
      return _previousScheduleTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previousScheduleTimes);
  }

  final List<TimeSuggestionsResponse>? _timeSuggestions;
  @override
  List<TimeSuggestionsResponse>? get timeSuggestions {
    final value = _timeSuggestions;
    if (value == null) return null;
    if (_timeSuggestions is EqualUnmodifiableListView) return _timeSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MyRequest(requestId: $requestId, status: $status, type: $type, sender: $sender, reciever: $reciever, note: $note, creationDate: $creationDate, oldSessionTime: $oldSessionTime, scheduleTimes: $scheduleTimes, previousScheduleTimes: $previousScheduleTimes, timeSuggestions: $timeSuggestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyRequestImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.reciever, reciever) ||
                other.reciever == reciever) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.oldSessionTime, oldSessionTime) ||
                other.oldSessionTime == oldSessionTime) &&
            const DeepCollectionEquality()
                .equals(other._scheduleTimes, _scheduleTimes) &&
            const DeepCollectionEquality()
                .equals(other._previousScheduleTimes, _previousScheduleTimes) &&
            const DeepCollectionEquality()
                .equals(other._timeSuggestions, _timeSuggestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestId,
      status,
      type,
      sender,
      reciever,
      note,
      creationDate,
      oldSessionTime,
      const DeepCollectionEquality().hash(_scheduleTimes),
      const DeepCollectionEquality().hash(_previousScheduleTimes),
      const DeepCollectionEquality().hash(_timeSuggestions));

  /// Create a copy of MyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyRequestImplCopyWith<_$MyRequestImpl> get copyWith =>
      __$$MyRequestImplCopyWithImpl<_$MyRequestImpl>(this, _$identity);
}

abstract class _MyRequest implements MyRequest {
  const factory _MyRequest(
      {required final int requestId,
      required final Status status,
      required final BaseFieldResponse type,
      required final UserSenderReciever sender,
      required final UserSenderReciever reciever,
      final String? note,
      required final DateTime creationDate,
      required final DateTime oldSessionTime,
      required final List<TimeData> scheduleTimes,
      required final List<TimeData> previousScheduleTimes,
      final List<TimeSuggestionsResponse>? timeSuggestions}) = _$MyRequestImpl;

  factory _MyRequest.fromJson(Map<String, dynamic> json) =
      _$MyRequestImpl.fromJson;

  @override
  int get requestId;
  @override
  Status get status;
  @override
  BaseFieldResponse get type;
  @override
  UserSenderReciever get sender;
  @override
  UserSenderReciever get reciever;
  @override
  String? get note;
  @override
  DateTime get creationDate;
  @override
  DateTime get oldSessionTime;
  @override
  List<TimeData> get scheduleTimes;
  @override
  List<TimeData> get previousScheduleTimes;
  @override
  List<TimeSuggestionsResponse>? get timeSuggestions;

  /// Create a copy of MyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyRequestImplCopyWith<_$MyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
