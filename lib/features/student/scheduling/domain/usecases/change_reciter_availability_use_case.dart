import 'package:injectable/injectable.dart';
import '../entites/change_reciter_availability_request.dart';
import '../repositories/reciter_details_repository.dart';

import '../../../../../core/network/api_response.dart';

@lazySingleton
class ChangeReciterAvailabilityUseCase {
  final ReciterDetailsRepository _reciterDetailsRepository;

  ChangeReciterAvailabilityUseCase({
    required ReciterDetailsRepository reciterDetailsRepository
  }) : _reciterDetailsRepository = reciterDetailsRepository;

  Future<ApiResult<bool>> call(List<ChangeReciterAvailabilityRequest> request) async {
    return await _reciterDetailsRepository.changeReciterAvailability(request);
  }
}
