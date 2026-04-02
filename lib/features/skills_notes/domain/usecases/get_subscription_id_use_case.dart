import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../entites/user_subscription_ids.dart';
import '../repositories/skills_notes_repository.dart';

@lazySingleton
class GetSubscriptionIdUseCase {
  final SkillsNotesRepository skillsNotesRepository;

  GetSubscriptionIdUseCase({required this.skillsNotesRepository});

  Future<ApiResult<UserSubscriptionIds>> call(int studentId) async {
    return await skillsNotesRepository.getSubscriptionByStudentId(studentId);
  }
}
