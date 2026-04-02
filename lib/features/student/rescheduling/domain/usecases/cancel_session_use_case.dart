import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../repositories/student_my_schedule_repository.dart';

@lazySingleton
class CancelSessionUseCase {
  final StudentMyScheduleRepository studentMyScheduleRepository;

  CancelSessionUseCase({required this.studentMyScheduleRepository});

  Future<ApiResult> call(String sessionId) async {
    return await studentMyScheduleRepository.cancelSession(sessionId);
  }
}
