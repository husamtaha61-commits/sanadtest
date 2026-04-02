import 'package:json_annotation/json_annotation.dart';

part 'user_subscription_ids_response.g.dart';

@JsonSerializable()
class UserSubscriptionIdsResponse {
  final int? subscriptionId;
  final int? userId;

  UserSubscriptionIdsResponse(
      {required this.subscriptionId, required this.userId});

  factory UserSubscriptionIdsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionIdsResponseFromJson(json);
}
