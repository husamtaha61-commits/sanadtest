import '../../../../../core/network/api_response.dart';
import '../../../reciter/registration/domain/entities/available_times_options.dart';

abstract class ProgramAvailableTimesRepository {
  Future<ApiResult<List<AvailableTimesOptions>>> getAvailableTimesOptions();
}
