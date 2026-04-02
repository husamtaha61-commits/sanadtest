import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../../../../reciter/registration/data/models/responses/available_times_options_response.dart';
import '../models/requests/add_extra_session_request.dart';
import '../models/requests/reschedule_recuuring_sessions_request.dart';
import '../models/requests/reschedule_session_once_request.dart';
import '../models/responses/my_schedule_response.dart';

abstract class StudentMyScheduleDataSource {
  Future<ApiResult<MyScheduleResponse>> getMySchedule();

  Future<ApiResult<List<TimeDataResponse>>> getScheduleTimes(int? studentId);

  Future<ApiResult> rescheduleRecuuringSessionsRequest(
      RescheduleRecuuringSessionsRequest rescheduleRecuuringSessionsRequest);

  Future<ApiResult> rescheduleSessionOnceRequest(
      RescheduleSessionOnceRequest rescheduleSessionOnceRequest);

  Future<ApiResult> makeupSessionRequest(
      RescheduleSessionOnceRequest makeupSessionRequest);

  Future<ApiResult> cancelSession(String sessionId);

  Future<ApiResult<bool>> validateSessionCancellation(String sessionId);

  Future<ApiResult> addExtraSession(
      AddExtraSessionRequest addExtraSessionRequest);
}

@LazySingleton(as: StudentMyScheduleDataSource)
class StudentMyScheduleDataSourceImp implements StudentMyScheduleDataSource {
  final RetrofitClient retrofitClient;

  StudentMyScheduleDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<MyScheduleResponse>> getMySchedule() {
    return apiHandler<MyScheduleResponse>(
      () => retrofitClient.getMySchedule(),
    );
  }

  @override
  Future<ApiResult<List<TimeDataResponse>>> getScheduleTimes(int? studentId) {
    return apiHandler<List<TimeDataResponse>>(
      () => retrofitClient.getScheduleTimes(studentId),
    );
  }

  @override
  Future<ApiResult> rescheduleRecuuringSessionsRequest(
      RescheduleRecuuringSessionsRequest rescheduleRecuuringSessionsRequest) {
    return apiHandler(
      () => retrofitClient
          .rescheduleRecuuringSessions(rescheduleRecuuringSessionsRequest),
    );
  }

  @override
  Future<ApiResult> rescheduleSessionOnceRequest(
      RescheduleSessionOnceRequest rescheduleSessionOnceRequest) {
    return apiHandler(
      () => retrofitClient.rescheduleSessionOnce(rescheduleSessionOnceRequest),
    );
  }

  @override
  Future<ApiResult> makeupSessionRequest(
      RescheduleSessionOnceRequest makeupSessionRequest) {
    return apiHandler(
      () => retrofitClient.makeupSessionRequest(makeupSessionRequest),
    );
  }

  @override
  Future<ApiResult> cancelSession(String sessionId) {
    return apiHandler(() => retrofitClient.cancelSession(sessionId));
  }

  @override
  validateSessionCancellation(String sessionId) {
    return apiHandler(
        () => retrofitClient.validateSessionCancellation(sessionId));
  }

  @override
  Future<ApiResult> addExtraSession(
      AddExtraSessionRequest addExtraSessionRequest) {
    return apiHandler(
      () => retrofitClient.addExtraSessionRequest(addExtraSessionRequest),
    );
  }
}
