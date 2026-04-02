import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../models/responses/reciter_statistics_response.dart';

abstract class ReciterKhitmaProgressRemoteDataSource {
  Future<ApiResult<ReciterStatisticsResponse>> getReciterStatistics();
}

@LazySingleton(as: ReciterKhitmaProgressRemoteDataSource)
class ReciterKhitmaProgressRemoteDataSourceImp
    implements ReciterKhitmaProgressRemoteDataSource {
  final RetrofitClient retrofitClient;

  ReciterKhitmaProgressRemoteDataSourceImp(this.retrofitClient);

  @override
  Future<ApiResult<ReciterStatisticsResponse>> getReciterStatistics() async {
    return apiHandler<ReciterStatisticsResponse>(
      () => retrofitClient.getReciterStatistics(),
    );
  }
}
