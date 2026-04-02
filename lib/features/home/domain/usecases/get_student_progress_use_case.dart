import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../entites/student_progress.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetStudentProgressUseCase {
  final HomeRepository homeRepository;

  GetStudentProgressUseCase({required this.homeRepository});

  Future<ApiResult<StudentProgress>> call(int studentId) async {
    return await homeRepository.getStudentProgress(studentId);
  }
}
