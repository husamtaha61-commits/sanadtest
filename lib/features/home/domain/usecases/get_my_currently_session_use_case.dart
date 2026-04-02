import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../entites/currently_session.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetCurrentlySessionsUseCase {
  final HomeRepository homeRepository;

  GetCurrentlySessionsUseCase({required this.homeRepository});

  Future<ApiResult<List<CurrentlySession>>> call() async {
    return await homeRepository.getMyCurrentlySessions();
  }
}
