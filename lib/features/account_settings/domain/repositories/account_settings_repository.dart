import '../../../../core/network/api_response.dart';
import '../../../auth/data/models/requests/user_change_password_request.dart';
import '../model/requests/khitma_suspension_request.dart';
import '../model/requests/student_update_account_settings_request.dart';
import '../model/requests/submit_reciter_account_settings_request.dart';

abstract class AccountSettingsRepository {
  Future<ApiResult> deleteAccount();
  Future<ApiResult> khitmaSuspension(KhitmaSuspensionRequest request);
  Future<ApiResult> changePassword(ChangePasswordRequest request);
  Future<ApiResult> submitReciterAccountDeleteRequest();
  Future<ApiResult> submitStudentAccountSettings(
    SubmitStudentAccountSettingsRequest request,
  );
  Future<ApiResult> submitReciterAccountSettings(
      SubmitReciterAccountSettingsRequest request);
}
