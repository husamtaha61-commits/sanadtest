// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_random_quran_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRandomQuranResponse _$GetRandomQuranResponseFromJson(
        Map<String, dynamic> json) =>
    GetRandomQuranResponse(
      minutesToCompleteReading:
          (json['minutesToCompleteReading'] as num).toInt(),
      chapterName: json['chapterName'] as String,
      chapterId: (json['chapterId'] as num).toInt(),
      fromVerse: (json['fromVerse'] as num).toInt(),
      toVerse: (json['toVerse'] as num).toInt(),
      verses: (json['verses'] as List<dynamic>)
          .map((e) => VerseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

VerseResponse _$VerseResponseFromJson(Map<String, dynamic> json) =>
    VerseResponse(
      id: (json['id'] as num).toInt(),
      verseNumber: (json['verse_number'] as num).toInt(),
      textUthmani: json['text_uthmani'] as String,
      codeV1: json['code_v1'] as String,
      pageNumber: (json['page_number'] as num).toInt(),
    );
