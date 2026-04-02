import 'package:skeletonizer/skeletonizer.dart';

import '../../../features/session_details/domain/entites/session_details.dart';
import '../../../features/shared/domain/entites/user_info.dart';
import 'base_field_response_fake_data.dart';
import 'note_fake_data.dart';

final sessionDetailsFakeData = SessionDetails(
  sessionId: "",
  type: baseFieldResponseFakeData,
  sessionDateTime: DateTime.now(),
  status: baseFieldResponseFakeData,
  startPage: 0,
  endPage: 0,
  durationInMin: 0,
  recordUrl: "",
  bookmarks: [],
  notes: [noteFakeData],
  reciterInfo: reciterInfoFakeData,
  studentInfo: reciterInfoFakeData,
);

final reciterInfoFakeData = DetailsStudentInfo(
  id: 0,
  firstName: BoneMock.name,
  middleName: BoneMock.name,
  lastName: BoneMock.name,
  profileImageUrl: "",
  nationality: UserNationality(id: 0, name: BoneMock.name, isoCode: ""),
  mainLanguage: baseFieldResponseFakeData,
  languages: [baseFieldResponseFakeData],
  recitations: [baseFieldResponseFakeData],
);
