import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../entites/my_schedule.dart';
import '../repositories/student_my_schedule_repository.dart';

@lazySingleton
class GetStudentMySchedule {
  final StudentMyScheduleRepository studentMyScheduleRepository;

  GetStudentMySchedule({required this.studentMyScheduleRepository});

  Future<ApiResult<MySchedule>> call() async {
    return await studentMyScheduleRepository.getMySchedule();
  }
}
