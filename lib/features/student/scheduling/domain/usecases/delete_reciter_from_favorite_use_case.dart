import 'package:injectable/injectable.dart';
import '../repositories/reciter_details_repository.dart';

import '../../../../../core/network/api_response.dart';

@lazySingleton
class DeleteReciterToFavoriteUseCase {
  final ReciterDetailsRepository reciterDetailsRepository;

  DeleteReciterToFavoriteUseCase({required this.reciterDetailsRepository});

  Future<ApiResult> call(int reciterId) async {
    return await reciterDetailsRepository.deleteReciterFromFavorite(reciterId);
  }
}
