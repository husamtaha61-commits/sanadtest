import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/date_time_converter.dart';
import '../../../shared/data/models/responses/user_role_response.dart.dart';
part 'note_response.g.dart';

@JsonSerializable()
class NoteResponse {
  final int? id;
  final int? authorId;
  final List<UserRoleResponse>? authorRoles;
  final int? viewerId;
  final String? surahName;
  final String? sessionId;
  final String? verseKey;
  final int? page;
  final int? surahId;
  final String? text;
  final bool? isPublic;
  @DateTimeConverter()
  final DateTime? creationDate;

  NoteResponse({
    this.id,
    this.authorId,
    this.authorRoles,
    this.viewerId,
    this.surahName,
    this.sessionId,
    this.verseKey,
    this.page,
    this.surahId,
    this.text,
    this.isPublic,
    this.creationDate,
  });

  factory NoteResponse.fromJson(Map<String, dynamic> json) =>
      _$NoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NoteResponseToJson(this);
}
