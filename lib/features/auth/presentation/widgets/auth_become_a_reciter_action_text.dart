import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../gen/translations/locale_keys.g.dart';

class AuthBecomeAReciterActionText extends StatelessWidget {
  const AuthBecomeAReciterActionText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(const ReciterSubmitJobRoute()),
      child: Text(
        context.tr(LocaleKeys.login_form_becomeAReciter),
        style: AppTextStyles.font12NavyBlueW700,
      ),
    );
  }
}
