import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_expansion_tile.dart';
import '../../../../core/widgets/app_page_subtitle.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../session_details/domain/entites/bookmark.dart';
import '../bloc/bookmark/bookmark_cubit.dart';
import 'bookmarks_list_item.dart';
import 'skeletons/bookmarks_list_skeleton.dart';

class BookmarksList extends StatelessWidget {
  const BookmarksList({super.key, this.sessionId, this.otherUserId});
  final int? otherUserId;
  final String? sessionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookmarkCubit>()..getBookmarksByPage(sessionId: sessionId, otherUserId: otherUserId),
      lazy: false,
      child: _BookmarksListContent(sessionId),
    );
  }
}

class _BookmarksListContent extends StatefulWidget {
  const _BookmarksListContent(this.sessionId);
  final String? sessionId;

  @override
  State<_BookmarksListContent> createState() => _BookmarksListContentState();
}

class _BookmarksListContentState extends State<_BookmarksListContent> {
  @override
  void initState() {
    super.initState();

    final bookmarkCubit = context.read<BookmarkCubit>();
    bookmarkCubit.pagingController.addPageRequestListener((pageKey) {
      bookmarkCubit.getBookmarksByPage(pageKey: pageKey, sessionId: widget.sessionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkCubit, BookmarkState>(
      builder: (context, state) {
        final bookmarkCubit = context.read<BookmarkCubit>();

        return SliverToBoxAdapter(
          child: AppExpansionTile(
            initiallyExpanded: true,
            title: const AppPageSubtitle(title: LocaleKeys.bookmarks_title),
            children: [
              state.status.maybeWhen(
                orElse: () => const SizedBox(),
                loading: () => const BookmarksListSkeleton(),
                success: () => Container(
                  constraints: BoxConstraints(maxHeight: 280.w),
                  child: PagedListView<int, BookmarkGroup>(
                    shrinkWrap: true,
                    pagingController: bookmarkCubit.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<BookmarkGroup>(
                      noItemsFoundIndicatorBuilder: (context) {
                        return Text(
                          context.tr(LocaleKeys.bookmarks_noNotesFound),
                          style: AppTextStyles.font12TextW400,
                        );
                      },
                      itemBuilder: (context, item, index) =>
                          BookmarksListItem(bookmarkGroup: item),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
