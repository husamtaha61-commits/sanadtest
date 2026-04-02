import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../../../session_details/domain/entites/bookmark.dart';
import '../../data/models/bookmark_filter_request.dart';
import '../repositories/skills_notes_repository.dart';

@lazySingleton
class GetAllBookmarksUseCase {
  final SkillsNotesRepository skillsNotesRepository;

  GetAllBookmarksUseCase({required this.skillsNotesRepository});

  Future<ApiResult<List<BookmarkGroup>>> call(
      BookmarkFilterRequest bookmarkFilterRequest) async {
    return await skillsNotesRepository.getAllBookmarks(bookmarkFilterRequest);
  }
}
