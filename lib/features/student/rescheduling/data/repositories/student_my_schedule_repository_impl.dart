import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_response.dart';
import '../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../domain/entites/my_schedule.dart';
import '../../domain/repositories/student_my_schedule_repository.dart';
import '../datasources/student_my_schedule_data_source.dart';
import '../models/requests/add_extra_session_request.dart';
import '../models/requests/reschedule_recuuring_sessions_request.dart';
import '../models/requests/reschedule_session_once_request.dart';

@LazySingleton(as: StudentMyScheduleRepository)
class StudentMyScheduleRepositoryImpl implements StudentMyScheduleRepository {
  final StudentMyScheduleDataSource studentMyScheduleDataSource;

  StudentMyScheduleRepositoryImpl({required this.studentMyScheduleDataSource});

  @override
  Future<ApiResult<MySchedule>> getMySchedule() async {
    final result = await studentMyScheduleDataSource.getMySchedule();
    return result.when(
      success: (response) {
        final entity = MySchedule.fromResponse(response);
        return ApiResult.success(entity);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<TimeData>>> getScheduleTimes(int? studentId) async {
    final result =
        await studentMyScheduleDataSource.getScheduleTimes(studentId);

    return result.when(
      success: (response) {
        final timeDates =
            AvailableTimesProcessor.fromTimeDateResponse(response);
        return ApiResult.success(timeDates);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult> rescheduleRecuuringSessionsRequest(
      RescheduleRecuuringSessionsRequest
          rescheduleRecuuringSessionsRequest) async {
    return await studentMyScheduleDataSource
        .rescheduleRecuuringSessionsRequest(rescheduleRecuuringSessionsRequest);
  }

  @override
  Future<ApiResult> rescheduleSessionOnceRequest(
      RescheduleSessionOnceRequest rescheduleSessionOnceRequest) async {
    return await studentMyScheduleDataSource
        .rescheduleSessionOnceRequest(rescheduleSessionOnceRequest);
  }

  @override
  Future<ApiResult> makeupSessionRequest(
      RescheduleSessionOnceRequest makeupSessionRequest) async {
    return await studentMyScheduleDataSource
        .makeupSessionRequest(makeupSessionRequest);
  }

  @override
  Future<ApiResult> addExtraSession(
      AddExtraSessionRequest addExtraSessionRequest) async {
    return await studentMyScheduleDataSource
        .addExtraSession(addExtraSessionRequest);
  }

  @override
  Future<ApiResult> cancelSession(String sessionId) async {
    return await studentMyScheduleDataSource.cancelSession(sessionId);
  }

  @override
  Future<ApiResult<bool>> validateSessionCancellation(String sessionId) async {
    return await studentMyScheduleDataSource
        .validateSessionCancellation(sessionId);
  }
}
