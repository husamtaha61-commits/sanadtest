import 'package:injectable/injectable.dart';
import '../../../../../core/network/api_response.dart';
import '../model/requests/student_update_account_settings_request.dart';
import '../repositories/account_settings_repository.dart';

@lazySingleton
class SubmitStudentAccountSettingsUseCase {
  final AccountSettingsRepository repository;

  SubmitStudentAccountSettingsUseCase({required this.repository});

  Future<ApiResult> call(SubmitStudentAccountSettingsRequest request) async {
    return await repository.submitStudentAccountSettings(request);
  }
}
