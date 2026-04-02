import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_device_token_request.dart';
import '../../data/models/requests/user_settings_request.dart';
import '../entites/user_info.dart';

abstract class UserRepository {
  Future<ApiResult<UserInfo>> getUserInfo(int? userId);
  Future<ApiResult> addDeviceToken(
      UserDeviceTokenRequest userDeviceTokenRequest);
  Future<ApiResult> updateUserSettings(UserSettingsRequest userSettingsRequest);
}
