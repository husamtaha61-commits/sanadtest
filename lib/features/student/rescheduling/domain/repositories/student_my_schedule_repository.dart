import '../../../../../../core/network/api_response.dart';
import '../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../data/models/requests/add_extra_session_request.dart';
import '../../data/models/requests/reschedule_recuuring_sessions_request.dart';
import '../../data/models/requests/reschedule_session_once_request.dart';
import '../entites/my_schedule.dart';

abstract class StudentMyScheduleRepository {
  Future<ApiResult<MySchedule>> getMySchedule();

  Future<ApiResult<List<TimeData>>> getScheduleTimes(int? studentId);

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
