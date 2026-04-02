import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/complete_session_request.dart';
import '../repositories/session_details_repository.dart';

@lazySingleton
class CompleteSessionUseCase {
  final SessionDetailsRepository sessionDetailsRepository;

  CompleteSessionUseCase({required this.sessionDetailsRepository});

  Future<ApiResult> call(CompleteSessionRequest completeSessionRequest) async {
    return await sessionDetailsRepository
        .completeSession(completeSessionRequest);
  }
}
