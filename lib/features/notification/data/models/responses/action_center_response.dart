import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/utils/date_time_converter.dart';

part 'action_center_response.g.dart';

@JsonSerializable()
class ActionCenterResponse {
  final int? id;
  final String? message;
  final String? title;
  final String? actionName;
  final Map<String, dynamic>? metaDataObject;
  @DateTimeConverter()
  final DateTime? creationDate;

  ActionCenterResponse({
    required this.id,
    required this.message,
    required this.title,
    required this.actionName,
    required this.metaDataObject,
    required this.creationDate,
  });

  factory ActionCenterResponse.fromJson(Map<String, dynamic> json) =>
      _$ActionCenterResponseFromJson(json);
}
