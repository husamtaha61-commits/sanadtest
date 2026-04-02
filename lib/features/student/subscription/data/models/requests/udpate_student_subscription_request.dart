// lib/features/subscription/data/models/request/resubmit_subscription_request.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'udpate_student_subscription_request.g.dart';

@JsonSerializable()
class ResubmitSubscriptionRequest {
  @JsonKey(name: 'SubscriptionId')
  final int? subscriptionId;

  @JsonKey(name: 'userInfo.FirstName')
  final String? firstName;

  @JsonKey(name: 'userInfo.LastName')
  final String? lastName;

  @JsonKey(name: 'userIdentity.UserIdentityTypeId')
  final int? userIdentityTypeId;

  @JsonKey(ignore: true)
  final List<String>? userIdentityFiles;

  @JsonKey(ignore: true)
  final String? videoPath;

  ResubmitSubscriptionRequest({
    required this.subscriptionId,
    required this.firstName,
    required this.lastName,
    required this.userIdentityTypeId,
    this.userIdentityFiles,
    this.videoPath,
  });

  factory ResubmitSubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$ResubmitSubscriptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResubmitSubscriptionRequestToJson(this);

  Map<String, String> toSimpleMap() {
    final map = <String, String>{};
    if (subscriptionId != null) {
      map['SubscriptionId'] = subscriptionId.toString();
    }
    if (firstName != null) {
      map['userInfo.FirstName'] = firstName!;
    }
    if (lastName != null) {
      map['userInfo.LastName'] = lastName!;
    }
    if (userIdentityTypeId != null) {
      map['userIdentity.UserIdentityTypeId'] = userIdentityTypeId.toString();
    }
    return map;
  }
}
