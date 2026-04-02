import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_response.dart';

import '../../domain/entites/action_center.dart';
import '../../domain/entites/notification.dart';
import '../../domain/repositories/notification_action_repository.dart';
import '../datasources/notification_action_remote_data_source.dart';
import '../models/requests/action_center_filter_request.dart';
import '../models/requests/notification_filter_request.dart';

@LazySingleton(as: NotificationActionRepository)
class NotificationActionRepositoryImpl implements NotificationActionRepository {
  final NotificationActionRemoteDataSource notificationActionRemoteDataSource;

  NotificationActionRepositoryImpl(
      {required this.notificationActionRemoteDataSource});

  @override
  Future<ApiResult<List<Notification>>> getNotifications(
      NotificationFilterRequest notificationFilterRequest) async {
    final result = await notificationActionRemoteDataSource
        .getNotifications(notificationFilterRequest);
    return result.when(
      success: (paginationResponse) {
        List<Notification> entityList = [];
        entityList = paginationResponse.data
            .map((notificationResponse) =>
                Notification.fromResponse(notificationResponse))
            .toList();

        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult> markNotificationAsRead(int notificationId) async {
    return await notificationActionRemoteDataSource
        .markNotificationAsRead(notificationId);
  }

  @override
  Future<ApiResult> markAllNotificationsAsRead() async {
    return await notificationActionRemoteDataSource
        .markAllNotificationsAsRead();
  }

  @override
  Future<ApiResult<List<ActionCenter>>> getActions(
      ActionCenterFilterRequest actionCenterFilterRequest) async {
    final result = await notificationActionRemoteDataSource
        .getActions(actionCenterFilterRequest);
    return result.when(
      success: (paginationResponse) {
        List<ActionCenter> entityList = [];
        entityList = paginationResponse.data
            .map(
                (actionsResponse) => ActionCenter.fromResponse(actionsResponse))
            .toList();

        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
