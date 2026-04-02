import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../entites/program.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetAllProgramsUseCase {
  final HomeRepository homeRepository;

  GetAllProgramsUseCase({required this.homeRepository});

  Future<ApiResult<List<Program>>> call() async {
    return await homeRepository.getAllPrograms();
  }
}
