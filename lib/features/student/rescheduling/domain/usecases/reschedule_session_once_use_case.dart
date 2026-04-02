import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/reschedule_session_once_request.dart';
import '../repositories/student_my_schedule_repository.dart';

@lazySingleton
class RescheduleSessionOnceUseCase {
  final StudentMyScheduleRepository studentMyScheduleRepository;

  RescheduleSessionOnceUseCase({required this.studentMyScheduleRepository});

  Future<ApiResult> call(
      RescheduleSessionOnceRequest rescheduleSessionOnceRequest) async {
    return await studentMyScheduleRepository
        .rescheduleSessionOnceRequest(rescheduleSessionOnceRequest);
  }
}
