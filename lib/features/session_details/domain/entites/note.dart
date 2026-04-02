import '../../../shared/data/models/responses/user_role_response.dart.dart';
import '../../data/models/note_response.dart';

class Note {
  final int id;
  final int authorId;
  final List<UserRoleResponse> authorRoles;
  final int? viewerId;
  final String surahName;
  final String sessionId;
  final String verseKey;
  final int page;
  final int surahId;
  final String text;
  final bool isPublic;
  final DateTime creationDate;

  Note({
    required this.id,
    required this.authorId,
    required this.authorRoles,
    required this.viewerId,
    required this.surahName,
    required this.sessionId,
    required this.verseKey,
    required this.page,
    required this.surahId,
    required this.text,
    required this.isPublic,
    required this.creationDate,
  });

  factory Note.fromResponse(NoteResponse response) => Note(
        id: response.id ?? -1,
        authorId: response.authorId ?? -1,
        authorRoles: response.authorRoles ?? [],
        viewerId: response.viewerId,
        surahName: response.surahName ?? "",
        sessionId: response.sessionId ?? "",
        verseKey: response.verseKey ?? "",
        page: response.page ?? 0,
        surahId: response.surahId ?? -1,
        text: response.text ?? "",
        isPublic: response.isPublic ?? false,
        creationDate: response.creationDate ?? DateTime.now(),
      );
}
