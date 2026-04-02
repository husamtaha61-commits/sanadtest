import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/student_statistics_request.dart';
import '../entites/student_statistics.dart';
import '../repositories/student_progress_repository.dart';

@lazySingleton
class GetStudentStatisticsUseCase {
  final StudentProgressRepository studentProgressRepository;

  GetStudentStatisticsUseCase({required this.studentProgressRepository});

  Future<ApiResult<StudentStatistics>> call(
      StudentStatisticsRequest studentStatisticsRequest) async {
    return await studentProgressRepository
        .getStudentStatistics(studentStatisticsRequest);
  }
}
