// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaging_contact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagingContactResponse _$MessagingContactResponseFromJson(
        Map<String, dynamic> json) =>
    MessagingContactResponse(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$MessagingContactResponseToJson(
        MessagingContactResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'profileImageUrl': instance.profileImageUrl,
    };
