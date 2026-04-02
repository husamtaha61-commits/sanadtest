import 'package:injectable/injectable.dart';
import '../../../../core/network/api_response.dart';
import '../model/requests/submit_reciter_account_settings_request.dart';
import '../repositories/account_settings_repository.dart';

@lazySingleton
class SubmitReciterAccountSettingsUseCase {
  final AccountSettingsRepository _repository;

  SubmitReciterAccountSettingsUseCase(this._repository);

  Future<ApiResult> call(SubmitReciterAccountSettingsRequest request) async {
    return _repository.submitReciterAccountSettings(request);
  }
}
