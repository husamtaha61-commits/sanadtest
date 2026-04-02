import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';

import '../../features/shared/data/models/responses/admin_config_response.dart';
import '../../features/shared/presentation/bloc/admin/admin_cubit.dart';
import '../../gen/translations/locale_keys.g.dart';
import '../constants/constants.dart';

class AdminConfigManager {
  static final AdminCubit _adminCubit = GetIt.I<AdminCubit>();

  static AdminConfigResponse getAdminConfig() {
    _adminCubit.getAdminConfig();
    return _adminCubit.state.adminConfig!;
  }

  static bool isStudentSessionCountValid(int selectedSessionsNum) {
    final adminConfig = getAdminConfig();
    final minSessions = adminConfig.minNumOfSessionsWeekly;
    final maxSessions = adminConfig.maxNumOfSessionsWeekly;
    return selectedSessionsNum >= minSessions &&
        selectedSessionsNum <= maxSessions;
  }

  static String studentSessionCountErrorMsg() {
    final adminConfig = getAdminConfig();

    return scaffoldMessengerKey.currentContext!.tr(
      LocaleKeys
          .form_error_availableTimes_studentMinmumAndMaximumNumOfSessionsWeekly,
      args: [
        adminConfig.minNumOfSessionsWeekly.toString(),
        adminConfig.maxNumOfSessionsWeekly.toString(),
        adminConfig.minNumberOfHoursBetweenSessions.toString(),
      ],
    );
  }

  static bool isReciterSessionCountValid(int selectedSessionsNum) {
    final adminConfig = getAdminConfig();
    return selectedSessionsNum > adminConfig.minNumOfAvaialableTimes;
  }
}
