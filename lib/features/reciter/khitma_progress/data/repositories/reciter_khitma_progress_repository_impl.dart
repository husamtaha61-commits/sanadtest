import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../domain/entites/reciter_statistics.dart';
import '../../domain/repositories/reciter_khitma_progress_repository.dart';
import '../datasources/reciter_khitma_progress_remote_data_source.dart';

@LazySingleton(as: ReciterKhitmaProgressRepository)
class ReciterKhitmaProgressRepositoryImpl
    implements ReciterKhitmaProgressRepository {
  final ReciterKhitmaProgressRemoteDataSource
      reciterKhitmaProgressRemoteDataSource;

  ReciterKhitmaProgressRepositoryImpl(
      {required this.reciterKhitmaProgressRemoteDataSource});

  @override
  Future<ApiResult<ReciterStatistics>> getReciterStatistics() async {
    final result =
        await reciterKhitmaProgressRemoteDataSource.getReciterStatistics();
    return result.when(
      success: (response) {
        final entity = ReciterStatistics.fromResponse(response);
        return ApiResult.success(entity);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
