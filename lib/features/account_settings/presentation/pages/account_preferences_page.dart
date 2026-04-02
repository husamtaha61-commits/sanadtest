import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app/app_cubit.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/services/localization_service.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';

@RoutePage()
class AccountPreferencesPage extends StatefulWidget {
  const AccountPreferencesPage({super.key});

  @override
  State<AccountPreferencesPage> createState() => _AccountPreferencesPageState();
}

class _AccountPreferencesPageState extends State<AccountPreferencesPage> {
  late String selectedLangName;
  late String currentLangCode;

  @override
  void initState() {
    super.initState();
    currentLangCode = getIt<AppPreferences>().getLang;
    selectedLangName = SupportedL10N.fromCode(currentLangCode).readableFormat;
  }

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: AppCustomScrollView(
        appPageHeader: AppPageHeader.subtitle,
        title: LocaleKeys.accountSettings_preferences_title,
        bottomChildren: [
          AppStepsButton(
              onPressed: () async {
                final selectedLangCode =
                    SupportedL10N.fromString(selectedLangName);
                if (currentLangCode != selectedLangCode.name) {
                  await getIt<AppCubit>().storeLang(context, selectedLangCode.name);
                  context.read<UserCubit>().updateUserSettings();
                }
              },
              icon: const SizedBox(),
              label: Text(context.tr(LocaleKeys.button_save)))
        ],
        children: [
          20.verticalSpace,
          AppSingleMenu<String>(
            items: SupportedL10N.languageLocalizedNames,
            itemAsString: (item) => item,
            label: LocaleKeys.form_field_interfaceLanguage,
            selectedItem: selectedLangName,
            onItemSelected: (value) => selectedLangName = value!,
            selectedItemName: selectedLangName,
            fieldName: AppFormFields.mainLanguage,
          ),
        ],
      ),
    );
  }
}
