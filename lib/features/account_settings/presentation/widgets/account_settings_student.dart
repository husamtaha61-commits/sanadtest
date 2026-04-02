import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import 'account_settings_list_tile.dart';

class AccountSettingsStudent extends StatelessWidget {
  const AccountSettingsStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountSettingsListTile(
          title: LocaleKeys.accountSettings_personalInformation_title,
          onTap: () =>
              context.router.push(const AccountPersonalInformationRoute()),
        ),
        AccountSettingsListTile(
          title: LocaleKeys.accountSettings_preferences_title,
          onTap: () => context.router.push(const AccountPreferencesRoute()),
        ),
        AccountSettingsListTile(
          title: LocaleKeys.accountSettings_khitmaSuspension_title,
          onTap: () =>
              context.router.push(const AccountKhitmaSuspensionRoute()),
        ),
        AccountSettingsListTile(
          title: LocaleKeys.accountSettings_accountDeletion_title,
          onTap: () => context.router.push(const AccountDeletionRoute()),
        ),
        AccountSettingsListTile(
          title: LocaleKeys.accountSettings_changePassword_title,
          onTap: () => context.router.push(const AccountChangePasswordRoute()),
        ),
      ],
    );
  }
}
