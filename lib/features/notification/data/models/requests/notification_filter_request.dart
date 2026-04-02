class NotificationFilterRequest {
  final int? pageNumber;
  final int? pageSize;
  final String? searchTerm;
  final bool? isRead;

  NotificationFilterRequest({
    this.pageNumber,
    this.pageSize,
    this.searchTerm,
    this.isRead
  });
}
