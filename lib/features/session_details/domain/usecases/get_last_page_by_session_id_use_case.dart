import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../repositories/session_details_repository.dart';

@lazySingleton
class GetLastPageBySessionIdUseCase {
  final SessionDetailsRepository sessionDetailsRepository;

  GetLastPageBySessionIdUseCase({required this.sessionDetailsRepository});

  Future<ApiResult<int>> call(String sessionId) async {
    return await sessionDetailsRepository.getLastPageBySessionId(sessionId);
  }
}
