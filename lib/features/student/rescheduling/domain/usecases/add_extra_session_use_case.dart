import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/add_extra_session_request.dart';
import '../repositories/student_my_schedule_repository.dart';

@lazySingleton
class AddExtraSessionUseCase {
  final StudentMyScheduleRepository studentMyScheduleRepository;
  AddExtraSessionUseCase({required this.studentMyScheduleRepository});
  Future<ApiResult> call(AddExtraSessionRequest addExtraSessionRequest) async {
    return await studentMyScheduleRepository
        .addExtraSession(addExtraSessionRequest);
  }
}
