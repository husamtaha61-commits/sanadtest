import 'package:json_annotation/json_annotation.dart';
part 'messaging_token_response.g.dart';

@JsonSerializable(createFactory: false)
class MessagingTokenResponse {
  final String token;

  MessagingTokenResponse({
    required this.token,
  });

  factory MessagingTokenResponse.fromJson(String json) =>
      MessagingTokenResponse(
        token: json,
      );

  Map<String, dynamic> toJson() => _$MessagingTokenResponseToJson(this);
}
