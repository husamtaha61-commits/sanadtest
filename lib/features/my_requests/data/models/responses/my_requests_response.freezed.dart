// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_requests_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyRequestsResponse _$MyRequestsResponseFromJson(Map<String, dynamic> json) {
  return _MyRequestsResponse.fromJson(json);
}

/// @nodoc
mixin _$MyRequestsResponse {
  int get requestId => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  BaseFieldResponse get type => throw _privateConstructorUsedError;
  UserSenderReciever get sender => throw _privateConstructorUsedError;
  UserSenderReciever get reciever => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get creationDate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get oldSessionTime => throw _privateConstructorUsedError;
  List<TimeDataResponse> get scheduleTimes =>
      throw _privateConstructorUsedError;
  List<TimeDataResponse>? get previousScheduleTimes =>
      throw _privateConstructorUsedError;
  List<TimeSuggestionsResponse>? get timeSuggestions =>
      throw _privateConstructorUsedError;

  /// Create a copy of MyRequestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyRequestsResponseCopyWith<MyRequestsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyRequestsResponseCopyWith<$Res> {
  factory $MyRequestsResponseCopyWith(
          MyRequestsResponse value, $Res Function(MyRequestsResponse) then) =
      _$MyRequestsResponseCopyWithImpl<$Res, MyRequestsResponse>;
  @useResult
  $Res call(
      {int requestId,
      Status status,
      BaseFieldResponse type,
      UserSenderReciever sender,
      UserSenderReciever reciever,
      String? note,
      @DateTimeConverter() DateTime? creationDate,
      @DateTimeConverter() DateTime? oldSessionTime,
      List<TimeDataResponse> scheduleTimes,
      List<TimeDataResponse>? previousScheduleTimes,
      List<TimeSuggestionsResponse>? timeSuggestions});

  $StatusCopyWith<$Res> get status;
  $BaseFieldResponseCopyWith<$Res> get type;
  $UserSenderRecieverCopyWith<$Res> get sender;
  $UserSenderRecieverCopyWith<$Res> get reciever;
}

