// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_response.dart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoleResponse _$UserRoleResponseFromJson(Map<String, dynamic> json) =>
    UserRoleResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      comparisonName: json['comparisonName'] as String?,
    );

Map<String, dynamic> _$UserRoleResponseToJson(UserRoleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'comparisonName': instance.comparisonName,
    };
