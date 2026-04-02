import '../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../domain/entites/change_reciter_availability_request.dart';
import '../../domain/entites/reciter.dart';
import '../models/requests/reciter_available_times_for_limit_specification_request.dart';
import '../models/requests/reciter_available_times_specification_request.dart';

import '../../../../../core/network/api_response.dart';

import 'package:injectable/injectable.dart';

import '../../domain/repositories/reciter_details_repository.dart';
import '../datasources/reciter_details_data_source.dart';
import '../models/requests/schedule_session_request.dart';

@LazySingleton(as: ReciterDetailsRepository)
class ReciterDetailsRepositoryImpl implements ReciterDetailsRepository {
  final ReciterDetailsDataSource reciterDetailsDataSource;

  ReciterDetailsRepositoryImpl({required this.reciterDetailsDataSource});

  @override
  Future<ApiResult<Reciter>> getReciterById(int reciterId) async {
    final result = await reciterDetailsDataSource.getReciterById(reciterId);
    return result.when(
      success: (response) {
        final entity = Reciter.fromResponse(response);
        return ApiResult.success(entity);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult> addReciterToFavorite(int reciterId) async {
    return await reciterDetailsDataSource.addReciterToFavorite(reciterId);
  }

  @override
  Future<ApiResult> deleteReciterFromFavorite(int reciterId) async {
    return await reciterDetailsDataSource.deleteReciterFromFavorite(reciterId);
  }

  @override
  Future<ApiResult> scheduleSession(
      ScheduleSessionRequest scheduleSessionRequest) async {
    return await reciterDetailsDataSource
        .scheduleSession(scheduleSessionRequest);
  }

  @override
  Future<ApiResult<List<AvailableTimesOptions>>> getReciterAvailableTimes(
      ReciterAvailableTimesSpecificationRequest
          reciterAvailableTimesSpecificationRequest) async {
    final result = await reciterDetailsDataSource
        .getReciterAvailableTimes(reciterAvailableTimesSpecificationRequest);
    return result.when(
      success: (availableTimesOptionsResponse) {
        final grouped =
            AvailableTimesProcessor.fromAvailableTimesOptionsResponseV2(
          availableTimesOptionsResponse,
        );
        return ApiResult.success(grouped);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<AvailableTimesOptions>>>
      getReciterAvailableTimesForLimit(
          ReciterAvailableTimesForLimitSpecificationRequest
              reciterAvailableTimesForLimitSpecificationRequest) async {
    final result =
        await reciterDetailsDataSource.getReciterAvailableTimesForLimit(
            reciterAvailableTimesForLimitSpecificationRequest);
    return result.when(
      success: (availableTimesOptionsResponse) {
        final grouped =
            AvailableTimesProcessor.fromAvailableTimesOptionsResponseV2(
          availableTimesOptionsResponse,
        );
        return ApiResult.success(grouped);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<bool>> setIsReceivingNewStudents(
      bool isReceivingNewStudents) async {
    return await reciterDetailsDataSource
        .setIsReceivingNewStudents(isReceivingNewStudents);
  }

  @override
  Future<ApiResult<bool>> changeReciterAvailability(List<ChangeReciterAvailabilityRequest> request) async {
    return await reciterDetailsDataSource.changeReciterAvailability(request);
  }
}
