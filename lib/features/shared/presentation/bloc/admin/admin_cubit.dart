import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../data/models/responses/admin_config_response.dart';
import '../../../domain/usecases/get_admin_config_use_case.dart';

part 'admin_state.dart';
part 'admin_cubit.freezed.dart';

@injectable
class AdminCubit extends Cubit<AdminState> {
  final AppPreferences appPreferences;
  final GetAdminConfigUseCase getAdminConfigUseCase;
  AdminCubit(this.appPreferences, this.getAdminConfigUseCase)
      : super(const AdminState());

  void getAdminConfig() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await getAdminConfigUseCase();
    response.when(
      success: (adminConfigResponse) {
        appPreferences.cacheAdminConfigResponse(adminConfigResponse);
        emit(state.copyWith(
            status: const BaseStatus.success(),
            adminConfig: adminConfigResponse));
      },
      failure: (error) {
        final adminConfigCachedResponse =
            appPreferences.getAdminCachedConfigResponse();
        emit(
          state.copyWith(
            status: const BaseStatus.failure(),
            adminConfig: adminConfigCachedResponse,
          ),
        );
      },
    );
  }
}
