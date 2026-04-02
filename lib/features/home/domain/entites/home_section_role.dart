import '../../data/models/responses/home_section_role_response.dart';

class HomeSectionRole {
  final int roleId;
  final int homeSectionId;

  HomeSectionRole({
    required this.roleId,
    required this.homeSectionId,
  });

  factory HomeSectionRole.fromResponse(HomeSectionRoleResponse response) =>
      HomeSectionRole(
        roleId: response.roleId ?? 0,
        homeSectionId: response.homeSectionId ?? 0,
      );
}
