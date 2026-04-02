import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/network/retrofit_client.dart';
import '../models/requests/user_device_token_request.dart';
import '../models/requests/user_settings_request.dart';
import '../models/responses/user_info_response.dart';

abstract class UserRemoteDataSource {
  Future<ApiResult<UserInfoResponse>> getUserInfo(int? userId);
  Future<ApiResult> addDeviceToken(
      UserDeviceTokenRequest userDeviceTokenRequest);
  Future<ApiResult> updateUserSettings(
      UserSettingsRequest userDeviceTokenRequest);
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImp implements UserRemoteDataSource {
  final RetrofitClient retrofitClient;

  UserRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<UserInfoResponse>> getUserInfo(int? userId) {
    return apiHandler<UserInfoResponse>(
        () => retrofitClient.getUserInfo(userId));
  }

  @override
  Future<ApiResult> addDeviceToken(
      UserDeviceTokenRequest userDeviceTokenRequest) {
    return apiHandler(
        () => retrofitClient.addDeviceToken(userDeviceTokenRequest));
  }

  @override
  Future<ApiResult> updateUserSettings(
      UserSettingsRequest userSettingsRequest) {
    return apiHandler(
        () => retrofitClient.updateUserSettings(userSettingsRequest));
  }
}
