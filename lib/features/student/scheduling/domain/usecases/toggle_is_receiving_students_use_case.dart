import 'package:injectable/injectable.dart';
import '../repositories/reciter_details_repository.dart';

import '../../../../../core/network/api_response.dart';

@lazySingleton
class SetIsReceivingStudentsUseCase {
  final ReciterDetailsRepository _reciterDetailsRepository;

  SetIsReceivingStudentsUseCase({
    required ReciterDetailsRepository reciterDetailsRepository
  }) : _reciterDetailsRepository = reciterDetailsRepository;

  Future<ApiResult<bool>> call(bool isReceivingNewStudents) async {
    return await _reciterDetailsRepository.setIsReceivingNewStudents(isReceivingNewStudents);
  }
}
