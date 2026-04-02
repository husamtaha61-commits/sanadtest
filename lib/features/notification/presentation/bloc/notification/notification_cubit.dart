import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../../../core/services/analytics_service.dart';
import '../../../data/models/requests/notification_filter_request.dart';
import '../../../domain/entites/notification.dart';
import '../../../domain/usecases/get_notifications_use_case.dart';
import '../../../domain/usecases/mark_all_notifications_as_read.dart';
import '../../../domain/usecases/mark_notification_as_read_use_case.dart';

part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final MarkNotificationAsReadUseCase _markNotificationAsReadUseCase;
  final MarkAllNotificationsAsRead _markAllNotificationsAsRead;
  NotificationCubit(this._getNotificationsUseCase,
      this._markNotificationAsReadUseCase, this._markAllNotificationsAsRead)
      : super(const NotificationState());

  final int _pageSize = 10;
  final PagingController<int, Notification> pagingController =
      PagingController(firstPageKey: 1);

  void getNotificationByPage({int pageKey = 1}) async {
    if (pageKey == 1) {
      emit(state.copyWith(status: const BaseStatus.loading()));
      pagingController.refresh();
    }

    final response = await _getNotificationsUseCase(NotificationFilterRequest(
      pageNumber: pageKey,
      pageSize: _pageSize,
    ));

    response.when(
      success: (notifications) {
        final isLastPage = notifications.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(notifications);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(notifications, nextPageKey);
        }
        emit(state.copyWith(status: const BaseStatus.success()));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void getUnreadNotifications() async {
    final response = await _getNotificationsUseCase(
        NotificationFilterRequest(
            pageNumber: 1,
            pageSize: _pageSize,
            isRead: false
        ));

    response.when(
      success: (notifications) {
        emit(state.copyWith(unreadNotifications: notifications));
      },
      failure: (_) {},
    );
  }

  void markNotificationAsRead(int notificationId) async {
    final response = await _markNotificationAsReadUseCase(notificationId);
    getUnreadNotifications();

    response.when(
      success: (response) {
        final List<Notification> updatedItems = [];
        final selectedIndex = pagingController.itemList!
            .indexWhere((item) => item.id == notificationId);
        if (selectedIndex != -1) {
          final selectedItem =
              pagingController.itemList!.removeAt(selectedIndex);
          pagingController.itemList!
              .insert(selectedIndex, selectedItem.copyWith(isRead: true));
          updatedItems.addAll(pagingController.itemList ?? []);

          emit(state.copyWith(notifications: updatedItems));
          AnalyticsService.instance.logEvent(
            'push_notification_opened',
            parameters: {
              'notification_id': notificationId,
            },
          );
        }
      },
      failure: (error) => (),
    );
  }

  void markAllNotificationsAsRead() async {
    final response = await _markAllNotificationsAsRead();
    getUnreadNotifications();

    final List<Notification> updatedItems =
        (List<Notification>.from(pagingController.itemList ?? []))
            .map((e) => e.copyWith(isRead: true))
            .toList();

    pagingController.itemList = updatedItems;

    response.when(
      success: (response) => emit(state.copyWith(notifications: updatedItems)),
      failure: (error) => (),
    );
  }
}
