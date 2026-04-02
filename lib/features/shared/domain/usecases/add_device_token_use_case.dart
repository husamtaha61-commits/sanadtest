import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_device_token_request.dart';
import '../../../shared/domain/repositories/user_repository.dart';

@lazySingleton
class AddDeviceTokenUseCase {
  final UserRepository userRepository;

  AddDeviceTokenUseCase({required this.userRepository});

  Future<ApiResult> call(UserDeviceTokenRequest userDeviceTokenRequest) async {
    return await userRepository.addDeviceToken(userDeviceTokenRequest);
  }
}
