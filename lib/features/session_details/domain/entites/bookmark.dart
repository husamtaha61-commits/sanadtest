import '../../data/models/bookmark_response.dart';

class BookmarkGroup {
  final int surahId;
  final List<Bookmark> bookmarks;

  BookmarkGroup({
    required this.surahId,
    required this.bookmarks,
  });

  factory BookmarkGroup.fromResponse(BookmarkGroupResponse response) =>
      BookmarkGroup(
        surahId: response.surahId ?? -1,
        bookmarks: (response.bookmarks ?? [])
            .map((bookmarkResponse) => Bookmark.fromResponse(bookmarkResponse))
            .toList(),
      );
}

class Bookmark {
  final int id;
  final int userId;
  final String surahName;
  final String sessionId;
  final int associatedUserId;
  final String verseKey;
  final int page;
  final int surahId;

  Bookmark({
    required this.id,
    required this.userId,
    required this.surahName,
    required this.sessionId,
    required this.associatedUserId,
    required this.verseKey,
    required this.page,
    required this.surahId,
  });

  factory Bookmark.fromResponse(BookmarkResponse response) => Bookmark(
        id: response.id ?? -1,
        userId: response.userId ?? -1,
        surahName: response.surahName ?? "",
        sessionId: response.sessionId ?? "",
        verseKey: response.verseKey ?? "",
        page: response.page ?? 0,
        surahId: response.surahId ?? -1,
        associatedUserId: response.associatedUserId ?? -1,
      );
}
