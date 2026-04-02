import '../../../../core/network/api_response.dart';

import 'package:injectable/injectable.dart';

import '../../../session_details/domain/entites/bookmark.dart';
import '../../../session_details/domain/entites/note.dart';
import '../../domain/entites/skill.dart';
import '../../domain/entites/user_subscription_ids.dart';
import '../../domain/repositories/skills_notes_repository.dart';
import '../datasources/skills_notes_remote_data_source.dart';
import '../models/bookmark_filter_request.dart';
import '../models/note_filter_request.dart';

@LazySingleton(as: SkillsNotesRepository)
class SkillsNotesRepositoryImpl implements SkillsNotesRepository {
  final SkillsNotesRemoteDataSource skillsNotesRemoteDataSource;

  SkillsNotesRepositoryImpl({required this.skillsNotesRemoteDataSource});

  @override
  Future<ApiResult<List<Note>>> getAllNotes(NoteFilterRequest noteFilterRequest) async {
    final result = await skillsNotesRemoteDataSource.getAllNotes(noteFilterRequest);
    return result.when(
      success: (paginationResponse) {
        final entityList = paginationResponse.data
            .map((noteResponse) => Note.fromResponse(noteResponse)).toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<BookmarkGroup>>> getAllBookmarks(BookmarkFilterRequest bookmarkFilterRequest) async {
    final result = await skillsNotesRemoteDataSource.getAllBookmarks(bookmarkFilterRequest);
    return result.when(
      success: (paginationResponse) {
        final entityList = paginationResponse.data
            .map((bookmarkGroupResponse) =>
                BookmarkGroup.fromResponse(bookmarkGroupResponse))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<UserSubscriptionIds>> getSubscriptionByStudentId(
      int studentId) async {
    final result =
        await skillsNotesRemoteDataSource.getSubscriptionByStudentId(studentId);
    return result.when(
      success: (response) {
        final entity = UserSubscriptionIds.fromResponse(response);
        return ApiResult.success(entity);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<Skill>>> getUserSkillsBySubscriptionId(
      int subscriptionId) async {
    final result = await skillsNotesRemoteDataSource
        .getUserSkillsBySubscriptionId(subscriptionId);
    return result.when(
      success: (response) {
        final entityList = response
            .map((skillResponse) => Skill.fromResponse(skillResponse))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
