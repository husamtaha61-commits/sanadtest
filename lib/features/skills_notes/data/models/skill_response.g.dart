// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillResponse _$SkillResponseFromJson(Map<String, dynamic> json) =>
    SkillResponse(
      id: (json['id'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      name: json['name'] as String?,
      isGained: json['isGained'] as bool?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => SkillResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      percent: (json['percent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SkillResponseToJson(SkillResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'name': instance.name,
      'isGained': instance.isGained,
      'children': instance.children,
      'percent': instance.percent,
    };
