import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../auth/data/models/requests/user_change_password_request.dart';
import '../../domain/model/requests/khitma_suspension_request.dart';
import '../../domain/model/requests/student_update_account_settings_request.dart';
import '../../domain/model/requests/submit_reciter_account_settings_request.dart';
import '../../domain/repositories/account_settings_repository.dart';
import '../datasources/account_settings_data_source.dart';

@LazySingleton(as: AccountSettingsRepository)
class AccountSettingsRepositoryImpl implements AccountSettingsRepository {
  final AccountSettingsDataSource accountSettingsDataSource;

  AccountSettingsRepositoryImpl({required this.accountSettingsDataSource});

  @override
  Future<ApiResult> deleteAccount() async {
    return await accountSettingsDataSource.deleteAccount();
  }

  @override
  Future<ApiResult> khitmaSuspension(KhitmaSuspensionRequest request) async {
    return await accountSettingsDataSource.khitmaSuspension(request);
  }

  @override
  Future<ApiResult> changePassword(
    ChangePasswordRequest request,
  ) async {
    return await accountSettingsDataSource.changePassword(request);
  }

  @override
  Future<ApiResult> submitReciterAccountDeleteRequest() {
    return accountSettingsDataSource.submitReciterAccountDeleteRequest();
  }

  @override
  Future<ApiResult> submitStudentAccountSettings(
    SubmitStudentAccountSettingsRequest request,
  ) async {
    return await accountSettingsDataSource
        .submitStudentAccountSettings(request);
  }

  @override
  Future<ApiResult> submitReciterAccountSettings(
      SubmitReciterAccountSettingsRequest request) {
    return accountSettingsDataSource.submitReciterAccountSettings(request);
  }
}
