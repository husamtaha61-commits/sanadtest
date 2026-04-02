import '../../../../../core/network/api_response.dart';
import '../../data/models/responses/admin_config_response.dart';

abstract class AdminRepository {
  Future<ApiResult<AdminConfigResponse>> getAdminConfig();
}
