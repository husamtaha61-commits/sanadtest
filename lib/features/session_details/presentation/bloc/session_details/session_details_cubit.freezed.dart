// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionDetailsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  SessionDetails? get sessionDetails => throw _privateConstructorUsedError;
  List<Note> get myNotes => throw _privateConstructorUsedError;
  List<Note> get otherNotes => throw _privateConstructorUsedError;

  /// Create a copy of SessionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionDetailsStateCopyWith<SessionDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDetailsStateCopyWith<$Res> {
  factory $SessionDetailsStateCopyWith(
          SessionDetailsState value, $Res Function(SessionDetailsState) then) =
      _$SessionDetailsStateCopyWithImpl<$Res, SessionDetailsState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      SessionDetails? sessionDetails,
      List<Note> myNotes,
      List<Note> otherNotes});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$SessionDetailsStateCopyWithImpl<$Res, $Val extends SessionDetailsState>
    implements $SessionDetailsStateCopyWith<$Res> {
  _$SessionDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sessionDetails = freezed,
    Object? myNotes = null,
    Object? otherNotes = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      sessionDetails: freezed == sessionDetails
          ? _value.sessionDetails
          : sessionDetails // ignore: cast_nullable_to_non_nullable
              as SessionDetails?,
      myNotes: null == myNotes
          ? _value.myNotes
          : myNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      otherNotes: null == otherNotes
          ? _value.otherNotes
          : otherNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ) as $Val);
  }

  /// Create a copy of SessionDetailsState
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
abstract class _$$SessionDetailsStateImplCopyWith<$Res>
    implements $SessionDetailsStateCopyWith<$Res> {
  factory _$$SessionDetailsStateImplCopyWith(_$SessionDetailsStateImpl value,
          $Res Function(_$SessionDetailsStateImpl) then) =
      __$$SessionDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      SessionDetails? sessionDetails,
      List<Note> myNotes,
      List<Note> otherNotes});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$SessionDetailsStateImplCopyWithImpl<$Res>
    extends _$SessionDetailsStateCopyWithImpl<$Res, _$SessionDetailsStateImpl>
    implements _$$SessionDetailsStateImplCopyWith<$Res> {
  __$$SessionDetailsStateImplCopyWithImpl(_$SessionDetailsStateImpl _value,
      $Res Function(_$SessionDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sessionDetails = freezed,
    Object? myNotes = null,
    Object? otherNotes = null,
  }) {
    return _then(_$SessionDetailsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      sessionDetails: freezed == sessionDetails
          ? _value.sessionDetails
          : sessionDetails // ignore: cast_nullable_to_non_nullable
              as SessionDetails?,
      myNotes: null == myNotes
          ? _value._myNotes
          : myNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      otherNotes: null == otherNotes
          ? _value._otherNotes
          : otherNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc

class _$SessionDetailsStateImpl implements _SessionDetailsState {
  const _$SessionDetailsStateImpl(
      {this.status = const BaseStatus.initial(),
      this.sessionDetails,
      final List<Note> myNotes = const [],
      final List<Note> otherNotes = const []})
      : _myNotes = myNotes,
        _otherNotes = otherNotes;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  final SessionDetails? sessionDetails;
  final List<Note> _myNotes;
  @override
  @JsonKey()
  List<Note> get myNotes {
    if (_myNotes is EqualUnmodifiableListView) return _myNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myNotes);
  }

  final List<Note> _otherNotes;
  @override
  @JsonKey()
  List<Note> get otherNotes {
    if (_otherNotes is EqualUnmodifiableListView) return _otherNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherNotes);
  }

  @override
  String toString() {
    return 'SessionDetailsState(status: $status, sessionDetails: $sessionDetails, myNotes: $myNotes, otherNotes: $otherNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDetailsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sessionDetails, sessionDetails) ||
                other.sessionDetails == sessionDetails) &&
            const DeepCollectionEquality().equals(other._myNotes, _myNotes) &&
            const DeepCollectionEquality()
                .equals(other._otherNotes, _otherNotes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      sessionDetails,
      const DeepCollectionEquality().hash(_myNotes),
      const DeepCollectionEquality().hash(_otherNotes));

  /// Create a copy of SessionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionDetailsStateImplCopyWith<_$SessionDetailsStateImpl> get copyWith =>
      __$$SessionDetailsStateImplCopyWithImpl<_$SessionDetailsStateImpl>(
          this, _$identity);
}

abstract class _SessionDetailsState implements SessionDetailsState {
  const factory _SessionDetailsState(
      {final BaseStatus<dynamic> status,
      final SessionDetails? sessionDetails,
      final List<Note> myNotes,
      final List<Note> otherNotes}) = _$SessionDetailsStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  SessionDetails? get sessionDetails;
  @override
  List<Note> get myNotes;
  @override
  List<Note> get otherNotes;

  /// Create a copy of SessionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionDetailsStateImplCopyWith<_$SessionDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
