import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_expansion_tile.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../session_details/domain/entites/note.dart';
import '../bloc/note/note_cubit.dart';
import 'notes_list_item.dart';
import 'notes_title.dart';
import 'skeletons/notes_list_skeleton.dart';

class NotesList extends StatelessWidget {
  final bool isAuthoredByMe;
  final int? studentId;
  final String? sessionId;

  const NotesList({
    super.key,
    required this.isAuthoredByMe,
    this.studentId,
    this.sessionId
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteCubit>()
        ..getAllNotes(isAuthoredByMe: isAuthoredByMe, studentId: studentId, sessionId: sessionId),
      lazy: false,
      child: _NotesListContent(isAuthoredByMe: isAuthoredByMe, studentId: studentId, sessionId: sessionId ),
    );
  }
}

class _NotesListContent extends StatefulWidget {
  final bool isAuthoredByMe;
  final int? studentId;
  final String? sessionId;

  const _NotesListContent({required this.isAuthoredByMe, this.studentId, this.sessionId});

  @override
  State<_NotesListContent> createState() => _NotesListContentState();
}

class _NotesListContentState extends State<_NotesListContent> {
  @override
  void initState() {
    super.initState();

    final noteCubit = context.read<NoteCubit>();
    noteCubit.pagingController.addPageRequestListener((pageKey) {
      noteCubit.getNotesByPage(pageKey: pageKey,  studentId: widget.studentId, sessionId: widget.sessionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final noteCubit = context.read<NoteCubit>();

    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: AppExpansionTile(
            initiallyExpanded: true,
            title: NotesTitle(isAuthoredByMe: widget.isAuthoredByMe),
            children: [
              state.status.maybeWhen(
                orElse: () => const SizedBox(),
                loading: () => const NotesListSkeleton(),
                success: () => Container(
                  constraints: BoxConstraints(maxHeight: 280.w),
                  child: PagedListView<int, Note>(
                    shrinkWrap: true,
                    pagingController: noteCubit.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Note>(
                      noItemsFoundIndicatorBuilder: (context) {
                        return Text(
                          context.tr(LocaleKeys.notes_noNotesFound),
                          style: AppTextStyles.font12TextW400,
                        );
                      },
                      itemBuilder: (context, item, index) => Padding(
                        padding: EdgeInsets.only(bottom: 10.w),
                        child: NotesListItem(
                          note: item,
                          isAuthoredByMe: widget.isAuthoredByMe,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
