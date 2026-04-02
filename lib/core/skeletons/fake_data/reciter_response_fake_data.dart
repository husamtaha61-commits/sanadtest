import 'package:skeletonizer/skeletonizer.dart';

import '../../../features/student/scheduling/domain/entites/reciter.dart';
import 'base_field_response_fake_data.dart';

final reciterResponseFakeData = Reciter(
  id: 0,
  firstName: BoneMock.name,
  middleName: BoneMock.name,
  lastName: BoneMock.name,
  description: BoneMock.longParagraph,
  dateOfBirth: '1999-01-01',
  gender: "",
  profileImageId: BoneMock.name,
  nationalityName: BoneMock.name,
  countryIsocode: BoneMock.name,
  teachingLanguages: [baseFieldResponseFakeData],
  isFavorite: false,
  isReceivingNewStudents: true
);
