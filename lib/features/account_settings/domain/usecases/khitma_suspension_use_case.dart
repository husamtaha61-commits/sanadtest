import 'package:injectable/injectable.dart';
import '../../../../../core/network/api_response.dart';
import '../model/requests/khitma_suspension_request.dart';
import '../repositories/account_settings_repository.dart';

@lazySingleton
class KhitmaSuspensionUseCase {
  final AccountSettingsRepository accountSettingsRepository;

  KhitmaSuspensionUseCase({required this.accountSettingsRepository});
  Future<ApiResult> call(KhitmaSuspensionRequest request) async {
    return await accountSettingsRepository.khitmaSuspension(request);
  }
}
