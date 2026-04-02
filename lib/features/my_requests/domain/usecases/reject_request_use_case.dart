import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../repositories/my_requests_repository.dart';

@lazySingleton
class RejectRequestUseCase {
  final MyRequestsRepository myRequestsRepository;

  RejectRequestUseCase({required this.myRequestsRepository});

  Future<ApiResult> call(int requestId) async {
    return await myRequestsRepository.rejectRequest(requestId);
  }
}
