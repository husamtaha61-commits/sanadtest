part of 'bookmark_cubit.dart';

@freezed
class BookmarkState with _$BookmarkState {
  const factory BookmarkState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<BookmarkGroup> bookmarks,
  }) = _BookmarkState;
}
