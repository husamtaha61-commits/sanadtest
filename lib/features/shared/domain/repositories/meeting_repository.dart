import '../../../../../../core/network/api_response.dart';
import '../../data/models/responses/generate_meeting_response.dart';

abstract class MeetingRepository {
  Future<ApiResult<GenerateMeetingResponse>> generateMeetingLink(String id);

  Future<ApiResult<bool>>isMeetingRunning(String id);
}
