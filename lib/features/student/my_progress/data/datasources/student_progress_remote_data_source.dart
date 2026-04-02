import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../models/requests/student_statistics_request.dart';
import '../models/responses/student_statistics_response.dart';

abstract class StudentProgressRemoteDataSource {
  Future<ApiResult<StudentStatisticsResponse>> getStudentStatistics(
    StudentStatisticsRequest studentStatisticsRequest,
  );
}

@LazySingleton(as: StudentProgressRemoteDataSource)
class StudentProgressRemoteDataSourceImp
    implements StudentProgressRemoteDataSource {
  final RetrofitClient retrofitClient;

  StudentProgressRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<StudentStatisticsResponse>> getStudentStatistics(
      StudentStatisticsRequest studentStatisticsRequest) {
    return apiHandler<StudentStatisticsResponse>(
      () => retrofitClient.getStudentStatistics(
        studentStatisticsRequest.readingMinutesAverageInterval,
        studentStatisticsRequest.completedPagesAverageInterval,
      ),
    );
  }
}
