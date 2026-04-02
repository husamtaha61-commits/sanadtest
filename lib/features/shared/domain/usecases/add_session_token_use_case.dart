import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../repositories/session_token_repository.dart';

@lazySingleton
class AddSessionTokenUseCase {
  final SessionTokenRepository sessionTokenRepository;

  AddSessionTokenUseCase({required this.sessionTokenRepository});

  Future<ApiResult> call(String id) async {
    return await sessionTokenRepository.addSessionToken(id);
  }
}
