import 'package:json_annotation/json_annotation.dart';

part 'global_connection_reciter_response.g.dart';

@JsonSerializable()
class GlobalRecitersSectionResponse {
  final SectionDataResponse? sectionData;
  final int? numOfReciters;
  final int? numOfStudents;
  final int? numOfIjazah;
  final int? numOfItqan;

  GlobalRecitersSectionResponse({
    required this.sectionData,
    required this.numOfReciters,
    required this.numOfStudents,
    required this.numOfIjazah,
    required this.numOfItqan,
  });

  factory GlobalRecitersSectionResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalRecitersSectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalRecitersSectionResponseToJson(this);
}

@JsonSerializable()
class SectionDataResponse {
  final String? title;
  final String? description;
  final String? imageId;

  factory SectionDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SectionDataResponseFromJson(json);

  SectionDataResponse({
    this.title,
    this.description,
    this.imageId,
  });

  Map<String, dynamic> toJson() => _$SectionDataResponseToJson(this);
}
