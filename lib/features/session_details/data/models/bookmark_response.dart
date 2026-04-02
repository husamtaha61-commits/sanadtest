import 'package:json_annotation/json_annotation.dart';
part 'bookmark_response.g.dart';

@JsonSerializable()
class BookmarkGroupResponse {
  final int? surahId;
  final List<BookmarkResponse>? bookmarks;

  factory BookmarkGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$BookmarkGroupResponseFromJson(json);

  BookmarkGroupResponse({
    this.surahId,
    this.bookmarks,
  });

  Map<String, dynamic> toJson() => _$BookmarkGroupResponseToJson(this);
}

@JsonSerializable()
class BookmarkResponse {
  final int? id;
  final int? userId;
  final int? associatedUserId;
  final String? surahName;
  final String? sessionId;
  final String? verseKey;
  final int? page;
  final int? surahId;

  factory BookmarkResponse.fromJson(Map<String, dynamic> json) =>
      _$BookmarkResponseFromJson(json);

  BookmarkResponse({
    this.id,
    this.userId,
    this.associatedUserId,
    this.surahName,
    this.sessionId,
    this.verseKey,
    this.page,
    this.surahId,
  });

  Map<String, dynamic> toJson() => _$BookmarkResponseToJson(this);
}
