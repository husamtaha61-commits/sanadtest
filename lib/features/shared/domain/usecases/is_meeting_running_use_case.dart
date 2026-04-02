import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../repositories/meeting_repository.dart';

@lazySingleton
class IsMeetingRunningUseCase {
  final MeetingRepository meetingRepository;

  IsMeetingRunningUseCase({required this.meetingRepository});

  Future<ApiResult<bool>> call(String id) async {
    return await meetingRepository.isMeetingRunning(id);
  }
}
