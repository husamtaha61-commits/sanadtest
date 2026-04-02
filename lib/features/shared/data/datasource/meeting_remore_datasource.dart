import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_response.dart';
import '../../../../../../core/network/retrofit_client.dart';
import '../models/responses/generate_meeting_response.dart';

abstract class MeetingRemoreDatasource {
  Future<ApiResult<GenerateMeetingResponse>> generateMeetingLink(String id);

  Future<ApiResult<bool>> isMeetingRunning(String id);
}

@LazySingleton(as: MeetingRemoreDatasource)
class MeetingRemoreDatasourceImp implements MeetingRemoreDatasource {
  final RetrofitClient retrofitClient;

  MeetingRemoreDatasourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<GenerateMeetingResponse>> generateMeetingLink(String id) {
    return apiHandler(
      () => retrofitClient.generateMeetingLink(id),
    );
  }
  
  @override
  Future<ApiResult<bool>> isMeetingRunning(String id) {
    return apiHandler(
      () => retrofitClient.isMeetingRunning(id),
    );
  }
}
