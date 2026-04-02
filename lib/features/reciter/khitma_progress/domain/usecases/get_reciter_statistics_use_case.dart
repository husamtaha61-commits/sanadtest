import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../entites/reciter_statistics.dart';
import '../repositories/reciter_khitma_progress_repository.dart';

@lazySingleton
class GetReciterStatisticsUseCase {
  final ReciterKhitmaProgressRepository reciterKhitmaProgressRepository;

  GetReciterStatisticsUseCase({required this.reciterKhitmaProgressRepository});

  Future<ApiResult<ReciterStatistics>> call() async {
    return await reciterKhitmaProgressRepository.getReciterStatistics();
  }
}
