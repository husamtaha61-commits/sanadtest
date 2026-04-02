import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/network/retrofit_client.dart';
import '../models/last_page_response.dart';
import '../models/requests/complete_session_request.dart';
import '../models/session_details_response.dart';

abstract class SessionDetailsRemoteDataSource {
  Future<ApiResult<SessionDetailsResponse>> getSessionDetails(String sessionId);

  Future<ApiResult> completeSession(
    CompleteSessionRequest completeSessionRequest,
  );

  Future<ApiResult<LastPageResponse>> getLastPageBySessionId(String sessionId);
}

@LazySingleton(as: SessionDetailsRemoteDataSource)
class SessionDetailsRemoteDataSourceImp
    implements SessionDetailsRemoteDataSource {
  final RetrofitClient retrofitClient;

  SessionDetailsRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<SessionDetailsResponse>> getSessionDetails(
      String sessionId) {
    return apiHandler<SessionDetailsResponse>(
      () => retrofitClient.getSessionDetails(sessionId),
    );
  }

  @override
  Future<ApiResult> completeSession(
      CompleteSessionRequest completeSessionRequest) {
    return apiHandler(
      () => retrofitClient.completeSession(completeSessionRequest),
    );
  }

  @override
  Future<ApiResult<LastPageResponse>> getLastPageBySessionId(String sessionId) {
    return apiHandler<LastPageResponse>(
      () => retrofitClient.getLastPageBySessionId(sessionId),
    );
  }
}
