import '../../../../core/entities/base_field.dart';
import '../../../shared/domain/entites/user_info.dart';
import '../../data/models/session_details_response.dart';
import 'bookmark.dart';
import 'note.dart';

class SessionDetails {
  final String sessionId;
  final BaseField type;
  final DateTime sessionDateTime;
  final BaseField status;
  final int startPage;
  final int endPage;
  final int durationInMin;
  final List<BookmarkGroup> bookmarks;
  final String recordUrl;
  final List<Note> notes;
  final DetailsStudentInfo reciterInfo;
  final DetailsStudentInfo studentInfo;

  SessionDetails({
    required this.sessionId,
    required this.type,
    required this.sessionDateTime,
    required this.status,
    required this.startPage,
    required this.endPage,
    required this.durationInMin,
    required this.bookmarks,
    required this.recordUrl,
    required this.notes,
    required this.reciterInfo,
    required this.studentInfo,
  });

  factory SessionDetails.fromResponse(SessionDetailsResponse response) =>
      SessionDetails(
        sessionId: response.sessionId ?? "",
        type: BaseField.fromResponse(response.type),
        sessionDateTime: response.sessionDateTime ?? DateTime.now(),
        status: BaseField.fromResponse(response.status),
        startPage: response.startPage ?? 0,
        endPage: response.endPage ?? 0,
        durationInMin: response.durationInMin ?? 0,
        recordUrl: response.recordUrl ?? "",
        bookmarks: (response.bookmarks ?? [])
            .map((bookmarkResponse) =>
                BookmarkGroup.fromResponse(bookmarkResponse))
            .toList(),
        notes: (response.notes ?? [])
            .map((noteResponse) => Note.fromResponse(noteResponse))
            .toList(),
        reciterInfo: DetailsStudentInfo.fromResponse(response.reciterInfo),
        studentInfo: DetailsStudentInfo.fromResponse(response.studentInfo),
      );
}

class DetailsStudentInfo {
  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String profileImageUrl;
  final UserNationality nationality;
  final BaseField mainLanguage;
  final List<BaseField> languages; // teachingLanguages
  final List<BaseField> recitations;

  DetailsStudentInfo({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.profileImageUrl,
    required this.nationality,
    required this.mainLanguage,
    required this.languages,
    required this.recitations,
  });

  factory DetailsStudentInfo.fromResponse(DetailsStudentInfoResponse? response) {
    if (response == null) {
      return DetailsStudentInfo(
        id: -1,
        firstName: "",
        middleName: "",
        lastName: "",
        profileImageUrl: "",
        mainLanguage: BaseField(id: -1, name: ""),
        languages: [],
        nationality: const UserNationality(id: -1, isoCode: "", name: ""),
        recitations: [],
      );
    }
    return DetailsStudentInfo(
      id: response.id ?? -1,
      firstName: response.firstName ?? "",
      middleName: response.middleName ?? "",
      lastName: response.lastName ?? "",
      profileImageUrl: response.profileImageUrl ?? "",
      mainLanguage: BaseField.fromResponse(response.mainLanguage),
      languages: (response.languages ?? [])
          .map((lang) => BaseField.fromResponse(lang))
          .toList(),
      nationality: UserNationality.fromResponse(response.nationality),
      recitations: (response.recitations ?? [])
          .map((recitation) => BaseField.fromResponse(recitation))
          .toList(),
    );
  }
}
