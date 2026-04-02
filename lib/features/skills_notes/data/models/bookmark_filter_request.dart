class BookmarkFilterRequest {
  final int? pageNumber;
  final int? pageSize;
  final String? sessionId;
  final bool? groupBySurahId;

  BookmarkFilterRequest({
    this.pageNumber,
    this.pageSize,
    this.sessionId,
    this.groupBySurahId,
  });
}
