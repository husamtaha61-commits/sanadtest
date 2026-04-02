import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/responses/reciter_filters_request.dart';
import '../entites/reciter.dart';
import '../repositories/reciter_listing_repository.dart';

@lazySingleton
class GetRecitersUseCase {
  final ReciterListingRepository reciterListingRepository;

  GetRecitersUseCase({required this.reciterListingRepository});

  Future<ApiResult<List<Reciter>>> call(
      ReciterFiltersRequest reciterFiltersRequest) async {
    return await reciterListingRepository.getReciters(reciterFiltersRequest);
  }
}
