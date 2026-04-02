import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../entites/home_section.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetHomeSectionsUseCase {
  final HomeRepository homeRepository;

  GetHomeSectionsUseCase({required this.homeRepository});

  Future<ApiResult<List<HomeSection>>> call() async {
    return await homeRepository.getAllHomeSectionsForStudent();
  }
}
