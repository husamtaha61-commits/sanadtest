import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_response.dart';
import '../../domain/repositories/meeting_repository.dart';

import '../datasource/meeting_remore_datasource.dart';
import '../models/responses/generate_meeting_response.dart';

@LazySingleton(as: MeetingRepository)
class MeetingRepositoryImpl implements MeetingRepository {
  final MeetingRemoreDatasource meetingRemoreDatasource;

  MeetingRepositoryImpl({required this.meetingRemoreDatasource});

  @override
  Future<ApiResult<GenerateMeetingResponse>> generateMeetingLink(
      String id) async {
    return await meetingRemoreDatasource.generateMeetingLink(id);
  }
  
  @override
  Future<ApiResult<bool>> isMeetingRunning(String id)async {
    final result = await meetingRemoreDatasource.isMeetingRunning(id);
    return result;
  }
}
