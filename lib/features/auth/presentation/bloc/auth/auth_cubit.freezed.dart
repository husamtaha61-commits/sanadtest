// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get middleName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isLoginCompleted => throw _privateConstructorUsedError;
  bool get isForgotPasswordMode => throw _privateConstructorUsedError;
  String get resetToken => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  bool get showVerificationMessage => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      String firstName,
      String middleName,
      String lastName,
      String email,
      String dateOfBirth,
      String role,
      bool isVerified,
      bool isLoginCompleted,
      bool isForgotPasswordMode,
      String resetToken,
      String accessToken,
      bool showVerificationMessage});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? email = null,
    Object? dateOfBirth = null,
    Object? role = null,
    Object? isVerified = null,
    Object? isLoginCompleted = null,
    Object? isForgotPasswordMode = null,
    Object? resetToken = null,
    Object? accessToken = null,
    Object? showVerificationMessage = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginCompleted: null == isLoginCompleted
          ? _value.isLoginCompleted
          : isLoginCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isForgotPasswordMode: null == isForgotPasswordMode
          ? _value.isForgotPasswordMode
          : isForgotPasswordMode // ignore: cast_nullable_to_non_nullable
              as bool,
      resetToken: null == resetToken
          ? _value.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      showVerificationMessage: null == showVerificationMessage
          ? _value.showVerificationMessage
          : showVerificationMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AuthState
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
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      String firstName,
      String middleName,
      String lastName,
      String email,
      String dateOfBirth,
      String role,
      bool isVerified,
      bool isLoginCompleted,
      bool isForgotPasswordMode,
      String resetToken,
      String accessToken,
      bool showVerificationMessage});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? email = null,
    Object? dateOfBirth = null,
    Object? role = null,
    Object? isVerified = null,
    Object? isLoginCompleted = null,
    Object? isForgotPasswordMode = null,
    Object? resetToken = null,
    Object? accessToken = null,
    Object? showVerificationMessage = null,
  }) {
    return _then(_$AuthStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginCompleted: null == isLoginCompleted
          ? _value.isLoginCompleted
          : isLoginCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isForgotPasswordMode: null == isForgotPasswordMode
          ? _value.isForgotPasswordMode
          : isForgotPasswordMode // ignore: cast_nullable_to_non_nullable
              as bool,
      resetToken: null == resetToken
          ? _value.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      showVerificationMessage: null == showVerificationMessage
          ? _value.showVerificationMessage
          : showVerificationMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.status = const BaseStatus.initial(),
      this.firstName = '',
      this.middleName = '',
      this.lastName = '',
      this.email = '',
      this.dateOfBirth = '',
      this.role = '',
      this.isVerified = false,
      this.isLoginCompleted = false,
      this.isForgotPasswordMode = false,
      this.resetToken = '',
      this.accessToken = '',
      this.showVerificationMessage = false});

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String middleName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String dateOfBirth;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final bool isLoginCompleted;
  @override
  @JsonKey()
  final bool isForgotPasswordMode;
  @override
  @JsonKey()
  final String resetToken;
  @override
  @JsonKey()
  final String accessToken;
  @override
  @JsonKey()
  final bool showVerificationMessage;

  @override
  String toString() {
    return 'AuthState(status: $status, firstName: $firstName, middleName: $middleName, lastName: $lastName, email: $email, dateOfBirth: $dateOfBirth, role: $role, isVerified: $isVerified, isLoginCompleted: $isLoginCompleted, isForgotPasswordMode: $isForgotPasswordMode, resetToken: $resetToken, accessToken: $accessToken, showVerificationMessage: $showVerificationMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isLoginCompleted, isLoginCompleted) ||
                other.isLoginCompleted == isLoginCompleted) &&
            (identical(other.isForgotPasswordMode, isForgotPasswordMode) ||
                other.isForgotPasswordMode == isForgotPasswordMode) &&
            (identical(other.resetToken, resetToken) ||
                other.resetToken == resetToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(
                    other.showVerificationMessage, showVerificationMessage) ||
                other.showVerificationMessage == showVerificationMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      firstName,
      middleName,
      lastName,
      email,
      dateOfBirth,
      role,
      isVerified,
      isLoginCompleted,
      isForgotPasswordMode,
      resetToken,
      accessToken,
      showVerificationMessage);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final BaseStatus<dynamic> status,
      final String firstName,
      final String middleName,
      final String lastName,
      final String email,
      final String dateOfBirth,
      final String role,
      final bool isVerified,
      final bool isLoginCompleted,
      final bool isForgotPasswordMode,
      final String resetToken,
      final String accessToken,
      final bool showVerificationMessage}) = _$AuthStateImpl;

  @override
  BaseStatus<dynamic> get status;
  @override
  String get firstName;
  @override
  String get middleName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get dateOfBirth;
  @override
  String get role;
  @override
  bool get isVerified;
  @override
  bool get isLoginCompleted;
  @override
  bool get isForgotPasswordMode;
  @override
  String get resetToken;
  @override
  String get accessToken;
  @override
  bool get showVerificationMessage;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
