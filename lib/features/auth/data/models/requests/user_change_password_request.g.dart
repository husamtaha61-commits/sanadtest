// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_change_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequest _$ChangePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordRequest(
      email: json['email'] as String,
      oldPassword: json['oldPassword'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$ChangePasswordRequestToJson(
        ChangePasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'oldPassword': instance.oldPassword,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
