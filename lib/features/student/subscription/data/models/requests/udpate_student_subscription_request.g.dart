// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'udpate_student_subscription_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResubmitSubscriptionRequest _$ResubmitSubscriptionRequestFromJson(
        Map<String, dynamic> json) =>
    ResubmitSubscriptionRequest(
      subscriptionId: (json['SubscriptionId'] as num?)?.toInt(),
      firstName: json['userInfo.FirstName'] as String?,
      lastName: json['userInfo.LastName'] as String?,
      userIdentityTypeId:
          (json['userIdentity.UserIdentityTypeId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResubmitSubscriptionRequestToJson(
        ResubmitSubscriptionRequest instance) =>
    <String, dynamic>{
      'SubscriptionId': instance.subscriptionId,
      'userInfo.FirstName': instance.firstName,
      'userInfo.LastName': instance.lastName,
      'userIdentity.UserIdentityTypeId': instance.userIdentityTypeId,
    };
