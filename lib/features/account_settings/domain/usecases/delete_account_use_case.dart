import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../repositories/account_settings_repository.dart';

@lazySingleton
class DeleteAccountUseCase {
  final AccountSettingsRepository accountSettingsRepository;

  DeleteAccountUseCase({required this.accountSettingsRepository});

  Future<ApiResult> call() async {
    return await accountSettingsRepository.deleteAccount();
  }
}
