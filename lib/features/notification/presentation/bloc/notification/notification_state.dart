part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<Notification> notifications,
    @Default([]) List<Notification> unreadNotifications,
  }) = _NotificationState;
}
