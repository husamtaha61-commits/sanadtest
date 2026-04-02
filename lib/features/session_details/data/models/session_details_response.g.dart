// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionDetailsResponse _$SessionDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    SessionDetailsResponse(
      sessionId: json['sessionId'] as String?,
      type: json['type'] == null
          ? null
          : BaseFieldResponse.fromJson(json['type'] as Map<String, dynamic>),
      sessionDateTime: const DateTimeConverter()
          .fromJson(json['sessionDateTime'] as String?),
      status: json['status'] == null
          ? null
          : BaseFieldResponse.fromJson(json['status'] as Map<String, dynamic>),
      startPage: (json['startPage'] as num?)?.toInt(),
      endPage: (json['endPage'] as num?)?.toInt(),
      durationInMin: (json['durationInMin'] as num?)?.toInt(),
      bookmarks: (json['bookmarks'] as List<dynamic>?)
          ?.map(
              (e) => BookmarkGroupResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      recordUrl: json['recordUrl'] as String?,
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => NoteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      reciterInfo: json['reciterInfo'] == null
          ? null
          : DetailsStudentInfoResponse.fromJson(
              json['reciterInfo'] as Map<String, dynamic>),
      studentInfo: json['studentInfo'] == null
          ? null
          : DetailsStudentInfoResponse.fromJson(
              json['studentInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionDetailsResponseToJson(
        SessionDetailsResponse instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'type': instance.type,
      'sessionDateTime':
          const DateTimeConverter().toJson(instance.sessionDateTime),
      'status': instance.status,
      'startPage': instance.startPage,
      'endPage': instance.endPage,
      'durationInMin': instance.durationInMin,
      'bookmarks': instance.bookmarks,
      'recordUrl': instance.recordUrl,
      'notes': instance.notes,
      'reciterInfo': instance.reciterInfo,
      'studentInfo': instance.studentInfo,
    };

DetailsStudentInfoResponse _$DetailsStudentInfoResponseFromJson(
        Map<String, dynamic> json) =>
    DetailsStudentInfoResponse(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      nationality: json['nationality'] == null
          ? null
          : UserNationalityResponse.fromJson(
              json['nationality'] as Map<String, dynamic>),
      mainLanguage: json['mainLanguage'] == null
          ? null
          : BaseFieldResponse.fromJson(
              json['mainLanguage'] as Map<String, dynamic>),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      recitations: (json['recitations'] as List<dynamic>?)
          ?.map((e) => BaseFieldResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailsStudentInfoResponseToJson(
        DetailsStudentInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'profileImageUrl': instance.profileImageUrl,
      'nationality': instance.nationality,
      'mainLanguage': instance.mainLanguage,
      'languages': instance.languages,
      'recitations': instance.recitations,
    };
