import 'package:injectable/injectable.dart';
import '../../../../reciter/registration/data/models/responses/available_times_options_response.dart';
import '../../domain/entites/change_reciter_availability_request.dart';
import '../models/requests/reciter_available_times_for_limit_specification_request.dart';
import '../models/requests/reciter_available_times_specification_request.dart';
import '../models/responses/reciter_response.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../models/requests/add_reciter_to_favorite_request.dart';
import '../models/requests/schedule_session_request.dart';

abstract class ReciterDetailsDataSource {
  Future<ApiResult<ReciterResponse>> getReciterById(int reciterId);
  Future<ApiResult> addReciterToFavorite(int reciterId);
  Future<ApiResult> deleteReciterFromFavorite(int reciterId);
  Future<ApiResult> scheduleSession(
      ScheduleSessionRequest scheduleSessionRequest);
  Future<ApiResult<List<TimeDataResponse>>> getReciterAvailableTimes(
      ReciterAvailableTimesSpecificationRequest
          reciterAvailableTimesSpecificationRequest);

  Future<ApiResult<List<TimeDataResponse>>> getReciterAvailableTimesForLimit(
      ReciterAvailableTimesForLimitSpecificationRequest
          reciterAvailableTimesForLimitSpecificationRequest);

  Future<ApiResult<bool>> setIsReceivingNewStudents(
      bool isReceivingNewStudents);

  Future<ApiResult<bool>> changeReciterAvailability(
      List<ChangeReciterAvailabilityRequest> request);
}

@LazySingleton(as: ReciterDetailsDataSource)
class ReciterDetailsDataSourceImp implements ReciterDetailsDataSource {
  final RetrofitClient retrofitClient;

  ReciterDetailsDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<ReciterResponse>> getReciterById(int reciterId) {
    return apiHandler(
      () => retrofitClient.getReciterById(reciterId),
    );
  }

  @override
  Future<ApiResult> addReciterToFavorite(int reciterId) {
    return apiHandler(
      () => retrofitClient.addReciterToFavorite(AddReciterToFavoriteRequest(
        reciterId: reciterId,
      )),
    );
  }

  @override
  Future<ApiResult> deleteReciterFromFavorite(int reciterId) {
    return apiHandler(
      () =>
          retrofitClient.deleteReciterFromFavorite(AddReciterToFavoriteRequest(
        reciterId: reciterId,
      )),
    );
  }

  @override
  Future<ApiResult> scheduleSession(
      ScheduleSessionRequest scheduleSessionRequest) {
    return apiHandler(
      () => retrofitClient.scheduleSession(scheduleSessionRequest),
    );
  }

  @override
  Future<ApiResult<List<TimeDataResponse>>> getReciterAvailableTimes(
      ReciterAvailableTimesSpecificationRequest
          reciterAvailableTimesSpecificationRequest) {
    return apiHandler(
      () => retrofitClient.getReciterAvailableTimes(
          reciterAvailableTimesSpecificationRequest.reciterId),
    );
  }

  @override
  Future<ApiResult<List<TimeDataResponse>>> getReciterAvailableTimesForLimit(
      ReciterAvailableTimesForLimitSpecificationRequest
          reciterAvailableTimesForLimitSpecificationRequest) {
    return apiHandler(
      () => retrofitClient.getReciterAbailableTimesForLimit(
        reciterAvailableTimesForLimitSpecificationRequest.reciterId,
        reciterAvailableTimesForLimitSpecificationRequest.limitByDays,
        reciterAvailableTimesForLimitSpecificationRequest.includeQuarters,
        reciterAvailableTimesForLimitSpecificationRequest.includesThirds,
      ),
    );
  }

  @override
  Future<ApiResult<bool>> setIsReceivingNewStudents(
      bool isReceivingNewStudents) {
    return apiHandler(
        () => retrofitClient.setIsReceivingNewStudents(isReceivingNewStudents));
  }

  @override
  Future<ApiResult<bool>> changeReciterAvailability(
      List<ChangeReciterAvailabilityRequest> request) {
    return apiHandler(() => retrofitClient.changeReciterAvailability(request));
  }
}
