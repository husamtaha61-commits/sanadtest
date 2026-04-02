import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../domain/entites/user_info.dart';
import '../../domain/repositories/user_repository.dart';
import '../../../shared/data/datasource/user_remote_data_source.dart';
import '../models/requests/user_device_token_request.dart';
import '../models/requests/user_settings_request.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<ApiResult<UserInfo>> getUserInfo(int? userId) async {
    final result = await userRemoteDataSource.getUserInfo(userId);
    return result.when(
      success: (response) {
        final entity = UserInfo.fromResponse(response);
        return ApiResult.success(entity);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult> addDeviceToken(
      UserDeviceTokenRequest userDeviceTokenRequest) async {
    return await userRemoteDataSource.addDeviceToken(userDeviceTokenRequest);
  }

  @override
  Future<ApiResult> updateUserSettings(UserSettingsRequest userSettings) async {
    return await userRemoteDataSource.updateUserSettings(userSettings);
  }
}
