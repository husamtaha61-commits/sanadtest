import '../../../../core/network/api_response.dart';
import '../../data/models/requests/action_center_filter_request.dart';
import '../../data/models/requests/notification_filter_request.dart';
import '../entites/action_center.dart';
import '../entites/notification.dart';

abstract class NotificationActionRepository {
  Future<ApiResult<List<Notification>>> getNotifications(
      NotificationFilterRequest notificationFilterRequest);

  Future<ApiResult> markNotificationAsRead(int notificationId);

  Future<ApiResult> markAllNotificationsAsRead();

  Future<ApiResult<List<ActionCenter>>> getActions(
      ActionCenterFilterRequest actionCenterFilterRequest);
}
