import 'package:injectable/injectable.dart';
import '../../../../core/network/api_response.dart';
import '../repositories/account_settings_repository.dart';

@lazySingleton
class ReciterAccountDeleteRequestUseCase {
  final AccountSettingsRepository repository;

  ReciterAccountDeleteRequestUseCase({required this.repository});

  Future<ApiResult> call() async {
    return await repository.submitReciterAccountDeleteRequest();
  }
}
