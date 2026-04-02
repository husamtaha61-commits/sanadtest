import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../../session_details/domain/entites/bookmark.dart';
import '../../../data/models/bookmark_filter_request.dart';
import '../../../domain/usecases/get_all_bookmarks_use_case.dart';

part 'bookmark_state.dart';
part 'bookmark_cubit.freezed.dart';

@injectable
class BookmarkCubit extends Cubit<BookmarkState> {
  final GetAllBookmarksUseCase _getAllBookmarksUseCase;
  BookmarkCubit(this._getAllBookmarksUseCase) : super(const BookmarkState());

  final int _pageSize = 10;
  final PagingController<int, BookmarkGroup> pagingController =
      PagingController(firstPageKey: 1);

  void getBookmarksByPage({String? sessionId, int? otherUserId, int pageKey = 1}) async {
    if (pageKey == 1) {
      emit(state.copyWith(status: const BaseStatus.loading()));
    }
    final response = await _getAllBookmarksUseCase(BookmarkFilterRequest(
      pageNumber: pageKey,
      pageSize: _pageSize,
      groupBySurahId: true,
      sessionId: sessionId
    ));

    response.when(
      success: (bookmarks) {
        final isLastPage = bookmarks.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(
              bookmarks.map((bookmarkGroup) =>
                          BookmarkGroup(
                              surahId: bookmarkGroup.surahId,
                              bookmarks: bookmarkGroup.bookmarks.where((bookmark)=>bookmark.associatedUserId == otherUserId || otherUserId == null).toList()
                          )).where((bookmarkGroup) => bookmarkGroup.bookmarks.isNotEmpty).toList()
          );
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(bookmarks, nextPageKey);
        }
        emit(state.copyWith(
          status: const BaseStatus.success(),
          bookmarks: bookmarks,
        ));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
