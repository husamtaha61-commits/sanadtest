import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../repositories/notification_action_repository.dart';

@lazySingleton
class MarkNotificationAsReadUseCase {
  final NotificationActionRepository notificationActionRepository;

  MarkNotificationAsReadUseCase({required this.notificationActionRepository});

  Future<ApiResult> call(int notificationId) async {
    return await notificationActionRepository
        .markNotificationAsRead(notificationId);
  }
}
