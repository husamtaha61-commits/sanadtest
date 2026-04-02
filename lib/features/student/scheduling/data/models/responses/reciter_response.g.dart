// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReciterResponseImpl _$$ReciterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReciterResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      description: json['description'] as String?,
      profileImageId: json['profileImageId'] as String?,
      videoId: json['videoId'] as String?,
      nationalityName: json['nationalityName'] as String?,
      countryIsocode: json['countryIsocode'] as String?,
      teachingLanguages: (json['teachingLanguages'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['isFavorite'] as bool?,
      isRecievingNewStudents: json['isRecievingNewStudents'] as bool?,
      recitations: (json['recitations'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
