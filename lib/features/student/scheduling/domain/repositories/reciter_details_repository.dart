import '../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../data/models/requests/reciter_available_times_for_limit_specification_request.dart';
import '../../data/models/requests/reciter_available_times_specification_request.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/schedule_session_request.dart';
import '../entites/change_reciter_availability_request.dart';
import '../entites/reciter.dart';

abstract class ReciterDetailsRepository {
  Future<ApiResult<Reciter>> getReciterById(int reciterId);
  Future<ApiResult> addReciterToFavorite(int reciterId);
  Future<ApiResult> scheduleSession(
      ScheduleSessionRequest scheduleSessionRequest);
  Future<ApiResult> deleteReciterFromFavorite(int reciterId);
  Future<ApiResult<List<AvailableTimesOptions>>> getReciterAvailableTimes(
      ReciterAvailableTimesSpecificationRequest
          reciterAvailableTimesSpecificationRequest);
  Future<ApiResult<List<AvailableTimesOptions>>>
      getReciterAvailableTimesForLimit(
          ReciterAvailableTimesForLimitSpecificationRequest
              reciterAvailableTimesForLimitSpecificationRequest
      );
  Future<ApiResult<bool>> setIsReceivingNewStudents(bool isReceivingNewStudents);
  Future<ApiResult<bool>> changeReciterAvailability(List<ChangeReciterAvailabilityRequest> request);
}
