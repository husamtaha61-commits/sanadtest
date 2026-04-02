import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../widgets/account_settings_reciter.dart';
import '../widgets/account_settings_student.dart';

@RoutePage()
class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: AppCustomScrollView(
        appPageHeader: AppPageHeader.subtitle,
        title: LocaleKeys.accountSettings_title,
        padding: EdgeInsets.zero,
        children: [
          isStudentRole(context)
              ? const AccountSettingsStudent()
              : const AccountSettingsReciter(),
        ],
      ),
    );
  }
}
