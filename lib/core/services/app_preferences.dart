import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../features/shared/data/models/responses/admin_config_response.dart';
import '../../features/shared/domain/entites/lookups_data.dart';
import '../../features/shared/domain/entites/user_info.dart';
import 'localization_service.dart';

enum PreferencesKey {
  lang,
  token,
  tempToken,
  email,
  role,
  userInfo,
  adminConfig,
  lookUpData,
  notifications,
}

@lazySingleton
class AppPreferences {
  final StreamingSharedPreferences streamingPreferences;

  // Streaming shared preferences can't be accessed from Flutter isolates.
  // Therefore, we sometimes need to redundantly add certain values to the regular shared preferences.
  final SharedPreferences preferences;

  AppPreferences(this.streamingPreferences, this.preferences);

  Future<void> storeLang(String value) async {
    await preferences.setString(PreferencesKey.lang.name, value);
    await streamingPreferences.setString(PreferencesKey.lang.name, value);
  }

  String get getLang => streamingPreferences
      .getString(PreferencesKey.lang.name, defaultValue: 'en')
      .getValue();

  void deleteLang() {
    preferences.remove(PreferencesKey.lang.name);
    streamingPreferences.remove(PreferencesKey.lang.name);
  }

    bool get isAr =>
    streamingPreferences
        .getString(PreferencesKey.lang.name, defaultValue: '')
        .getValue() ==
        SupportedL10N.ar.name;

    void setAccessToken(String? value) {
      preferences.setString(PreferencesKey.token.name, value ?? '');
      streamingPreferences.setString(PreferencesKey.token.name, value ?? '');
    }

    String get accessToken => streamingPreferences
        .getString(PreferencesKey.token.name, defaultValue: '')
        .getValue();

    void deleteAccessToken() {
      preferences.remove(PreferencesKey.token.name);
      streamingPreferences.remove(PreferencesKey.token.name);
    }

    void setTempAccessToken(String? value) {
      preferences.setString(PreferencesKey.tempToken.name, value ?? '');
      streamingPreferences.setString(PreferencesKey.tempToken.name, value ?? '');
    }

    String get tempAccessToken => streamingPreferences
        .getString(PreferencesKey.tempToken.name, defaultValue: '')
        .getValue();

    void deleteTempAccessToken() {
      preferences.remove(PreferencesKey.tempToken.name);
      streamingPreferences.remove(PreferencesKey.tempToken.name);
    }

    bool isLoggedIn() {
      final accessToken = streamingPreferences
          .getString(PreferencesKey.token.name, defaultValue: '')
          .getValue();

      return accessToken.isNotEmpty && !JwtDecoder.isExpired(accessToken);
    }

  void setUserEmail(String email) {
    streamingPreferences.setString(PreferencesKey.email.name, email);
  }

  String get email => streamingPreferences
            .getString(PreferencesKey.email.name, defaultValue: '')
            .getValue();

  void cacheUserResponse(UserInfo userResponse) {
    final userResponseString = jsonEncode(userResponse);
    streamingPreferences.setString(PreferencesKey.userInfo.name, userResponseString);
  }

  UserInfo getUserCachedResponse() {
    final userResponseString = streamingPreferences
        .getString(PreferencesKey.userInfo.name, defaultValue: '')
        .getValue();
    return UserInfo.fromJson(jsonDecode(userResponseString));
  }

  void cacheAdminConfigResponse(AdminConfigResponse adminConfigResponse) {
    final adminConfigResponseString = jsonEncode(adminConfigResponse);
    streamingPreferences.setString(
        PreferencesKey.adminConfig.name, adminConfigResponseString);
  }

  AdminConfigResponse? getAdminCachedConfigResponse() {
    final adminConfigResponseString = streamingPreferences
        .getString(PreferencesKey.adminConfig.name, defaultValue: '')
        .getValue();
    return adminConfigResponseString.isNotEmpty
        ? AdminConfigResponse.fromJson(jsonDecode(adminConfigResponseString))
        : null;
  }

  void cacheLookUpDataResponse(LookupsData lookUpsData) {
    final lookUpsDataResponseString = jsonEncode(lookUpsData);
    streamingPreferences.setString(
        PreferencesKey.lookUpData.name, lookUpsDataResponseString);
  }

  LookupsData? getLookUpDataCachedResponse() {
    final lookUpsDataResponseString = streamingPreferences
        .getString(PreferencesKey.lookUpData.name, defaultValue: '')
        .getValue();

    return lookUpsDataResponseString.isNotEmpty
        ? LookupsData.fromJson(jsonDecode(lookUpsDataResponseString))
        : null;
  }
}
