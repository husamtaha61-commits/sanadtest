import 'package:json_annotation/json_annotation.dart';

part 'section_type_lookup_response.g.dart';

@JsonSerializable()
class SectionTypeLookupResponse {
  final int? id;
  final String? name;

  SectionTypeLookupResponse({
    required this.id,
    required this.name,
  });

  factory SectionTypeLookupResponse.fromJson(Map<String, dynamic> json) =>
      _$SectionTypeLookupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SectionTypeLookupResponseToJson(this);
}
