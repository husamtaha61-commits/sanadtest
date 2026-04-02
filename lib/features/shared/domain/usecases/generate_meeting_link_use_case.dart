import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/responses/generate_meeting_response.dart';
import '../repositories/meeting_repository.dart';

@lazySingleton
class GenerateMeetingLinkUseCase {
  final MeetingRepository meetingRepository;

  GenerateMeetingLinkUseCase({required this.meetingRepository});

  Future<ApiResult<GenerateMeetingResponse>> call(String id) async {
    return await meetingRepository.generateMeetingLink(id);
  }
}
