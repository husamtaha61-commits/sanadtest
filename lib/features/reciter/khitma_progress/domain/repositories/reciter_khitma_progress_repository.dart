import '../../../../../core/network/api_response.dart';
import '../entites/reciter_statistics.dart';

abstract class ReciterKhitmaProgressRepository {
  Future<ApiResult<ReciterStatistics>> getReciterStatistics();
}
