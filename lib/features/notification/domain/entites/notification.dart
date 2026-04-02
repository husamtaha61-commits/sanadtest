import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/responses/notification_response.dart';
part 'notification.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class Notification with _$Notification {
  const factory Notification({
    required int id,
    required String type,
    required String title,
    required String message,
    required bool isRead,
    required bool isSessionRelated,
    required DateTime creationDate,
    required String url,
  }) = _Notification;

  factory Notification.fromResponse(NotificationResponse response) =>
      Notification(
        id: response.id ?? -1,
        type: response.type ?? "",
        title: response.title ?? "",
        message: response.message ?? "",
        isRead: response.isRead ?? false,
        isSessionRelated: response.isSessionRelated ?? false,
        creationDate: response.creationDate ?? DateTime.now(),
        url: response.url ?? '',
      );
}
