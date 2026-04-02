import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_expansion_tile.dart';
import '../../../../core/widgets/app_page_subtitle.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../domain/entites/skill.dart';
import '../bloc/skill/skill_cubit.dart';
import 'skeletons/notes_list_skeleton.dart';

class SkillsListHeader extends StatelessWidget {
  final bool isExpanded;
  final void Function(bool value) onExpandStateChange;

  const SkillsListHeader({
    super.key,
    required this.isExpanded,
    required this.onExpandStateChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(children: [
        36.verticalSpace,
        AppExpansionTile(
          initiallyExpanded: isExpanded,
          onExpansionChanged: onExpandStateChange,
          title: const AppPageSubtitle(
            title: LocaleKeys.skills_tittle,
            dividerWidth: 76,
          ),
          children: const [],
        ),
        44.verticalSpace,
      ]),
    );
  }
}

class SkillsList extends StatelessWidget {
  const SkillsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillCubit, SkillState>(
      builder: (context, state) {
        final levels = separateByLevel(state.skills);

        return state.status.maybeWhen(
            success: () {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SizedBox(
                  child: Column(
                    children: [
                      ...levels.map((levelSkills) {
                        return _LevelWithChildren(
                            skill: levelSkills.first,
                            extraCollapsableContent: levelSkills
                                .sublist(1)
                                .map((skill) =>
                                    _ParentWithChildren(skill: skill))
                                .toList());
                      })
                    ],
                  ),
                ),
              );
            },
            loading: () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: const NotesListSkeleton(itemCount: 8)),
            orElse: () => const SizedBox());
      },
    );
  }

  List<List<Skill>> separateByLevel(List<Skill> skills) {
    final List<List<Skill>> levels = [];
    for (var skill in skills) {
      if (skill.type == SkillType.level) {
        levels.add([skill]);
      } else {
        levels.lastOrNull?.add(skill);
      }
    }
    return levels;
  }
}

class _LevelWithChildren extends StatelessWidget {
  const _LevelWithChildren(
      {required this.skill, required this.extraCollapsableContent});

  final Skill skill;
  final List<Widget> extraCollapsableContent;

  @override
  Widget build(BuildContext context) {
    return AppExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill.name,
              style: AppTextStyles.font16TextW600,
            ),
            Text(
              "${skill.childrenCompletionPercentage.toInt()}%",
              style: AppTextStyles.font24GoldenOrangeW600,
            ),
          ],
        ),
        children: [
          const Divider(color: Color(0xffE5ECF2)),
          5.verticalSpace,
          _ChildrenSkills(parentSkill: skill),
          ...extraCollapsableContent
        ]);
  }
}

class _ParentWithChildren extends StatelessWidget {
  const _ParentWithChildren({required this.skill});
  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      skill.type == SkillType.section
          ? _SectionHeader(skill: skill)
          : _SkillWithChildrenHeader(skill: skill),
      _ChildrenSkills(parentSkill: skill),
      10.verticalSpace
    ]);
  }
}

class _ChildrenSkills extends StatelessWidget {
  const _ChildrenSkills({required this.parentSkill});
  final Skill parentSkill;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: const TableBorder(
        verticalInside: BorderSide(color: Color(0xFFE5ECF2)),
        horizontalInside: BorderSide(color: Color(0xFFE5ECF2)),
      ),
      columnWidths: const {
        0: FlexColumnWidth(7),
        1: FlexColumnWidth(1),
      },
      children: parentSkill.children
              ?.map((element) => TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.w),
                          child: Text(element.name),
                        ),
                      ),
                      TableCell(
                        child: SvgPicture.asset(
                          element.isGained ?? false
                              ? Assets.icons.circularCheck.path
                              : Assets.icons.circularWrong.path,
                          width: 20.w,
                        ),
                      )
                    ],
                  ))
              .toList() ??
          [],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.skill});
  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 14.r,
              backgroundColor: !(skill.isGained ?? false)
                  ? AppColors.grey
                  : AppColors.goldenOrange,
              child: skill.isGained ?? false
                  ? SvgPicture.asset(
                      Assets.icons.check.path,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      width: 15.w,
                    )
                  : 15.horizontalSpace,
            ),
            12.horizontalSpace,
            Flexible(
              child: Text(
                skill.name,
                style: AppTextStyles.font14TextW600,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        10.verticalSpace,
      ],
    );
  }
}

class _SkillWithChildrenHeader extends StatelessWidget {
  const _SkillWithChildrenHeader({required this.skill});
  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 12.r,
              backgroundColor: !(skill.isGained ?? false)
                  ? AppColors.grey
                  : AppColors.navyBlue,
              child: skill.isGained ?? false
                  ? SvgPicture.asset(
                      Assets.icons.check.path,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      width: 13.w,
                    )
                  : 13.horizontalSpace,
            ),
            12.horizontalSpace,
            Flexible(
              child: Text(
                skill.name,
                style: AppTextStyles.font12TextW600,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        10.verticalSpace,
      ],
    );
  }
}
