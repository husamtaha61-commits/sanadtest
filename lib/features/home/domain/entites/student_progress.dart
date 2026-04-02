import '../../../../core/entities/base_field.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../student/rescheduling/domain/entites/session.dart';
import '../../data/models/responses/student_progress_response.dart';
import 'program.dart';

class StudentProgress {
  final Program program;
  final ReciterInfo reciterInfo;
  final List<BaseField> recitations;
  final ReadingProgress readingProgress;
  final List<Session> sessions;
  final int completedSessionsCount;

  StudentProgress({
    required this.program,
    required this.reciterInfo,
    required this.recitations,
    required this.readingProgress,
    required this.sessions,
    required this.completedSessionsCount,
  });

  factory StudentProgress.fromResponse(StudentProgressResponse response) =>
      StudentProgress(
        program: Program.fromResponse(response.program),
        readingProgress: ReadingProgress.fromResponse(response.readingProgress),
        recitations: (response.recitations ?? [])
            .map((recitation) => BaseField.fromResponse(recitation))
            .toList(),
        reciterInfo: ReciterInfo.fromResponse(response.reciterInfo),
        sessions: (response.sessions ?? [])
            .map((session) => Session.fromResponse(session))
            .toList(),
        completedSessionsCount: (response.sessions ?? [])
            .where((session) =>
                session.status?.id == SessionStatus.completed.intValue)
            .length,
      );
}

class ReciterInfo {
  final int id;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String profileImageId;

  ReciterInfo({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.profileImageId,
  });

  factory ReciterInfo.fromResponse(ReciterInfoResponse? response) {
    if (response == null) {
      return ReciterInfo(
        id: -1,
        firstName: "",
        middleName: null,
        lastName: "",
        profileImageId: "",
      );
    }
    return ReciterInfo(
      id: response.id ?? -1,
      firstName: response.firstName ?? "",
      middleName: response.middleName,
      lastName: response.lastName ?? "",
      profileImageId: response.profileImageId ?? "",
    );
  }
}

class ReadingProgress {
  final DateTime khitmaStartDate;
  final DateTime khitmaEndDate;
  final int juz;
  final int page;
  final int verse;
  final String surah;

  ReadingProgress({
    required this.khitmaStartDate,
    required this.khitmaEndDate,
    required this.juz,
    required this.page,
    required this.verse,
    required this.surah,
  });

  factory ReadingProgress.fromResponse(ReadingProgressResponse? response) {
    if (response == null) {
      return ReadingProgress(
        khitmaStartDate: DateTime.now(),
        khitmaEndDate: DateTime.now(),
        juz: 0,
        page: 0,
        verse: 0,
        surah: "",
      );
    }
    return ReadingProgress(
      khitmaStartDate: response.khitmaStartDate ?? DateTime.now(),
      khitmaEndDate: response.khitmaEndDate ?? DateTime.now(),
      juz: response.juz ?? 0,
      page: response.page ?? 0,
      verse: response.verse ?? 0,
      surah: response.surah ?? "",
    );
  }
}
