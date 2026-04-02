import '../../data/models/responses/sanad_course_response.dart';

class SanadMinhajCourse {
  final int courseId;
  final String courseTitle;
  final int stepsTotal;
  final int stepsCompleted;
  final int progressPercentage;
  final String progressStatus;

  SanadMinhajCourse({
    required this.courseId,
    required this.courseTitle,
    required this.stepsTotal,
    required this.stepsCompleted,
    required this.progressPercentage,
    required this.progressStatus,
  });

  factory SanadMinhajCourse.fromResponse(SanadCourseResponse response) {
    return SanadMinhajCourse(
      courseId: response.courseId ?? -1,
      courseTitle: response.courseTitle ?? "",
      stepsTotal: response.stepsTotal ?? 0,
      stepsCompleted: response.stepsCompleted ?? 0,
      progressPercentage: response.progressPercentage ?? 0,
      progressStatus: response.progressStatus ?? "",
    );
  }
}
