// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkGroupResponse _$BookmarkGroupResponseFromJson(
        Map<String, dynamic> json) =>
    BookmarkGroupResponse(
      surahId: (json['surahId'] as num?)?.toInt(),
      bookmarks: (json['bookmarks'] as List<dynamic>?)
          ?.map((e) => BookmarkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookmarkGroupResponseToJson(
        BookmarkGroupResponse instance) =>
    <String, dynamic>{
      'surahId': instance.surahId,
      'bookmarks': instance.bookmarks,
    };

BookmarkResponse _$BookmarkResponseFromJson(Map<String, dynamic> json) =>
    BookmarkResponse(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      associatedUserId: (json['associatedUserId'] as num?)?.toInt(),
      surahName: json['surahName'] as String?,
      sessionId: json['sessionId'] as String?,
      verseKey: json['verseKey'] as String?,
      page: (json['page'] as num?)?.toInt(),
      surahId: (json['surahId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BookmarkResponseToJson(BookmarkResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'associatedUserId': instance.associatedUserId,
      'surahName': instance.surahName,
      'sessionId': instance.sessionId,
      'verseKey': instance.verseKey,
      'page': instance.page,
      'surahId': instance.surahId,
    };
