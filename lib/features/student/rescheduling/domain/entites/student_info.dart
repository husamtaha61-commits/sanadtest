import '../../../../session_details/domain/entites/session_details.dart';
import '../../data/models/responses/my_schedule_response.dart';

class StudentInfo {
  final int id;
  final String firstName;
  final String? middleName;
  final String lastName;

  StudentInfo({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
  });

  factory StudentInfo.fromResponse(StudentInfoResponse? response) {
    if (response == null) {
      return StudentInfo(
        id: -1,
        firstName: '',
        middleName: '',
        lastName: '',
      );
    }
    return StudentInfo(
      id: response.id ?? -1,
      firstName: response.firstName ?? '',
      middleName: response.middleName,
      lastName: response.lastName ?? '',
    );
  }

  factory StudentInfo.fromDetailsStudentInfo(DetailsStudentInfo studentInfo) {
    return StudentInfo(
        id: studentInfo.id,
        firstName: studentInfo.firstName,
        middleName:studentInfo.middleName,
        lastName: studentInfo.lastName
    );
  }
}
