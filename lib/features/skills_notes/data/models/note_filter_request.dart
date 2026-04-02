class NoteFilterRequest {
  final int? pageNumber;
  final int? pageSize;
  final bool? isAuthoredByMe;
  final String? sessionId;
  final int? studentId;

  NoteFilterRequest({
    this.pageNumber,
    this.pageSize,
    this.isAuthoredByMe,
    this.sessionId,
    this.studentId
  });
}
