import 'package:injectable/injectable.dart';
import '../entites/reciter.dart';
import '../repositories/reciter_details_repository.dart';

import '../../../../../core/network/api_response.dart';

@lazySingleton
class GetReciterByIdUseCase {
  final ReciterDetailsRepository reciterDetailsRepository;

  GetReciterByIdUseCase({required this.reciterDetailsRepository});

  Future<ApiResult<Reciter>> call(int reciterId) async {
    return await reciterDetailsRepository.getReciterById(reciterId);
  }
}
