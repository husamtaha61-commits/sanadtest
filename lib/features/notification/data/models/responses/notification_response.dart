import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/utils/date_time_converter.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  final int? id;
  final String? type;
  final String? title;
  final String? message;
  final bool? isRead;
  final bool? isSessionRelated;
  final String? url;
  @DateTimeConverter()
  final DateTime? creationDate;

  NotificationResponse({
    this.id,
    this.type,
    this.title,
    this.message,
    this.isRead,
    this.isSessionRelated,
    this.creationDate,
    this.url,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}
