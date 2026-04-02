import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device_token_request.g.dart';

@JsonSerializable(createFactory: false)
class UserDeviceTokenRequest {
  final String deviceToken;

  UserDeviceTokenRequest({
    required this.deviceToken,
  });

  Map<String, dynamic> toJson() => _$UserDeviceTokenRequestToJson(this);
}
