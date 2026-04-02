import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/action_center_filter_request.dart';
import '../entites/action_center.dart';

import '../repositories/notification_action_repository.dart';

@lazySingleton
class GetActionsCenterUseCase {
  final NotificationActionRepository notificationActionRepository;

  GetActionsCenterUseCase({required this.notificationActionRepository});

  Future<ApiResult<List<ActionCenter>>> call(
      ActionCenterFilterRequest actionCenterFilterRequest) async {
    return await notificationActionRepository
        .getActions(actionCenterFilterRequest);
  }
}
