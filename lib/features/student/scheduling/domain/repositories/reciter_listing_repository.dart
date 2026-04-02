import '../../../../../core/network/api_response.dart';
import '../../data/models/responses/reciter_filters_request.dart';
import '../entites/reciter.dart';

abstract class ReciterListingRepository {
  Future<ApiResult<List<Reciter>>> getReciters(
      ReciterFiltersRequest reciterFiltersRequest);
}
