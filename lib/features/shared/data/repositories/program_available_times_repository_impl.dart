import 'package:injectable/injectable.dart';
import '../../../reciter/registration/domain/entities/available_times_options.dart';
import '../datasource/program_available_times_remote_datasource.dart';

import '../../../../../core/network/api_response.dart';
import '../../domain/repositories/program_available_times_repository.dart';

@LazySingleton(as: ProgramAvailableTimesRepository)
class ProgramAvailableTimesRepositoryImpl
    implements ProgramAvailableTimesRepository {
  final ProgramAvailableTimesRemoteDatasource
      programAvailableTimesRemoteDatasource;

  ProgramAvailableTimesRepositoryImpl(
      {required this.programAvailableTimesRemoteDatasource});

  @override
  Future<ApiResult<List<AvailableTimesOptions>>>
      getAvailableTimesOptions() async {
    final result =
        await programAvailableTimesRemoteDatasource.getAvailableTimesOptions();
    return result.when(
      success: (availableTimesOptionsResponse) {
        final grouped =
            AvailableTimesProcessor.fromAvailableTimesOptionsResponseV2(
                availableTimesOptionsResponse);
        return ApiResult.success(grouped);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
