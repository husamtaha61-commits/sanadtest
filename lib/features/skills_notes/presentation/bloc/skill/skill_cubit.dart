import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/models/base_status.dart';
import '../../../domain/entites/skill.dart';
import '../../../domain/usecases/get_subscription_id_use_case.dart';
import '../../../domain/usecases/get_user_skills_by_subscription_id_use_case.dart';

part 'skill_state.dart';
part 'skill_cubit.freezed.dart';

@injectable
class SkillCubit extends Cubit<SkillState> {
  final GetSubscriptionIdUseCase _getSubscriptionIdUseCase;
  final GetUserSkillsBySubscriptionIdUseCase
      _getUserSkillsBySubscriptionIdUseCase;
  SkillCubit(this._getSubscriptionIdUseCase,
      this._getUserSkillsBySubscriptionIdUseCase)
      : super(const SkillState());

  void getSkills(int studentId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _getSubscriptionIdUseCase(studentId);
    response.when(
      success: (response) async {
        final skillsResponse = await _getUserSkillsBySubscriptionIdUseCase(
            response.subscriptionId);

        skillsResponse.when(
          success: (skills) => emit(state.copyWith(
              status: const BaseStatus.success(),
              skills: _getTypesAndFlattenList(skills))),
          failure: (error) =>
              emit(state.copyWith(status: const BaseStatus.failure())),
        );
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  List<Skill> _getTypesAndFlattenList(List<Skill> skills) {
    final List<Skill> parentFlatList = [];
    // to prevent an infinite loop when there is a cycle in the skill tree
    final Set<int> visitedSkills = {};

    // ignore: non_constant_identifier_names
    List<Skill> DFS(List<Skill> skills, int depth) {
      final List<Skill> leafSkills = [];

      for (var skill in skills) {
        if (visitedSkills.contains(skill.id)) {
          getIt<FirebaseCrashlytics>().recordError(
              Exception("cycle in the skill tree detected"), StackTrace.current,
              fatal: true);
          return [];
        }
        visitedSkills.add(skill.id);

        final type = depth == 1
            ? SkillType.level
            : depth == 2
                ? SkillType.section
                : skill.hasChildren
                    ? SkillType.skillWithChildren
                    : SkillType.skillWithoutChildren;

        if (!skill.hasChildren && depth > 1) {
          leafSkills.add(skill.copyWith(type: type));
        } else {
          parentFlatList.add(skill.copyWith(type: type));
        }
        final skillIndex = parentFlatList.length - 1;

        if (skill.hasChildren && depth < 3) {
          parentFlatList[skillIndex] = parentFlatList[skillIndex]
              .copyWith(children: DFS(skill.children!, depth + 1));
        }
      }

      return leafSkills;
    }

    DFS(skills, 1);
    return parentFlatList;
  }
}
