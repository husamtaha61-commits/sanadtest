import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/responses/admin_config_response.dart';
import '../repositories/admin_repository.dart';

@lazySingleton
class GetAdminConfigUseCase {
  final AdminRepository adminRepository;

  GetAdminConfigUseCase({required this.adminRepository});

  Future<ApiResult<AdminConfigResponse>> call() async {
    return await adminRepository.getAdminConfig();
  }
}
