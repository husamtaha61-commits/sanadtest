import 'package:skeletonizer/skeletonizer.dart';

import '../../../features/notification/domain/entites/action_center.dart';

final actionCenterFakeData = ActionCenter(
  id: 0,
  message: BoneMock.fullName,
  title: BoneMock.name,
  actionName: BoneMock.name,
  metaDataObject: {},
  creationDate: DateTime.now(),
);
