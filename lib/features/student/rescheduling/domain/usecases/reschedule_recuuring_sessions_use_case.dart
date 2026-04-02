import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/reschedule_recuuring_sessions_request.dart';
import '../repositories/student_my_schedule_repository.dart';

@lazySingleton
class RescheduleRecuuringSessionsUseCase {
  final StudentMyScheduleRepository studentMyScheduleRepository;

  RescheduleRecuuringSessionsUseCase(
      {required this.studentMyScheduleRepository});

  Future<ApiResult> call(
      RescheduleRecuuringSessionsRequest
          rescheduleRecuuringSessionsRequest) async {
    return await studentMyScheduleRepository
        .rescheduleRecuuringSessionsRequest(rescheduleRecuuringSessionsRequest);
  }
}
