import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../domain/entites/student_statistics.dart';
import '../../domain/repositories/student_progress_repository.dart';
import '../datasources/student_progress_remote_data_source.dart';
import '../models/requests/student_statistics_request.dart';

@LazySingleton(as: StudentProgressRepository)
class StudentProgressRepositoryImpl implements StudentProgressRepository {
  final StudentProgressRemoteDataSource studentProgressRemoteDataSource;

  StudentProgressRepositoryImpl(
      {required this.studentProgressRemoteDataSource});

  @override
  Future<ApiResult<StudentStatistics>> getStudentStatistics(
      StudentStatisticsRequest studentStatisticsRequest) async {
    final result = await studentProgressRemoteDataSource
        .getStudentStatistics(studentStatisticsRequest);
    return result.when(
      success: (response) {
        final entity = StudentStatistics.fromResponse(response);
        return ApiResult.success(entity);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
