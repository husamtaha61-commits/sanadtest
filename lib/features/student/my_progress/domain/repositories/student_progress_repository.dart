import '../../../../../../core/network/api_response.dart';
import '../../data/models/requests/student_statistics_request.dart';
import '../entites/student_statistics.dart';

abstract class StudentProgressRepository {
  Future<ApiResult<StudentStatistics>> getStudentStatistics(
    StudentStatisticsRequest studentStatisticsRequest,
  );
}
