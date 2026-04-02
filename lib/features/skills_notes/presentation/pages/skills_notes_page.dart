import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_page_action_title.dart';
import '../../../../core/widgets/app_sliver_sized_box.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../bloc/skill/skill_cubit.dart';
import '../widgets/bookmarks_list.dart';
import '../widgets/notes_list.dart';
import '../widgets/skills_list.dart';

@RoutePage()
class SkillsNotesPage extends StatefulWidget {
  const SkillsNotesPage({super.key, this.sessionId, required this.studentId});
  final String? sessionId;
  final int studentId;

  @override
  State<SkillsNotesPage> createState() => _SkillsNotesPageState();
}

class _SkillsNotesPageState extends State<SkillsNotesPage>
    with TickerProviderStateMixin {
  bool skillsListIsExpanded = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      value: 1,
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  toggleSkillsList() =>
      skillsListIsExpanded ? _controller.forward() : _controller.animateBack(0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SkillCubit>()..getSkills(widget.studentId),
      child: AppBlocWrapperScreen(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const AppPageActionTitle(
                    title: LocaleKeys.skills_skillsNotes,
                    withPadding: true,
                  ),
                  52.verticalSpace,
                ],
              ),
            ),
            SliverPadding(
              padding: AppPadding.customScrollView,
              sliver: SliverMainAxisGroup(
                slivers: [
                  NotesList(
                      isAuthoredByMe: false,
                      sessionId: widget.sessionId,
                      studentId: widget.studentId),
                  const AppSliverSizedBox(height: 20),
                  NotesList(isAuthoredByMe: true, sessionId: widget.sessionId),
                  const AppSliverSizedBox(height: 20),
                ],
              ),
            ),
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 60.w,
              collapsedHeight: 60.w,
              expandedHeight: 60.w,
              title: SkillsListHeader(
                  isExpanded: skillsListIsExpanded,
                  onExpandStateChange: (bool value) {
                    setState(() => skillsListIsExpanded = value);
                    toggleSkillsList();
                  }),
            ),
            SliverToBoxAdapter(
              child: SizeTransition(
                sizeFactor: _animation,
                child: const SkillsList(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                bottom: 20.w,
                right: 25.w,
                left: 25.w,
                top: 20.w,
              ),
              sliver: BookmarksList(
                sessionId: widget.sessionId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
