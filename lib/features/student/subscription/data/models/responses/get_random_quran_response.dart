import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_random_quran_response.g.dart';

@JsonSerializable(createToJson: false)
class GetRandomQuranResponse {
  final int minutesToCompleteReading;
  final String chapterName;
  final int chapterId;
  final int fromVerse;
  final int toVerse;
  final List<VerseResponse> verses;

  factory GetRandomQuranResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRandomQuranResponseFromJson(json);

  GetRandomQuranResponse({
    required this.minutesToCompleteReading,
    required this.chapterName,
    required this.chapterId,
    required this.fromVerse,
    required this.toVerse,
    required this.verses,
  });
}

@JsonSerializable(createToJson: false)
class VerseResponse {
  final int id;
  @JsonKey(name: 'verse_number')
  final int verseNumber;
  @JsonKey(name: 'text_uthmani')
  final String textUthmani;
  @JsonKey(name: 'code_v1')
  final String codeV1;
  @JsonKey(name: 'page_number')
  final int pageNumber;

  factory VerseResponse.fromJson(Map<String, dynamic> json) =>
      _$VerseResponseFromJson(json);

  VerseResponse({
    required this.id,
    required this.verseNumber,
    required this.textUthmani,
    required this.codeV1,
    required this.pageNumber,
  });
}
