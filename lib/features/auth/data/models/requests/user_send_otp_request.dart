import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_send_otp_request.g.dart';

@JsonSerializable(createFactory: false)
class UserSendOtpRequest {
  final String email;

  UserSendOtpRequest({
    required this.email,
  });

  Map<String, dynamic> toJson() => _$UserSendOtpRequestToJson(this);
}
