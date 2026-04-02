import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../datasources/session_details_remote_data_source.dart';
import '../../domain/repositories/session_details_repository.dart';
import '../../domain/entites/session_details.dart';
import '../models/requests/complete_session_request.dart';

@LazySingleton(as: SessionDetailsRepository)
class SessionDetailsRepositoryImpl implements SessionDetailsRepository {
  final SessionDetailsRemoteDataSource sessionDetailsRemoteDataSource;

  SessionDetailsRepositoryImpl({required this.sessionDetailsRemoteDataSource});

  @override
  Future<ApiResult<SessionDetails>> getSessionDetails(String sessionId) async {
    final result =
        await sessionDetailsRemoteDataSource.getSessionDetails(sessionId);
    return result.when(
      success: (response) {
        final entity = SessionDetails.fromResponse(response);
        return ApiResult.success(entity);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult> completeSession(
      CompleteSessionRequest completeSessionRequest) async {
    return await sessionDetailsRemoteDataSource
        .completeSession(completeSessionRequest);
  }

  @override
  Future<ApiResult<int>> getLastPageBySessionId(String sessionId) async {
    final result =
        await sessionDetailsRemoteDataSource.getLastPageBySessionId(sessionId);
    return result.when(
      success: (response) => ApiResult.success(response.page ?? 1),
      failure: (error) => ApiResult.failure(error),
    );
  }
}
