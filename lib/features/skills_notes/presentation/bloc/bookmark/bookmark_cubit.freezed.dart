// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookmarkState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<BookmarkGroup> get bookmarks => throw _privateConstructorUsedError;

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkStateCopyWith<BookmarkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkStateCopyWith<$Res> {
  factory $BookmarkStateCopyWith(
          BookmarkState value, $Res Function(BookmarkState) then) =
      _$BookmarkStateCopyWithImpl<$Res, BookmarkState>;
  @useResult
  $Res call({BaseStatus<dynamic> status, List<BookmarkGroup> bookmarks});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$BookmarkStateCopyWithImpl<$Res, $Val extends BookmarkState>
    implements $BookmarkStateCopyWith<$Res> {
  _$BookmarkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? bookmarks = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      bookmarks: null == bookmarks
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<BookmarkGroup>,
    ) as $Val);
  }

  /// Create a copy of BookmarkState
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
abstract class _$$BookmarkStateImplCopyWith<$Res>
    implements $BookmarkStateCopyWith<$Res> {
  factory _$$BookmarkStateImplCopyWith(
          _$BookmarkStateImpl value, $Res Function(_$BookmarkStateImpl) then) =
      __$$BookmarkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseStatus<dynamic> status, List<BookmarkGroup> bookmarks});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$BookmarkStateImplCopyWithImpl<$Res>
    extends _$BookmarkStateCopyWithImpl<$Res, _$BookmarkStateImpl>
    implements _$$BookmarkStateImplCopyWith<$Res> {
  __$$BookmarkStateImplCopyWithImpl(
      _$BookmarkStateImpl _value, $Res Function(_$BookmarkStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? bookmarks = null,
  }) {
    return _then(_$BookmarkStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      bookmarks: null == bookmarks
          ? _value._bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<BookmarkGroup>,
    ));
  }
}

/// @nodoc

class _$BookmarkStateImpl implements _BookmarkState {
  const _$BookmarkStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<BookmarkGroup> bookmarks = const []})
      : _bookmarks = bookmarks;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<BookmarkGroup> _bookmarks;
  @override
  @JsonKey()
  List<BookmarkGroup> get bookmarks {
    if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarks);
  }

  @override
  String toString() {
    return 'BookmarkState(status: $status, bookmarks: $bookmarks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_bookmarks));

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkStateImplCopyWith<_$BookmarkStateImpl> get copyWith =>
      __$$BookmarkStateImplCopyWithImpl<_$BookmarkStateImpl>(this, _$identity);
}

abstract class _BookmarkState implements BookmarkState {
  const factory _BookmarkState(
      {final BaseStatus<dynamic> status,
      final List<BookmarkGroup> bookmarks}) = _$BookmarkStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  List<BookmarkGroup> get bookmarks;

  /// Create a copy of BookmarkState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkStateImplCopyWith<_$BookmarkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
