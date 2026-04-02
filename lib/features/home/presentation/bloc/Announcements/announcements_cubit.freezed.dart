// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcements_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnnouncementsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<Announcement> get announcements => throw _privateConstructorUsedError;

  /// Create a copy of AnnouncementsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnnouncementsStateCopyWith<AnnouncementsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementsStateCopyWith<$Res> {
  factory $AnnouncementsStateCopyWith(
          AnnouncementsState value, $Res Function(AnnouncementsState) then) =
      _$AnnouncementsStateCopyWithImpl<$Res, AnnouncementsState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, List<Announcement> announcements});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$AnnouncementsStateCopyWithImpl<$Res, $Val extends AnnouncementsState>
    implements $AnnouncementsStateCopyWith<$Res> {
  _$AnnouncementsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnnouncementsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? announcements = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      announcements: null == announcements
          ? _value.announcements
          : announcements // ignore: cast_nullable_to_non_nullable
              as List<Announcement>,
    ) as $Val);
  }

  /// Create a copy of AnnouncementsState
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
abstract class _$$AnnouncementsStateImplCopyWith<$Res>
    implements $AnnouncementsStateCopyWith<$Res> {
  factory _$$AnnouncementsStateImplCopyWith(_$AnnouncementsStateImpl value,
          $Res Function(_$AnnouncementsStateImpl) then) =
      __$$AnnouncementsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, List<Announcement> announcements});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$AnnouncementsStateImplCopyWithImpl<$Res>
    extends _$AnnouncementsStateCopyWithImpl<$Res, _$AnnouncementsStateImpl>
    implements _$$AnnouncementsStateImplCopyWith<$Res> {
  __$$AnnouncementsStateImplCopyWithImpl(_$AnnouncementsStateImpl _value,
      $Res Function(_$AnnouncementsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnnouncementsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? announcements = null,
  }) {
    return _then(_$AnnouncementsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      announcements: null == announcements
          ? _value._announcements
          : announcements // ignore: cast_nullable_to_non_nullable
              as List<Announcement>,
    ));
  }
}

/// @nodoc

class _$AnnouncementsStateImpl implements _AnnouncementsState {
  const _$AnnouncementsStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<Announcement> announcements = const []})
      : _announcements = announcements;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<Announcement> _announcements;
  @override
  @JsonKey()
  List<Announcement> get announcements {
    if (_announcements is EqualUnmodifiableListView) return _announcements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcements);
  }

  @override
  String toString() {
    return 'AnnouncementsState(status: $status, announcements: $announcements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._announcements, _announcements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_announcements));

  /// Create a copy of AnnouncementsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementsStateImplCopyWith<_$AnnouncementsStateImpl> get copyWith =>
      __$$AnnouncementsStateImplCopyWithImpl<_$AnnouncementsStateImpl>(
          this, _$identity);
}

abstract class _AnnouncementsState implements AnnouncementsState {
  const factory _AnnouncementsState(
      {final BaseStatus<dynamic> status,
      final List<Announcement> announcements}) = _$AnnouncementsStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<Announcement> get announcements;

  /// Create a copy of AnnouncementsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnnouncementsStateImplCopyWith<_$AnnouncementsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
