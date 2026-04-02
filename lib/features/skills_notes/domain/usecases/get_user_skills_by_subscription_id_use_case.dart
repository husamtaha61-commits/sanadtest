import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../entites/skill.dart';
import '../repositories/skills_notes_repository.dart';

@lazySingleton
class GetUserSkillsBySubscriptionIdUseCase {
  final SkillsNotesRepository skillsNotesRepository;

  GetUserSkillsBySubscriptionIdUseCase({required this.skillsNotesRepository});

  Future<ApiResult<List<Skill>>> call(int subscriptionId) async {
    return await skillsNotesRepository
        .getUserSkillsBySubscriptionId(subscriptionId);
  }
}
