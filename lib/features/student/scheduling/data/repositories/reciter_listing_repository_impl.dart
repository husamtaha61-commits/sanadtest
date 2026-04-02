import '../../domain/entites/reciter.dart';
import '../datasources/reciter_listing_data_source.dart';

import '../../../../../core/network/api_response.dart';

import 'package:injectable/injectable.dart';

import '../../domain/repositories/reciter_listing_repository.dart';
import '../models/responses/reciter_filters_request.dart';

@LazySingleton(as: ReciterListingRepository)
class ReciterListingRepositoryImpl implements ReciterListingRepository {
  final ReciterListingDataSource reciterListingDataSource;

  ReciterListingRepositoryImpl({required this.reciterListingDataSource});

  @override
  Future<ApiResult<List<Reciter>>> getReciters(
      ReciterFiltersRequest reciterFiltersRequest) async {
    final result =
        await reciterListingDataSource.getReciters(reciterFiltersRequest);
    return result.when(
      success: (paginationResponse) {
        final entityList = paginationResponse.data
            .map((reciterResponse) => Reciter.fromResponse(reciterResponse))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
