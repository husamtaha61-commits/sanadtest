import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/notification_filter_request.dart';
import '../entites/notification.dart';
import '../repositories/notification_action_repository.dart';

@lazySingleton
class GetNotificationsUseCase {
  final NotificationActionRepository notificationActionRepository;

  GetNotificationsUseCase({required this.notificationActionRepository});

  Future<ApiResult<List<Notification>>> call(
      NotificationFilterRequest notificationFilterRequest) async {
    return await notificationActionRepository
        .getNotifications(notificationFilterRequest);
  }
}
