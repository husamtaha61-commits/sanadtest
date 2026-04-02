import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../../../reciter/registration/data/models/responses/available_times_options_response.dart';

abstract class ProgramAvailableTimesRemoteDatasource {
  Future<ApiResult<List<TimeDataResponse>>> getAvailableTimesOptions();
}

@LazySingleton(as: ProgramAvailableTimesRemoteDatasource)
class ProgramAvailableTimesRemoteDatasourceImp
    implements ProgramAvailableTimesRemoteDatasource {
  final RetrofitClient retrofitClient;

  ProgramAvailableTimesRemoteDatasourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<List<TimeDataResponse>>> getAvailableTimesOptions() {
    return apiHandler<List<TimeDataResponse>>(
      () => retrofitClient.getAvailableTimesOptions(),
    );
  }
}
