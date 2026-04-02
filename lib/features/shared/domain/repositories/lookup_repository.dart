import '../../../../../core/network/api_response.dart';
import '../entites/lookups_data.dart';

abstract class LookupRepository {
  Future<ApiResult<LookupsData>> getLookUpsData(List<int> ids);
}
