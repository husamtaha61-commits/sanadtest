import '../../data/models/responses/section_type_lookup_response.dart';

class SectionTypeLookup {
  final int id;
  final String name;

  SectionTypeLookup({
    required this.id,
    required this.name,
  });

  factory SectionTypeLookup.fromResponse(SectionTypeLookupResponse response) =>
      SectionTypeLookup(
        id: response.id ?? 0,
        name: response.name ?? "",
      );
}
