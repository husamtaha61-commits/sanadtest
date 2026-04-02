import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../entities/my_request.dart';
import '../repositories/my_requests_repository.dart';

@lazySingleton
class GetRequestsByIdUseCase {
  final MyRequestsRepository myRequestsRepository;

  GetRequestsByIdUseCase({required this.myRequestsRepository});

  Future<ApiResult<MyRequest>> call(int id) async {
    return await myRequestsRepository.getRequestById(id);
  }
}