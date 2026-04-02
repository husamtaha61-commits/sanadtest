import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../repositories/student_my_schedule_repository.dart';

@lazySingleton
class GetStudentScheduleTimes {
  final StudentMyScheduleRepository studentMyScheduleRepository;

  GetStudentScheduleTimes({required this.studentMyScheduleRepository});

  Future<ApiResult<List<TimeData>>> call(int? studentId) async {
    return await studentMyScheduleRepository.getScheduleTimes(studentId);
  }
}
