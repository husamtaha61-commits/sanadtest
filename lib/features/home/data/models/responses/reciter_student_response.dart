import 'package:json_annotation/json_annotation.dart';

part 'reciter_student_response.g.dart';

@JsonSerializable()
class ReciterStudentResponse {
  final int? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? profileImageUrl;

  factory ReciterStudentResponse.fromJson(Map<String, dynamic> json) =>
      _$ReciterStudentResponseFromJson(json);

  ReciterStudentResponse({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.profileImageUrl,
  });

  Map<String, dynamic> toJson() => _$ReciterStudentResponseToJson(this);
}
