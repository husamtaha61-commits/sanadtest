import 'package:skeletonizer/skeletonizer.dart';

import '../../../features/session_details/domain/entites/bookmark.dart';

final bookmarkGroupFakeData = BookmarkGroup(
  surahId: 0,
  bookmarks: [
    Bookmark(
      id: 0,
      page: 0,
      sessionId: "",
      surahId: 0,
      surahName: BoneMock.name,
      userId: 0,
      verseKey: "0:0",
      associatedUserId: 0,
    )
  ],
);
