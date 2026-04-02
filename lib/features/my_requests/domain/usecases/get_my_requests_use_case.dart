import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/my_requests_request.dart';
import '../entities/my_request.dart';
import '../repositories/my_requests_repository.dart';

@lazySingleton
class GetMyRequestsUseCase {
  final MyRequestsRepository myRequestsRepository;

  GetMyRequestsUseCase({required this.myRequestsRepository});

  Future<ApiResult<List<MyRequest>>> call(
      MyRequestsRequest myRequestsRequest) async {
    return await myRequestsRepository.getMyRequests(myRequestsRequest);
  }
}
