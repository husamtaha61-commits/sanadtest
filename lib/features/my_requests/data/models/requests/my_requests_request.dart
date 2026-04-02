class MyRequestsRequest {
  final int? statusId;
  final int? typeId;
  final int? requesterSideId;
  final int? pageNumber;
  final int? pageSize;
  final String? searchTerm;

  MyRequestsRequest({
    this.statusId,
    this.typeId,
    this.requesterSideId,
    this.pageNumber,
    this.pageSize,
    this.searchTerm,
  });
}
