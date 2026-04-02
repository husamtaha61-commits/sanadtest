import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/responses/base_field_response.dart';
import '../../../../../core/utils/date_time_converter.dart';
import '../../../../student/rescheduling/data/models/responses/my_schedule_response.dart';
import 'program_response.dart';

part 'student_progress_response.g.dart';

@JsonSerializable()
class StudentProgressResponse {
  final ProgramResponse? program;
  final ReciterInfoResponse? reciterInfo;
  final List<BaseFieldResponse>? recitations;
  final ReadingProgressResponse? readingProgress;
  final List<SessionResponse>? sessions;

  StudentProgressResponse({
    required this.program,
    required this.reciterInfo,
    required this.recitations,
    required this.readingProgress,
    required this.sessions,
  });

  factory StudentProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentProgressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentProgressResponseToJson(this);
}

@JsonSerializable()
class ReciterInfoResponse {
  final int? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? profileImageId;

  ReciterInfoResponse({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.profileImageId,
  });

  factory ReciterInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ReciterInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReciterInfoResponseToJson(this);
}

@JsonSerializable()
class ReadingProgressResponse {
  @DateTimeConverter()
  final DateTime? khitmaStartDate;
  @DateTimeConverter()
  final DateTime? khitmaEndDate;
  final int? juz;
  final int? page;
  final int? verse;
  final String? surah;

  ReadingProgressResponse({
    required this.khitmaStartDate,
    required this.khitmaEndDate,
    required this.juz,
    required this.page,
    required this.verse,
    required this.surah,
  });

  factory ReadingProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$ReadingProgressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingProgressResponseToJson(this);
}
