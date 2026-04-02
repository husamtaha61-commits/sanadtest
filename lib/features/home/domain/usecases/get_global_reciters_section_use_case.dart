import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../entites/global_reciters_section.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetGlobalRecitersSectionUseCase {
  final HomeRepository homeRepository;

  GetGlobalRecitersSectionUseCase({required this.homeRepository});

  Future<ApiResult<GlobalRecitersSection>> call() async {
    return await homeRepository.getGlobalRecitersSection();
  }
}
