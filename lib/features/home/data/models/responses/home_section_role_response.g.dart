// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_section_role_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSectionRoleResponse _$HomeSectionRoleResponseFromJson(
        Map<String, dynamic> json) =>
    HomeSectionRoleResponse(
      roleId: (json['roleId'] as num?)?.toInt(),
      homeSectionId: (json['homeSectionId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomeSectionRoleResponseToJson(
        HomeSectionRoleResponse instance) =>
    <String, dynamic>{
      'roleId': instance.roleId,
      'homeSectionId': instance.homeSectionId,
    };
