import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../entites/reciter_student.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetAllReciterStudentsUseCase {
  final HomeRepository homeRepository;

  GetAllReciterStudentsUseCase({required this.homeRepository});

  Future<ApiResult<List<ReciterStudent>>> call() async {
    return await homeRepository.getReciterStudents();
  }
}
