// get_sanad_minhaj_progress_use_case.dart
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../entites/sanad_minhaj_progress.dart';
import '../repositories/home_repository.dart';

@injectable
class GetSanadMinhajProgressUseCase {
  final HomeRepository _homeRepository;

  GetSanadMinhajProgressUseCase(this._homeRepository);

  Future<ApiResult<List<SanadMinhajCourse>>> call() async {
    return await _homeRepository.getSanadMinhajProgress();
  }
}
