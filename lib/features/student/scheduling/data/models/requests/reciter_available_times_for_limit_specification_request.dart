class ReciterAvailableTimesForLimitSpecificationRequest {
  final int reciterId;
  final int? limitByDays;
  final bool? includeQuarters;
  final bool? includesThirds;

  ReciterAvailableTimesForLimitSpecificationRequest({
    required this.reciterId,
    required this.limitByDays,
    required this.includeQuarters,
    this.includesThirds,
  });
}
