import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../models/responses/lookups_data_response.dart';

abstract class LookupRemoteDataSource {
  Future<ApiResult<LookUpsDataResponse>> getLookUpsData(List<int> ids);
}

@LazySingleton(as: LookupRemoteDataSource)
class LookupRemoteDataSourceImp implements LookupRemoteDataSource {
  final RetrofitClient retrofitClient;

  LookupRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<LookUpsDataResponse>> getLookUpsData(List<int> ids) {
    return apiHandler<LookUpsDataResponse>(
      () => retrofitClient.getLookUpsData(ids),
    );
  }
}
