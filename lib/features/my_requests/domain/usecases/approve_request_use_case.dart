import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/approve_request_request.dart';
import '../repositories/my_requests_repository.dart';

@lazySingleton
class ApproveRequestUseCase {
  final MyRequestsRepository myRequestsRepository;

  ApproveRequestUseCase({required this.myRequestsRepository});

  Future<ApiResult> call(ApproveRequestRequest approveRequestRequest) async {
    return await myRequestsRepository.approveRequest(approveRequestRequest);
  }
}
