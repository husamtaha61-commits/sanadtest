import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasource/admin_remote_datasource.dart';

import '../models/responses/admin_config_response.dart';

@LazySingleton(as: AdminRepository)
class AdminRepositoryImpl implements AdminRepository {
  final AdminRemoteDatasource adminRemoteDatasource;

  AdminRepositoryImpl({required this.adminRemoteDatasource});

  @override
  Future<ApiResult<AdminConfigResponse>> getAdminConfig() async {
    return await adminRemoteDatasource.getAdminConfig();
  }
}
