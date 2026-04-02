import 'package:skeletonizer/skeletonizer.dart';

import '../../../features/session_details/domain/entites/note.dart';
import '../../../features/shared/data/models/responses/user_role_response.dart.dart';

final noteFakeData = Note(
  id: 0,
  authorId: 0,
  authorRoles: [UserRoleResponse(comparisonName: "", id: 0, name: "")],
  isPublic: false,
  page: 0,
  sessionId: BoneMock.name,
  surahId: 0,
  surahName: BoneMock.name,
  text: BoneMock.paragraph,
  verseKey: "2:5",
  viewerId: 0,
  creationDate: DateTime.now(),
);
