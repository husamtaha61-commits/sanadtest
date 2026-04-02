import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../../../session_details/domain/entites/note.dart';
import '../../data/models/note_filter_request.dart';
import '../repositories/skills_notes_repository.dart';

@lazySingleton
class GetAllNotesUseCase {
  final SkillsNotesRepository skillsNotesRepository;

  GetAllNotesUseCase({required this.skillsNotesRepository});

  Future<ApiResult<List<Note>>> call(
      NoteFilterRequest noteFilterRequest) async {
    return await skillsNotesRepository.getAllNotes(noteFilterRequest);
  }
}
