// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_confirmation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionConfirmationState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  int get activeStep => throw _privateConstructorUsedError;
  List<Page> get pages => throw _privateConstructorUsedError;
  bool? get actionValue => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;

  /// Create a copy of SessionConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionConfirmationStateCopyWith<SessionConfirmationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionConfirmationStateCopyWith<$Res> {
  factory $SessionConfirmationStateCopyWith(SessionConfirmationState value,
          $Res Function(SessionConfirmationState) then) =
      _$SessionConfirmationStateCopyWithImpl<$Res, SessionConfirmationState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int activeStep,
      List<Page> pages,
      bool? actionValue,
      int lastPage});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$SessionConfirmationStateCopyWithImpl<$Res,
        $Val extends SessionConfirmationState>
    implements $SessionConfirmationStateCopyWith<$Res> {
  _$SessionConfirmationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeStep = null,
    Object? pages = null,
    Object? actionValue = freezed,
    Object? lastPage = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      activeStep: null == activeStep
          ? _value.activeStep
          : activeStep // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<Page>,
      actionValue: freezed == actionValue
          ? _value.actionValue
          : actionValue // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of SessionConfirmationState
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
abstract class _$$SessionConfirmationStateImplCopyWith<$Res>
    implements $SessionConfirmationStateCopyWith<$Res> {
  factory _$$SessionConfirmationStateImplCopyWith(
          _$SessionConfirmationStateImpl value,
          $Res Function(_$SessionConfirmationStateImpl) then) =
      __$$SessionConfirmationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      int activeStep,
      List<Page> pages,
      bool? actionValue,
      int lastPage});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$SessionConfirmationStateImplCopyWithImpl<$Res>
    extends _$SessionConfirmationStateCopyWithImpl<$Res,
        _$SessionConfirmationStateImpl>
    implements _$$SessionConfirmationStateImplCopyWith<$Res> {
  __$$SessionConfirmationStateImplCopyWithImpl(
      _$SessionConfirmationStateImpl _value,
      $Res Function(_$SessionConfirmationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeStep = null,
    Object? pages = null,
    Object? actionValue = freezed,
    Object? lastPage = null,
  }) {
    return _then(_$SessionConfirmationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      activeStep: null == activeStep
          ? _value.activeStep
          : activeStep // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<Page>,
      actionValue: freezed == actionValue
          ? _value.actionValue
          : actionValue // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SessionConfirmationStateImpl implements _SessionConfirmationState {
  const _$SessionConfirmationStateImpl(
      {this.status = const BaseStatus.initial(),
      this.activeStep = 1,
      final List<Page> pages = const [],
      this.actionValue,
      this.lastPage = 1})
      : _pages = pages;

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final int activeStep;
  final List<Page> _pages;
  @override
  @JsonKey()
  List<Page> get pages {
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }

  @override
  final bool? actionValue;
  @override
  @JsonKey()
  final int lastPage;

  @override
  String toString() {
    return 'SessionConfirmationState(status: $status, activeStep: $activeStep, pages: $pages, actionValue: $actionValue, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionConfirmationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeStep, activeStep) ||
                other.activeStep == activeStep) &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            (identical(other.actionValue, actionValue) ||
                other.actionValue == actionValue) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, activeStep,
      const DeepCollectionEquality().hash(_pages), actionValue, lastPage);

  /// Create a copy of SessionConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionConfirmationStateImplCopyWith<_$SessionConfirmationStateImpl>
      get copyWith => __$$SessionConfirmationStateImplCopyWithImpl<
          _$SessionConfirmationStateImpl>(this, _$identity);
}

abstract class _SessionConfirmationState implements SessionConfirmationState {
  const factory _SessionConfirmationState(
      {final BaseStatus<dynamic> status,
      final int activeStep,
      final List<Page> pages,
      final bool? actionValue,
      final int lastPage}) = _$SessionConfirmationStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  int get activeStep;
  @override
  List<Page> get pages;
  @override
  bool? get actionValue;
  @override
  int get lastPage;

  /// Create a copy of SessionConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionConfirmationStateImplCopyWith<_$SessionConfirmationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
