class ReciterFiltersRequest {
  final String? searchTerm;
  final List<int>? days;
  final List<int>? periods;
  final List<int>? ageRanges;
  final int? mainLangaugeId;
  final List<int>? teachingLanguagesIds;
  final int? nationalityId;
  final int? genderId;
  final int? recitationId;
  final int? pageNumber;
  final int? pageSize;
  final bool? favoritesOnly;
  final int? programId;
  final bool? availableForLiveSession;
  ReciterFiltersRequest({
    this.searchTerm,
    this.days,
    this.periods,
    this.ageRanges,
    this.mainLangaugeId,
    this.teachingLanguagesIds,
    this.nationalityId,
    this.genderId,
    this.recitationId,
    this.pageNumber,
    this.pageSize,
    this.favoritesOnly,
    this.programId,
    this.availableForLiveSession,
  });
}
