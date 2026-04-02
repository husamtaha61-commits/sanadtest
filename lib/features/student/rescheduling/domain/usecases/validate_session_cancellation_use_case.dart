import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../repositories/student_my_schedule_repository.dart';

@lazySingleton
class ValidateSessionCancellationUseCase {
  final StudentMyScheduleRepository studentMyScheduleRepository;

  ValidateSessionCancellationUseCase({required this.studentMyScheduleRepository});

  Future<ApiResult<bool>> call(String sessionId) async {
    return await studentMyScheduleRepository.validateSessionCancellation(sessionId);
  }
}
