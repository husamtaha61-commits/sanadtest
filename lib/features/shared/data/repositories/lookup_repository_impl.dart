import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../domain/entites/lookups_data.dart';
import '../../domain/repositories/lookup_repository.dart';
import '../datasource/lookup_remote_datasource.dart';

@LazySingleton(as: LookupRepository)
class LookupRepositoryImpl implements LookupRepository {
  final LookupRemoteDataSource lookupRemoteDataSource;

  LookupRepositoryImpl({required this.lookupRemoteDataSource});

  @override
  Future<ApiResult<LookupsData>> getLookUpsData(List<int> ids) async {
    final result = await lookupRemoteDataSource.getLookUpsData(ids);
    return result.when(
      success: (response) {
        final entity = LookupsData.fromResponse(response);
        return ApiResult.success(entity);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
