import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/reschedule_session_once_request.dart';
import '../repositories/student_my_schedule_repository.dart';

@lazySingleton
class MakeupSessionUseCase {
  final StudentMyScheduleRepository studentMyScheduleRepository;

  MakeupSessionUseCase({required this.studentMyScheduleRepository});

  Future<ApiResult> call(
      RescheduleSessionOnceRequest makeupSessionRequest) async {
    return await studentMyScheduleRepository
        .makeupSessionRequest(makeupSessionRequest);
  }
}
