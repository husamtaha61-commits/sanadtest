import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../../../../core/responses/base_pagination_response.dart';
import '../models/requests/action_center_filter_request.dart';
import '../models/requests/notification_filter_request.dart';
import '../models/responses/action_center_response.dart';
import '../models/responses/notification_response.dart';

abstract class NotificationActionRemoteDataSource {
  Future<ApiResult<BasePaginationResponse<NotificationResponse>>>
      getNotifications(NotificationFilterRequest notificationFilterRequest);

  Future<ApiResult> markNotificationAsRead(int notificationId);

  Future<ApiResult> markAllNotificationsAsRead();

  Future<ApiResult<BasePaginationResponse<ActionCenterResponse>>> getActions(
      ActionCenterFilterRequest actionCenterFilterRequest);
}

@LazySingleton(as: NotificationActionRemoteDataSource)
class NotificationActionRemoteDataSourceImp
    implements NotificationActionRemoteDataSource {
  final RetrofitClient retrofitClient;

  NotificationActionRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<BasePaginationResponse<NotificationResponse>>>
      getNotifications(NotificationFilterRequest notificationFilterRequest) {
    return apiHandler<BasePaginationResponse<NotificationResponse>>(
      () => retrofitClient.getNotifications(
        notificationFilterRequest.pageNumber,
        notificationFilterRequest.pageSize,
        notificationFilterRequest.searchTerm,
        notificationFilterRequest.isRead,
      ),
    );
  }

  @override
  Future<ApiResult> markNotificationAsRead(int notificationId) {
    return apiHandler(
      () => retrofitClient.markNotificationAsRead(notificationId),
    );
  }

  @override
  Future<ApiResult> markAllNotificationsAsRead() {
    return apiHandler(
      () => retrofitClient.markAllNotificationsAsRead(),
    );
  }

  @override
  Future<ApiResult<BasePaginationResponse<ActionCenterResponse>>> getActions(
      ActionCenterFilterRequest actionCenterFilterRequest) {
    return apiHandler<BasePaginationResponse<ActionCenterResponse>>(
      () => retrofitClient.getActions(
        actionCenterFilterRequest.pageNumber,
        actionCenterFilterRequest.pageSize,
        actionCenterFilterRequest.searchTerm,
      ),
    );
  }
}
