// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_sections_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeSectionsState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<HomeSection> get sections => throw _privateConstructorUsedError;

  /// Create a copy of HomeSectionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeSectionsStateCopyWith<HomeSectionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSectionsStateCopyWith<$Res> {
  factory $HomeSectionsStateCopyWith(
          HomeSectionsState value, $Res Function(HomeSectionsState) then) =
      _$HomeSectionsStateCopyWithImpl<$Res, HomeSectionsState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, List<HomeSection> sections});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$HomeSectionsStateCopyWithImpl<$Res, $Val extends HomeSectionsState>
    implements $HomeSectionsStateCopyWith<$Res> {
  _$HomeSectionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeSectionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sections = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<HomeSection>,
    ) as $Val);
  }

  /// Create a copy of HomeSectionsState
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
abstract class _$$HomeSectionsStateImplCopyWith<$Res>
    implements $HomeSectionsStateCopyWith<$Res> {
  factory _$$HomeSectionsStateImplCopyWith(_$HomeSectionsStateImpl value,
          $Res Function(_$HomeSectionsStateImpl) then) =
      __$$HomeSectionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, List<HomeSection> sections});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$HomeSectionsStateImplCopyWithImpl<$Res>
    extends _$HomeSectionsStateCopyWithImpl<$Res, _$HomeSectionsStateImpl>
    implements _$$HomeSectionsStateImplCopyWith<$Res> {
  __$$HomeSectionsStateImplCopyWithImpl(_$HomeSectionsStateImpl _value,
      $Res Function(_$HomeSectionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeSectionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sections = null,
  }) {
    return _then(_$HomeSectionsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<HomeSection>,
    ));
  }
}

/// @nodoc

class _$HomeSectionsStateImpl implements _HomeSectionsState {
  const _$HomeSectionsStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<HomeSection> sections = const []})
      : _sections = sections;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<HomeSection> _sections;
  @override
  @JsonKey()
  List<HomeSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'HomeSectionsState(status: $status, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSectionsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_sections));

  /// Create a copy of HomeSectionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeSectionsStateImplCopyWith<_$HomeSectionsStateImpl> get copyWith =>
      __$$HomeSectionsStateImplCopyWithImpl<_$HomeSectionsStateImpl>(
          this, _$identity);
}

abstract class _HomeSectionsState implements HomeSectionsState {
  const factory _HomeSectionsState(
      {final BaseStatus<dynamic> status,
      final List<HomeSection> sections}) = _$HomeSectionsStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<HomeSection> get sections;

  /// Create a copy of HomeSectionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeSectionsStateImplCopyWith<_$HomeSectionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
