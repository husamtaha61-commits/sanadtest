import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/responses/action_center_response.dart';

part 'action_center.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class ActionCenter with _$ActionCenter {
  const factory ActionCenter({
    required int id,
    required String actionName,
    required String title,
    required String message,
    required Map<String, dynamic> metaDataObject,
    required DateTime creationDate,
  }) = _ActionCenter;

  factory ActionCenter.fromResponse(ActionCenterResponse response) =>
      ActionCenter(
        id: response.id ?? -1,
        actionName: response.actionName ?? "",
        title: response.title ?? "",
        message: response.message ?? "",
        metaDataObject: response.metaDataObject ?? {},
        creationDate: response.creationDate ?? DateTime.now(),
      );
}
