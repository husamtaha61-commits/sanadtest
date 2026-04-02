import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../shared/domain/repositories/user_repository.dart';
import '../entites/user_info.dart';

@lazySingleton
class GetUserInfoUseCase {
  final UserRepository userRepository;

  GetUserInfoUseCase({required this.userRepository});

  Future<ApiResult<UserInfo>> call(int? userId) async {
    return await userRepository.getUserInfo(userId);
  }
}
