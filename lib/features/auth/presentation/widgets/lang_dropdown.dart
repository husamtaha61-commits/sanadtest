import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_cubit.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/services/localization_service.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';

class LangDropdown extends StatefulWidget {
  const LangDropdown({super.key});

  @override
  State<LangDropdown> createState() => _LangDropdownState();
}

class _LangDropdownState extends State<LangDropdown> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    String currentLangCode = getIt<AppPreferences>().getLang;
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
            alignment: Alignment.center,
            width: 80.w,
            padding: EdgeInsets.zero,
            child: PopupMenuButton<String>(
              constraints: BoxConstraints(minWidth: 90.w, maxWidth: 90.w),
              onCanceled: () => setState(() {
                isCollapsed = true;
              }),
              onOpened: () => setState(() {
                isCollapsed = false;
              }),
              offset: Offset(0, 25.w),
              child: Row(
                  children: [
                    Icon(
                      Icons.translate_rounded,
                      color: AppColors.goldenOrange,
                      size: 20.w,
                    ),
                    5.horizontalSpace,
                    Text(
                      currentLangCode.toUpperCase(),
                      style: AppTextStyles.font14GoldenOrangeW500,
                    ),
                    5.horizontalSpace,
                    Icon(
                      isCollapsed
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: AppColors.goldenOrange,
                      size: 20.w,
                    ),
                  ]),
              onSelected: (String langName) {
                setState(() {
                  isCollapsed = true;
                });
                final selectedLangCode = SupportedL10N.fromString(langName);
                if (currentLangCode != selectedLangCode.name) {
                  getIt<AppCubit>().storeLang(
                    context,
                    selectedLangCode.name,
                    false,
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return SupportedL10N.languageLocalizedNames.map((l10N) {
                  return PopupMenuItem<String>(
                    value: l10N,
                    padding: EdgeInsets.zero,
                    height: 30.w,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        textAlign: TextAlign.center,
                        l10N,
                        style: AppTextStyles.font15TextW400,
                      ),
                    )
                  );
                }).toList();
              },
            )
        )
    );
  }
}
