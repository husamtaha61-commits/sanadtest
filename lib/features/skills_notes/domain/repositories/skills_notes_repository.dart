import '../../../../core/network/api_response.dart';
import '../../../session_details/domain/entites/bookmark.dart';
import '../../../session_details/domain/entites/note.dart';
import '../../data/models/bookmark_filter_request.dart';
import '../../data/models/note_filter_request.dart';
import '../entites/skill.dart';
import '../entites/user_subscription_ids.dart';

abstract class SkillsNotesRepository {
  Future<ApiResult<List<Note>>> getAllNotes(
      NoteFilterRequest noteFilterRequest);

  Future<ApiResult<List<BookmarkGroup>>> getAllBookmarks(
      BookmarkFilterRequest bookmarkFilterRequest);

  Future<ApiResult<UserSubscriptionIds>> getSubscriptionByStudentId(
      int studentId);

  Future<ApiResult<List<Skill>>> getUserSkillsBySubscriptionId(
      int subscriptionId);
}
