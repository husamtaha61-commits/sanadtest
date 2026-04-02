// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignupResponse _$UserSignupResponseFromJson(Map<String, dynamic> json) =>
    UserSignupResponse(
      email: json['email'] as String,
      isVerified: json['isVerified'] as bool,
      accessToken: json['accessToken'] as String?,
      resetToken: json['resetToken'] as String?,
      isLoginCompleted: json['isLoginCompleted'] as bool?,
    );
