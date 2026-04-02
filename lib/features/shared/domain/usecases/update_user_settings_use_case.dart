import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../shared/domain/repositories/user_repository.dart';
import '../../data/models/requests/user_settings_request.dart';

@lazySingleton
class UpdateUserSettingsUseCase {
  final UserRepository userRepository;

  UpdateUserSettingsUseCase({required this.userRepository});

  Future<ApiResult> call(UserSettingsRequest userSettingsRequest) async {
    return await userRepository.updateUserSettings(userSettingsRequest);
  }
}
