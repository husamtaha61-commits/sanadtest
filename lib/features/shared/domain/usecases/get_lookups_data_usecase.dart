import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../entites/lookups_data.dart';
import '../repositories/lookup_repository.dart';

@lazySingleton
class GetLookUpsDataUseCase {
  final LookupRepository lookupRepository;

  GetLookUpsDataUseCase({required this.lookupRepository});

  Future<ApiResult<LookupsData>> call(List<int> ids) async {
    return await lookupRepository.getLookUpsData(ids);
  }
}
