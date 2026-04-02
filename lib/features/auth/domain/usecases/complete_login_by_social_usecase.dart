import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_complete_login_by_social_request.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class CompleteLoginBySocailUseCase {
  final AuthRepository authRepository;

  CompleteLoginBySocailUseCase({required this.authRepository});

  Future<ApiResult> call(
      UserCompleteLoginBySocialRequest userCompleteLoginBySocialRequest) async {
    return await authRepository
        .completeLoginBySocial(userCompleteLoginBySocialRequest);
  }
}
