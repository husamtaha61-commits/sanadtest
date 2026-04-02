import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../auth/data/models/requests/user_change_password_request.dart';
import '../repositories/account_settings_repository.dart';

@lazySingleton
class ChangePasswordUseCase {
  final AccountSettingsRepository accountSettingsRepository;

  ChangePasswordUseCase({required this.accountSettingsRepository});

  Future<ApiResult> call(
    ChangePasswordRequest request,
  ) async {
    return await accountSettingsRepository.changePassword(request);
  }
}
