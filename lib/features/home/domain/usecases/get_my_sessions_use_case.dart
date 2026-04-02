import 'package:injectable/injectable.dart';
import '../../../student/rescheduling/domain/entites/session.dart';
import '../../data/models/requests/my_sessions_request.dart';

import '../../../../../core/network/api_response.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetMySessionsUseCase {
  final HomeRepository homeRepository;

  GetMySessionsUseCase({required this.homeRepository});

  Future<ApiResult<List<Session>>> call(
      MySessionsRequest mySessionsRequest) async {
    return await homeRepository.getMySessions(mySessionsRequest);
  }
}
