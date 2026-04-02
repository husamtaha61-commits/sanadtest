import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../repositories/session_details_repository.dart';
import '../entites/session_details.dart';

@lazySingleton
class GetSessionDetailsBySessionIdUseCase {
  final SessionDetailsRepository sessionDetailsRepository;

  GetSessionDetailsBySessionIdUseCase({required this.sessionDetailsRepository});

  Future<ApiResult<SessionDetails>> call(String sessionId) async {
    return await sessionDetailsRepository.getSessionDetails(sessionId);
  }
}
