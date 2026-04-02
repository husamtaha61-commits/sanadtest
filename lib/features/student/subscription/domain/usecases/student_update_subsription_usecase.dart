import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/requests/udpate_student_subscription_request.dart';
import '../repositories/subscription_repository.dart';

@lazySingleton
class ResubmitSubscriptionUseCase {
  final SubscriptionRepository subscriptionRepository;

  ResubmitSubscriptionUseCase({required this.subscriptionRepository});

  Future<ApiResult<void>> call(ResubmitSubscriptionRequest request) {
    return subscriptionRepository.resubmitSubscription(request);
  }
}
