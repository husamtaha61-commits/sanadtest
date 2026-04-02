import 'package:skeletonizer/skeletonizer.dart';

import '../../../features/notification/domain/entites/notification.dart';

final notificationFakeData = Notification(
  id: 0,
  isRead: true,
  isSessionRelated: false,
  message: BoneMock.fullName,
  title: BoneMock.name,
  type: BoneMock.name,
  creationDate: DateTime.now(),
  url: "",
);
