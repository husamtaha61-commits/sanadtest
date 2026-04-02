// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription_ids_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSubscriptionIdsResponse _$UserSubscriptionIdsResponseFromJson(
        Map<String, dynamic> json) =>
    UserSubscriptionIdsResponse(
      subscriptionId: (json['subscriptionId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserSubscriptionIdsResponseToJson(
        UserSubscriptionIdsResponse instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'userId': instance.userId,
    };
