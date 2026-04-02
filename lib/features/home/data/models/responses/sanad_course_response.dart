import 'package:json_annotation/json_annotation.dart';

part 'sanad_course_response.g.dart';

@JsonSerializable()
class SanadCourseResponse {
  final int? courseId;
  final String? courseTitle;
  final int? stepsTotal;
  final int? stepsCompleted;
  final int? progressPercentage;
  final String? progressStatus;

  SanadCourseResponse({
    this.courseId,
    this.courseTitle,
    this.stepsTotal,
    this.stepsCompleted,
    this.progressPercentage,
    this.progressStatus,
  });

  factory SanadCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$SanadCourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SanadCourseResponseToJson(this);
}
