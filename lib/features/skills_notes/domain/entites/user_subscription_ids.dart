import '../../data/models/user_subscription_ids_response.dart';

class UserSubscriptionIds {
  final int subscriptionId;
  final int userId;

  UserSubscriptionIds({required this.subscriptionId, required this.userId});

  factory UserSubscriptionIds.fromResponse(
          UserSubscriptionIdsResponse response) =>
      UserSubscriptionIds(
        subscriptionId: response.subscriptionId ?? -1,
        userId: response.userId ?? -1,
      );
}
