import 'package:skeletonizer/skeletonizer.dart';

import '../../../features/my_requests/data/models/responses/my_requests_response.dart';
import '../../../features/my_requests/domain/entities/my_request.dart';
import '../../../features/shared/data/models/responses/user_role_response.dart.dart';
import '../../responses/base_field_response.dart';
import 'available_times_options_response_fake_data.dart';

final myRequestResponseFakeData = MyRequest(
  requestId: 1,
  status: Status(id: 1, name: BoneMock.name),
  type: BaseFieldResponse(id: 1, name: BoneMock.name),
  sender: UserSenderReciever(
    id: 1,
    firstName: BoneMock.name,
    middleName: BoneMock.name,
    lastName: BoneMock.name,
    profileImageUrl: null,
    description: null,
    dateOfBirth: DateTime.now(),
    roles: [
      UserRoleResponse(
        id: 1,
        comparisonName: BoneMock.name,
        name: BoneMock.name,
      ),
    ],
  ),
  reciever: UserSenderReciever(
    id: 1,
    firstName: BoneMock.name,
    middleName: BoneMock.name,
    lastName: BoneMock.name,
    profileImageUrl: null,
    description: null,
    dateOfBirth: DateTime.now(),
    roles: [
      UserRoleResponse(
        id: 1,
        comparisonName: BoneMock.name,
        name: BoneMock.name,
      ),
    ],
  ),
  creationDate: DateTime.now(),
  oldSessionTime: DateTime.now(),
  scheduleTimes: [timeDataFakeData],
  previousScheduleTimes: [timeDataFakeData],
  timeSuggestions: [timeSuggestionsFakeDate],
);
