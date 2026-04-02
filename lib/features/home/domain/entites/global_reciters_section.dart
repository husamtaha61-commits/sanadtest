import '../../data/models/responses/global_connection_reciter_response.dart';

class GlobalRecitersSection {
  final SectionData sectionData;
  final int numOfReciters;
  final int numOfStudents;
  final int numOfIjazah;
  final int numOfItqan;

  GlobalRecitersSection({
    required this.sectionData,
    required this.numOfReciters,
    required this.numOfStudents,
    required this.numOfIjazah,
    required this.numOfItqan,
  });

  factory GlobalRecitersSection.fromResponse(
          GlobalRecitersSectionResponse response) =>
      GlobalRecitersSection(
        sectionData: SectionData.fromResponse(response.sectionData),
        numOfReciters: response.numOfReciters ?? 0,
        numOfStudents: response.numOfStudents ?? 0,
        numOfIjazah: response.numOfIjazah ?? 0,
        numOfItqan: response.numOfItqan ?? 0,
      );
}

class SectionData {
  final String title;
  final String description;
  final String imageId;

  SectionData({
    required this.title,
    required this.description,
    required this.imageId,
  });

  factory SectionData.fromResponse(SectionDataResponse? response) {
    if (response == null) {
      return SectionData(
        title: "",
        description: "",
        imageId: "",
      );
    }

    return SectionData(
      title: response.title ?? "",
      description: response.description ?? "",
      imageId: response.imageId ?? "",
    );
  }
}
