import 'package:injectable/injectable.dart';
import '../../../../../core/responses/base_pagination_response.dart';
import '../models/responses/reciter_filters_request.dart';
import '../models/responses/reciter_response.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';

abstract class ReciterListingDataSource {
  Future<ApiResult<BasePaginationResponse<ReciterResponse>>> getReciters(
      ReciterFiltersRequest reciterFiltersRequest);
}

@LazySingleton(as: ReciterListingDataSource)
class ReciterListingDataSourceImp implements ReciterListingDataSource {
  final RetrofitClient retrofitClient;

  ReciterListingDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<BasePaginationResponse<ReciterResponse>>> getReciters(
      ReciterFiltersRequest reciterFiltersRequest) {
    return apiHandler<BasePaginationResponse<ReciterResponse>>(
      () => retrofitClient.getReciters(
        reciterFiltersRequest.searchTerm,
        reciterFiltersRequest.days,
        reciterFiltersRequest.periods,
        reciterFiltersRequest.ageRanges,
        reciterFiltersRequest.teachingLanguagesIds,
        reciterFiltersRequest.mainLangaugeId,
        reciterFiltersRequest.nationalityId,
        reciterFiltersRequest.genderId,
        reciterFiltersRequest.recitationId,
        reciterFiltersRequest.pageNumber,
        reciterFiltersRequest.pageSize,
        reciterFiltersRequest.favoritesOnly,
        reciterFiltersRequest.availableForLiveSession,
      ),
    );
  }
}
