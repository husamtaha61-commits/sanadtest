import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings_request.g.dart';

@JsonSerializable(createFactory: false)
class UserSettingsRequest {
  final String? appLang;

  UserSettingsRequest({
    this.appLang,
  });

  Map<String, dynamic> toJson() => _$UserSettingsRequestToJson(this);
}
