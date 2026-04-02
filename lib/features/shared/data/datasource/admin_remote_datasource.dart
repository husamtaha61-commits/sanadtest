import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../models/responses/admin_config_response.dart';

abstract class AdminRemoteDatasource {
  Future<ApiResult<AdminConfigResponse>> getAdminConfig();
}

@LazySingleton(as: AdminRemoteDatasource)
class AdminRemoteDatasourceImp implements AdminRemoteDatasource {
  final RetrofitClient retrofitClient;

  AdminRemoteDatasourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<AdminConfigResponse>> getAdminConfig() {
    return apiHandler<AdminConfigResponse>(
      () => retrofitClient.getAdminConfig(),
    );
  }
}
