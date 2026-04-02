import '../../data/models/responses/reciter_student_response.dart';

class ReciterStudent {
  final int id;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String? profileImageUrl;

  ReciterStudent({
    required this.id,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.profileImageUrl,
  });

  factory ReciterStudent.fromResponse(ReciterStudentResponse response) {
    return ReciterStudent(
      id: response.id ?? -1,
      firstName: response.firstName ?? "",
      middleName: response.middleName,
      lastName: response.lastName ?? "",
      profileImageUrl: response.profileImageUrl,
    );
  }
}
