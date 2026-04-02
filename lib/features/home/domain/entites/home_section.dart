import '../../data/models/responses/home_section_response.dart';
import '../../data/models/responses/section_type_lookup_response.dart';
import 'home_section_role.dart';
import 'section_type_lookup.dart';

enum SectionType {
  slider(1),
  dashboard(2),
  statistics(3),
  progress(4),
  session(5),
  announcement(6),
  program(7),
  selfLearning(8),
  recitation(9);

  final int value;
  const SectionType(this.value);

  static SectionType fromId(int id) {
    return SectionType.values.firstWhere(
      (type) => type.value == id,
      orElse: () => SectionType.slider,
    );
  }
}

class HomeSection {
  final int sectionTypeId;
  final SectionTypeLookup sectionTypeLookup;
  final String title;
  final bool visible;
  final int orderNumber;
  final int id;
  final List<HomeSectionRole> homeSectionRoles;

  HomeSection({
    required this.sectionTypeId,
    required this.sectionTypeLookup,
    required this.title,
    required this.visible,
    required this.orderNumber,
    required this.id,
    required this.homeSectionRoles,
  });

  SectionType get sectionType => SectionType.fromId(sectionTypeId);

  factory HomeSection.fromResponse(HomeSectionResponse response) => HomeSection(
        // Use response.id as sectionTypeId since backend sends sectionTypeId as 0
        sectionTypeId:
            (response.sectionTypeId != null && response.sectionTypeId! > 0)
                ? response.sectionTypeId!
                : response.id ?? 0,
        sectionTypeLookup: SectionTypeLookup.fromResponse(
            response.sectionTypeLookup ??
                SectionTypeLookupResponse(id: 0, name: "")),
        title: response.title ?? "",
        visible: response.visable ?? false,
        orderNumber: response.orderNumber ?? 0,
        id: response.id ?? 0,
        homeSectionRoles: response.homeSectionRoles
                ?.map((role) => HomeSectionRole.fromResponse(role))
                .toList() ??
            [],
      );
}
