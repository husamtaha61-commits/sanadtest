import 'package:injectable/injectable.dart';
import '../../../reciter/registration/domain/entities/available_times_options.dart';
import '../repositories/program_available_times_repository.dart';

import '../../../../core/network/api_response.dart';

@lazySingleton
class GetProgramAvailableTimesUseCase {
  final ProgramAvailableTimesRepository programAvailableTimesRepository;

  GetProgramAvailableTimesUseCase(
      {required this.programAvailableTimesRepository});

  Future<ApiResult<List<AvailableTimesOptions>>> call() async {
    return await programAvailableTimesRepository.getAvailableTimesOptions();
  }
}
