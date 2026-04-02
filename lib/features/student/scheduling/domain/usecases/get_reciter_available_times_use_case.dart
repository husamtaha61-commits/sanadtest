import 'package:injectable/injectable.dart';
import '../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../data/models/requests/reciter_available_times_specification_request.dart';
import '../repositories/reciter_details_repository.dart';

import '../../../../../core/network/api_response.dart';

@lazySingleton
class GetReciterAvailableTimesUseCase {
  final ReciterDetailsRepository reciterDetailsRepository;

  GetReciterAvailableTimesUseCase({required this.reciterDetailsRepository});

  Future<ApiResult<List<AvailableTimesOptions>>> call(
      ReciterAvailableTimesSpecificationRequest
          reciterAvailableTimesSpecificationRequest) async {
    return await reciterDetailsRepository
        .getReciterAvailableTimes(reciterAvailableTimesSpecificationRequest);
  }
}
