import 'package:injectable/injectable.dart';
import '../repositories/reciter_details_repository.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/schedule_session_request.dart';

@lazySingleton
class StudentScheduleSessionUseCase {
  final ReciterDetailsRepository reciterDetailsRepository;

  StudentScheduleSessionUseCase({required this.reciterDetailsRepository});

  Future<ApiResult> call(ScheduleSessionRequest scheduleSessionRequest) async {
    return await reciterDetailsRepository
        .scheduleSession(scheduleSessionRequest);
  }
}
