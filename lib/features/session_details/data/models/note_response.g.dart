// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteResponse _$NoteResponseFromJson(Map<String, dynamic> json) => NoteResponse(
      id: (json['id'] as num?)?.toInt(),
      authorId: (json['authorId'] as num?)?.toInt(),
      authorRoles: (json['authorRoles'] as List<dynamic>?)
          ?.map((e) => UserRoleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      viewerId: (json['viewerId'] as num?)?.toInt(),
      surahName: json['surahName'] as String?,
      sessionId: json['sessionId'] as String?,
      verseKey: json['verseKey'] as String?,
      page: (json['page'] as num?)?.toInt(),
      surahId: (json['surahId'] as num?)?.toInt(),
      text: json['text'] as String?,
      isPublic: json['isPublic'] as bool?,
      creationDate:
          const DateTimeConverter().fromJson(json['creationDate'] as String?),
    );

Map<String, dynamic> _$NoteResponseToJson(NoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'authorRoles': instance.authorRoles,
      'viewerId': instance.viewerId,
      'surahName': instance.surahName,
      'sessionId': instance.sessionId,
      'verseKey': instance.verseKey,
      'page': instance.page,
      'surahId': instance.surahId,
      'text': instance.text,
      'isPublic': instance.isPublic,
      'creationDate': const DateTimeConverter().toJson(instance.creationDate),
    };
