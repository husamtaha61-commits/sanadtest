import 'package:json_annotation/json_annotation.dart';

import '../../../../core/responses/base_field_response.dart';
import '../../../../core/utils/date_time_converter.dart';
import '../../../shared/data/models/responses/user_info_response.dart';
import 'bookmark_response.dart';
import 'note_response.dart';

part 'session_details_response.g.dart';

@JsonSerializable()
class SessionDetailsResponse {
  final String? sessionId;
  final BaseFieldResponse? type;
  @DateTimeConverter()
  final DateTime? sessionDateTime;
  final BaseFieldResponse? status;
  final int? startPage;
  final int? endPage;
  final int? durationInMin;
  final List<BookmarkGroupResponse>? bookmarks;
  final String? recordUrl;
  final List<NoteResponse>? notes;
  final DetailsStudentInfoResponse? reciterInfo;
  final DetailsStudentInfoResponse? studentInfo;

  factory SessionDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionDetailsResponseFromJson(json);

  SessionDetailsResponse({
    this.sessionId,
    this.type,
    this.sessionDateTime,
    this.status,
    this.startPage,
    this.endPage,
    this.durationInMin,
    this.bookmarks,
    this.recordUrl,
    this.notes,
    this.reciterInfo,
    this.studentInfo,
  });

  Map<String, dynamic> toJson() => _$SessionDetailsResponseToJson(this);
}

@JsonSerializable()
class DetailsStudentInfoResponse {
  final int? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? profileImageUrl;
  final UserNationalityResponse? nationality;
  final BaseFieldResponse? mainLanguage;
  final List<BaseFieldResponse>? languages; // teachingLanguages
  final List<BaseFieldResponse>? recitations;

  DetailsStudentInfoResponse({
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

  factory DetailsStudentInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailsStudentInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsStudentInfoResponseToJson(this);
}
