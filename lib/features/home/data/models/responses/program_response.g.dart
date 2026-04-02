// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramResponse _$ProgramResponseFromJson(Map<String, dynamic> json) =>
    ProgramResponse(
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      numberOfSessions: (json['numberOfSessions'] as num?)?.toInt(),
      programType: json['programType'] == null
          ? null
          : BaseFieldResponse.fromJson(
              json['programType'] as Map<String, dynamic>),
      programDescription: (json['programDescription'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      programSubTitle: json['programSubTitle'] == null
          ? null
          : BaseFieldResponse.fromJson(
              json['programSubTitle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProgramResponseToJson(ProgramResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'numberOfSessions': instance.numberOfSessions,
      'programType': instance.programType,
      'programDescription': instance.programDescription,
      'programSubTitle': instance.programSubTitle,
    };
