import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../repositories/notification_action_repository.dart';

@lazySingleton
class MarkAllNotificationsAsRead {
    final NotificationActionRepository notificationActionRepository;


  MarkAllNotificationsAsRead({required this.notificationActionRepository});

  Future<ApiResult> call() async {
    return await notificationActionRepository.markAllNotificationsAsRead();
  }
}
