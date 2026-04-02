import 'package:easy_localization/easy_localization.dart';

import '../../gen/translations/locale_keys.g.dart';
import 'localized_field.dart';

enum LocalizedErrorType {
  requiredField,
}

extension LocalizedErrorTypeExtension on LocalizedErrorType {
  String get key {
    switch (this) {
      case LocalizedErrorType.requiredField:
        return LocaleKeys.form_error_requiredField;
    }
  }

  String translate({required LocalizedField field}) {
    final message = key.tr(namedArgs: {'field': field.translated});
    if (message == key) {
      return LocaleKeys.form_error_unsupported;
    }
    return message;
  }
}
