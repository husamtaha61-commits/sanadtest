import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

enum SupportedL10N {
  en,
  ar;

  // Get the language name
  String get readableFormat => switch (this) {
        SupportedL10N.en => "English",
        SupportedL10N.ar => "العربية",
      };

  // Get the enum type from the language code
  static SupportedL10N fromCode(String code) {
    return SupportedL10N.values.firstWhere((l10n) => l10n.name == code);
  }

  // Get the enum type from the language name
  static SupportedL10N fromString(String langName) {
    return SupportedL10N.values
        .firstWhere((l10n) => l10n.readableFormat == langName);
  }

  static List<String> get languageLocalizedNames {
    return SupportedL10N.values.map((l10n) => l10n.readableFormat).toList();
  }

  static List<String> get languageCodes {
    return SupportedL10N.values.map((l10n) => l10n.name).toList();
  }
}

@lazySingleton
class LocalizationService {
  String get langAssetPath => 'assets/translations';

  List<Locale> get supportedLocales =>
      SupportedL10N.values.map((langCode) => Locale(langCode.name)).toList();

  bool get saveLocale => true;

  Future<void> setLocale(BuildContext context, String langCode) async {
    await context.setLocale(Locale(langCode));
  }

  String getCurrentLanguageCode(BuildContext context) =>
      context.locale.languageCode;

  bool isAr(BuildContext context) {
    return getCurrentLanguageCode(context) == SupportedL10N.ar.name;
  }
}
