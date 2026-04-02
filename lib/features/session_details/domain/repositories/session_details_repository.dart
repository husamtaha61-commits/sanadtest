import '../../../../core/network/api_response.dart';
import '../../data/models/requests/complete_session_request.dart';
import '../entites/session_details.dart';

abstract class SessionDetailsRepository {
  Future<ApiResult<SessionDetails>> getSessionDetails(String sessionId);

  Future<ApiResult> completeSession(
    CompleteSessionRequest completeSessionRequest,
  );

  Future<ApiResult<int>> getLastPageBySessionId(String sessionId);
}
