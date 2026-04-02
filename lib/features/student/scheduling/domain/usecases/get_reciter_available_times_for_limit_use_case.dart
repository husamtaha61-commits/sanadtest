import 'package:injectable/injectable.dart';
import '../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../data/models/requests/reciter_available_times_for_limit_specification_request.dart';

import '../repositories/reciter_details_repository.dart';

import '../../../../../core/network/api_response.dart';

@lazySingleton
class GetReciterAvailableTimesForLimitUseCase {
  final ReciterDetailsRepository reciterDetailsRepository;

  GetReciterAvailableTimesForLimitUseCase(
      {required this.reciterDetailsRepository});

  Future<ApiResult<List<AvailableTimesOptions>>> call(
      ReciterAvailableTimesForLimitSpecificationRequest
          reciterAvailableTimesForLimitSpecificationRequest) async {
    return await reciterDetailsRepository.getReciterAvailableTimesForLimit(
        reciterAvailableTimesForLimitSpecificationRequest);
  }
}
