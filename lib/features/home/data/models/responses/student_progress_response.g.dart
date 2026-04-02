// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_progress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentProgressResponse _$StudentProgressResponseFromJson(
        Map<String, dynamic> json) =>
    StudentProgressResponse(
      program: json['program'] == null
          ? null
          : ProgramResponse.fromJson(json['program'] as Map<String, dynamic>),
      reciterInfo: json['reciterInfo'] == null
          ? null
          : ReciterInfoResponse.fromJson(
              json['reciterInfo'] as Map<String, dynamic>),
      recitations: (json['recitations'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      readingProgress: json['readingProgress'] == null
          ? null
          : ReadingProgressResponse.fromJson(
              json['readingProgress'] as Map<String, dynamic>),
      sessions: (json['sessions'] as List<dynamic>?)
          ?.map((e) => SessionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentProgressResponseToJson(
        StudentProgressResponse instance) =>
    <String, dynamic>{
      'program': instance.program,
      'reciterInfo': instance.reciterInfo,
      'recitations': instance.recitations,
      'readingProgress': instance.readingProgress,
      'sessions': instance.sessions,
    };

ReciterInfoResponse _$ReciterInfoResponseFromJson(Map<String, dynamic> json) =>
    ReciterInfoResponse(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      profileImageId: json['profileImageId'] as String?,
    );

Map<String, dynamic> _$ReciterInfoResponseToJson(
        ReciterInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'profileImageId': instance.profileImageId,
    };

ReadingProgressResponse _$ReadingProgressResponseFromJson(
        Map<String, dynamic> json) =>
    ReadingProgressResponse(
      khitmaStartDate: const DateTimeConverter()
          .fromJson(json['khitmaStartDate'] as String?),
      khitmaEndDate:
          const DateTimeConverter().fromJson(json['khitmaEndDate'] as String?),
      juz: (json['juz'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      verse: (json['verse'] as num?)?.toInt(),
      surah: json['surah'] as String?,
    );

Map<String, dynamic> _$ReadingProgressResponseToJson(
        ReadingProgressResponse instance) =>
    <String, dynamic>{
      'khitmaStartDate':
          const DateTimeConverter().toJson(instance.khitmaStartDate),
      'khitmaEndDate': const DateTimeConverter().toJson(instance.khitmaEndDate),
      'juz': instance.juz,
      'page': instance.page,
      'verse': instance.verse,
      'surah': instance.surah,
    };