/// @nodoc
class _$MyRequestsResponseCopyWithImpl<$Res, $Val extends MyRequestsResponse>
    implements $MyRequestsResponseCopyWith<$Res> {
  _$MyRequestsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyRequestsResponse
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
    Object? creationDate = freezed,
    Object? oldSessionTime = freezed,
    Object? scheduleTimes = null,
    Object? previousScheduleTimes = freezed,
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
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      oldSessionTime: freezed == oldSessionTime
          ? _value.oldSessionTime
          : oldSessionTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduleTimes: null == scheduleTimes
          ? _value.scheduleTimes
          : scheduleTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeDataResponse>,
      previousScheduleTimes: freezed == previousScheduleTimes
          ? _value.previousScheduleTimes
          : previousScheduleTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeDataResponse>?,
      timeSuggestions: freezed == timeSuggestions
          ? _value.timeSuggestions
          : timeSuggestions // ignore: cast_nullable_to_non_nullable
              as List<TimeSuggestionsResponse>?,
    ) as $Val);
  }

  /// Create a copy of MyRequestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of MyRequestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseFieldResponseCopyWith<$Res> get type {
    return $BaseFieldResponseCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  /// Create a copy of MyRequestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSenderRecieverCopyWith<$Res> get sender {
    return $UserSenderRecieverCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }

  /// Create a copy of MyRequestsResponse
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
abstract class _$$MyRequestsResponseImplCopyWith<$Res>
    implements $MyRequestsResponseCopyWith<$Res> {
  factory _$$MyRequestsResponseImplCopyWith(_$MyRequestsResponseImpl value,
          $Res Function(_$MyRequestsResponseImpl) then) =
      __$$MyRequestsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int requestId,
      Status status,
      BaseFieldResponse type,
      UserSenderReciever sender,
      UserSenderReciever reciever,
      String? note,
      @DateTimeConverter() DateTime? creationDate,
      @DateTimeConverter() DateTime? oldSessionTime,
      List<TimeDataResponse> scheduleTimes,
      List<TimeDataResponse>? previousScheduleTimes,
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
class __$$MyRequestsResponseImplCopyWithImpl<$Res>
    extends _$MyRequestsResponseCopyWithImpl<$Res, _$MyRequestsResponseImpl>
    implements _$$MyRequestsResponseImplCopyWith<$Res> {
  __$$MyRequestsResponseImplCopyWithImpl(_$MyRequestsResponseImpl _value,
      $Res Function(_$MyRequestsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyRequestsResponse
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
    Object? creationDate = freezed,
    Object? oldSessionTime = freezed,
    Object? scheduleTimes = null,
    Object? previousScheduleTimes = freezed,
    Object? timeSuggestions = freezed,
  }) {
    return _then(_$MyRequestsResponseImpl(
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
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      oldSessionTime: freezed == oldSessionTime
          ? _value.oldSessionTime
          : oldSessionTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduleTimes: null == scheduleTimes
          ? _value._scheduleTimes
          : scheduleTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeDataResponse>,
      previousScheduleTimes: freezed == previousScheduleTimes
          ? _value._previousScheduleTimes
          : previousScheduleTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeDataResponse>?,
      timeSuggestions: freezed == timeSuggestions
          ? _value._timeSuggestions
          : timeSuggestions // ignore: cast_nullable_to_non_nullable
              as List<TimeSuggestionsResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$MyRequestsResponseImpl implements _MyRequestsResponse {
  const _$MyRequestsResponseImpl(
      {required this.requestId,
      required this.status,
      required this.type,
      required this.sender,
      required this.reciever,
      this.note,
      @DateTimeConverter() this.creationDate,
      @DateTimeConverter() this.oldSessionTime,
      required final List<TimeDataResponse> scheduleTimes,
      required final List<TimeDataResponse>? previousScheduleTimes,
      final List<TimeSuggestionsResponse>? timeSuggestions})
      : _scheduleTimes = scheduleTimes,
        _previousScheduleTimes = previousScheduleTimes,
        _timeSuggestions = timeSuggestions;

  factory _$MyRequestsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyRequestsResponseImplFromJson(json);

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
  @DateTimeConverter()
  final DateTime? creationDate;
  @override
  @DateTimeConverter()
  final DateTime? oldSessionTime;
  final List<TimeDataResponse> _scheduleTimes;
  @override
  List<TimeDataResponse> get scheduleTimes {
    if (_scheduleTimes is EqualUnmodifiableListView) return _scheduleTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleTimes);
  }

  final List<TimeDataResponse>? _previousScheduleTimes;
  @override
  List<TimeDataResponse>? get previousScheduleTimes {
    final value = _previousScheduleTimes;
    if (value == null) return null;
    if (_previousScheduleTimes is EqualUnmodifiableListView)
      return _previousScheduleTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
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
    return 'MyRequestsResponse(requestId: $requestId, status: $status, type: $type, sender: $sender, reciever: $reciever, note: $note, creationDate: $creationDate, oldSessionTime: $oldSessionTime, scheduleTimes: $scheduleTimes, previousScheduleTimes: $previousScheduleTimes, timeSuggestions: $timeSuggestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyRequestsResponseImpl &&
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

  /// Create a copy of MyRequestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyRequestsResponseImplCopyWith<_$MyRequestsResponseImpl> get copyWith =>
      __$$MyRequestsResponseImplCopyWithImpl<_$MyRequestsResponseImpl>(
          this, _$identity);
}

abstract class _MyRequestsResponse implements MyRequestsResponse {
  const factory _MyRequestsResponse(
          {required final int requestId,
          required final Status status,
          required final BaseFieldResponse type,
          required final UserSenderReciever sender,
          required final UserSenderReciever reciever,
          final String? note,
          @DateTimeConverter() final DateTime? creationDate,
          @DateTimeConverter() final DateTime? oldSessionTime,
          required final List<TimeDataResponse> scheduleTimes,
          required final List<TimeDataResponse>? previousScheduleTimes,
          final List<TimeSuggestionsResponse>? timeSuggestions}) =
      _$MyRequestsResponseImpl;

  factory _MyRequestsResponse.fromJson(Map<String, dynamic> json) =
      _$MyRequestsResponseImpl.fromJson;

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
  @DateTimeConverter()
  DateTime? get creationDate;
  @override
  @DateTimeConverter()
  DateTime? get oldSessionTime;
  @override
  List<TimeDataResponse> get scheduleTimes;
  @override
  List<TimeDataResponse>? get previousScheduleTimes;
  @override
  List<TimeSuggestionsResponse>? get timeSuggestions;

  /// Create a copy of MyRequestsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyRequestsResponseImplCopyWith<_$MyRequestsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
mixin _$Status {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res, Status>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusImplCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$$StatusImplCopyWith(
          _$StatusImpl value, $Res Function(_$StatusImpl) then) =
      __$$StatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$StatusImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusImpl>
    implements _$$StatusImplCopyWith<$Res> {
  __$$StatusImplCopyWithImpl(
      _$StatusImpl _value, $Res Function(_$StatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$StatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StatusImpl implements _Status {
  const _$StatusImpl({required this.id, required this.name});

  factory _$StatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Status(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      __$$StatusImplCopyWithImpl<_$StatusImpl>(this, _$identity);
}

abstract class _Status implements Status {
  const factory _Status({required final int id, required final String name}) =
      _$StatusImpl;

  factory _Status.fromJson(Map<String, dynamic> json) = _$StatusImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserSenderReciever _$UserSenderRecieverFromJson(Map<String, dynamic> json) {
  return _UserSenderReciever.fromJson(json);
}

/// @nodoc
mixin _$UserSenderReciever {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  List<UserRoleResponse> get roles => throw _privateConstructorUsedError;

  /// Create a copy of UserSenderReciever
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSenderRecieverCopyWith<UserSenderReciever> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSenderRecieverCopyWith<$Res> {
  factory $UserSenderRecieverCopyWith(
          UserSenderReciever value, $Res Function(UserSenderReciever) then) =
      _$UserSenderRecieverCopyWithImpl<$Res, UserSenderReciever>;
  @useResult
  $Res call(
      {int id,
      String firstName,
      String? middleName,
      String lastName,
      String? profileImageUrl,
      String? description,
      DateTime dateOfBirth,
      List<UserRoleResponse> roles});
}

/// @nodoc
class _$UserSenderRecieverCopyWithImpl<$Res, $Val extends UserSenderReciever>
    implements $UserSenderRecieverCopyWith<$Res> {
  _$UserSenderRecieverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSenderReciever
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? lastName = null,
    Object? profileImageUrl = freezed,
    Object? description = freezed,
    Object? dateOfBirth = null,
    Object? roles = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<UserRoleResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSenderRecieverImplCopyWith<$Res>
    implements $UserSenderRecieverCopyWith<$Res> {
  factory _$$UserSenderRecieverImplCopyWith(_$UserSenderRecieverImpl value,
          $Res Function(_$UserSenderRecieverImpl) then) =
      __$$UserSenderRecieverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstName,
      String? middleName,
      String lastName,
      String? profileImageUrl,
      String? description,
      DateTime dateOfBirth,
      List<UserRoleResponse> roles});
}

/// @nodoc
class __$$UserSenderRecieverImplCopyWithImpl<$Res>
    extends _$UserSenderRecieverCopyWithImpl<$Res, _$UserSenderRecieverImpl>
    implements _$$UserSenderRecieverImplCopyWith<$Res> {
  __$$UserSenderRecieverImplCopyWithImpl(_$UserSenderRecieverImpl _value,
      $Res Function(_$UserSenderRecieverImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSenderReciever
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? lastName = null,
    Object? profileImageUrl = freezed,
    Object? description = freezed,
    Object? dateOfBirth = null,
    Object? roles = null,
  }) {
    return _then(_$UserSenderRecieverImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<UserRoleResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$UserSenderRecieverImpl implements _UserSenderReciever {
  const _$UserSenderRecieverImpl(
      {required this.id,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.profileImageUrl,
      required this.description,
      required this.dateOfBirth,
      required final List<UserRoleResponse> roles})
      : _roles = roles;

  factory _$UserSenderRecieverImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSenderRecieverImplFromJson(json);

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String? middleName;
  @override
  final String lastName;
  @override
  final String? profileImageUrl;
  @override
  final String? description;
  @override
  final DateTime dateOfBirth;
  final List<UserRoleResponse> _roles;
  @override
  List<UserRoleResponse> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  String toString() {
    return 'UserSenderReciever(id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName, profileImageUrl: $profileImageUrl, description: $description, dateOfBirth: $dateOfBirth, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSenderRecieverImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      middleName,
      lastName,
      profileImageUrl,
      description,
      dateOfBirth,
      const DeepCollectionEquality().hash(_roles));

  /// Create a copy of UserSenderReciever
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSenderRecieverImplCopyWith<_$UserSenderRecieverImpl> get copyWith =>
      __$$UserSenderRecieverImplCopyWithImpl<_$UserSenderRecieverImpl>(
          this, _$identity);
}

abstract class _UserSenderReciever implements UserSenderReciever {
  const factory _UserSenderReciever(
      {required final int id,
      required final String firstName,
      required final String? middleName,
      required final String lastName,
      required final String? profileImageUrl,
      required final String? description,
      required final DateTime dateOfBirth,
      required final List<UserRoleResponse> roles}) = _$UserSenderRecieverImpl;

  factory _UserSenderReciever.fromJson(Map<String, dynamic> json) =
      _$UserSenderRecieverImpl.fromJson;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String? get middleName;
  @override
  String get lastName;
  @override
  String? get profileImageUrl;
  @override
  String? get description;
  @override
  DateTime get dateOfBirth;
  @override
  List<UserRoleResponse> get roles;

  /// Create a copy of UserSenderReciever
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSenderRecieverImplCopyWith<_$UserSenderRecieverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSuggestionsResponse _$TimeSuggestionsResponseFromJson(
    Map<String, dynamic> json) {
  return _TimeSuggestionsResponse.fromJson(json);
}

/// @nodoc
mixin _$TimeSuggestionsResponse {
  int? get suggestionId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get suggestionDateTime => throw _privateConstructorUsedError;

  /// Create a copy of TimeSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeSuggestionsResponseCopyWith<TimeSuggestionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSuggestionsResponseCopyWith<$Res> {
  factory $TimeSuggestionsResponseCopyWith(TimeSuggestionsResponse value,
          $Res Function(TimeSuggestionsResponse) then) =
      _$TimeSuggestionsResponseCopyWithImpl<$Res, TimeSuggestionsResponse>;
  @useResult
  $Res call(
      {int? suggestionId, @DateTimeConverter() DateTime? suggestionDateTime});
}

/// @nodoc
class _$TimeSuggestionsResponseCopyWithImpl<$Res,
        $Val extends TimeSuggestionsResponse>
    implements $TimeSuggestionsResponseCopyWith<$Res> {
  _$TimeSuggestionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestionId = freezed,
    Object? suggestionDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      suggestionId: freezed == suggestionId
          ? _value.suggestionId
          : suggestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      suggestionDateTime: freezed == suggestionDateTime
          ? _value.suggestionDateTime
          : suggestionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeSuggestionsResponseImplCopyWith<$Res>
    implements $TimeSuggestionsResponseCopyWith<$Res> {
  factory _$$TimeSuggestionsResponseImplCopyWith(
          _$TimeSuggestionsResponseImpl value,
          $Res Function(_$TimeSuggestionsResponseImpl) then) =
      __$$TimeSuggestionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? suggestionId, @DateTimeConverter() DateTime? suggestionDateTime});
}

/// @nodoc
class __$$TimeSuggestionsResponseImplCopyWithImpl<$Res>
    extends _$TimeSuggestionsResponseCopyWithImpl<$Res,
        _$TimeSuggestionsResponseImpl>
    implements _$$TimeSuggestionsResponseImplCopyWith<$Res> {
  __$$TimeSuggestionsResponseImplCopyWithImpl(
      _$TimeSuggestionsResponseImpl _value,
      $Res Function(_$TimeSuggestionsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestionId = freezed,
    Object? suggestionDateTime = freezed,
  }) {
    return _then(_$TimeSuggestionsResponseImpl(
      suggestionId: freezed == suggestionId
          ? _value.suggestionId
          : suggestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      suggestionDateTime: freezed == suggestionDateTime
          ? _value.suggestionDateTime
          : suggestionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$TimeSuggestionsResponseImpl implements _TimeSuggestionsResponse {
  const _$TimeSuggestionsResponseImpl(
      {this.suggestionId, @DateTimeConverter() this.suggestionDateTime});

  factory _$TimeSuggestionsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSuggestionsResponseImplFromJson(json);

  @override
  final int? suggestionId;
  @override
  @DateTimeConverter()
  final DateTime? suggestionDateTime;

  @override
  String toString() {
    return 'TimeSuggestionsResponse(suggestionId: $suggestionId, suggestionDateTime: $suggestionDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSuggestionsResponseImpl &&
            (identical(other.suggestionId, suggestionId) ||
                other.suggestionId == suggestionId) &&
            (identical(other.suggestionDateTime, suggestionDateTime) ||
                other.suggestionDateTime == suggestionDateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, suggestionId, suggestionDateTime);

  /// Create a copy of TimeSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSuggestionsResponseImplCopyWith<_$TimeSuggestionsResponseImpl>
      get copyWith => __$$TimeSuggestionsResponseImplCopyWithImpl<
          _$TimeSuggestionsResponseImpl>(this, _$identity);
}

abstract class _TimeSuggestionsResponse implements TimeSuggestionsResponse {
  const factory _TimeSuggestionsResponse(
          {final int? suggestionId,
          @DateTimeConverter() final DateTime? suggestionDateTime}) =
      _$TimeSuggestionsResponseImpl;

  factory _TimeSuggestionsResponse.fromJson(Map<String, dynamic> json) =
      _$TimeSuggestionsResponseImpl.fromJson;

  @override
  int? get suggestionId;
  @override
  @DateTimeConverter()
  DateTime? get suggestionDateTime;

  /// Create a copy of TimeSuggestionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeSuggestionsResponseImplCopyWith<_$TimeSuggestionsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
