import 'package:easy_localization/easy_localization.dart';

import '../../gen/translations/locale_keys.g.dart';
import '../constants/constants.dart';
import '../extenstions/date_time.dart';
import '../extenstions/string.dart';
import '../services/localized_error.dart';
import '../services/localized_field.dart';
import 'app_date.dart';
import 'utils.dart';

abstract class AppFormValidator {
  static String getNameLengthErrorMsg(String fieldName) {
    switch (fieldName) {
      case AppFormFields.firstName:
        return LocaleKeys.form_error_firstName_length.tr();
      case AppFormFields.middleName:
        return LocaleKeys.form_error_middleName_length.tr();
      case AppFormFields.lastName:
        return LocaleKeys.form_error_lastName_length.tr();
      default:
        return '';
    }
  }

  static String getNameLettersErrorMsg(String fieldName) {
    switch (fieldName) {
      case AppFormFields.firstName:
        return LocaleKeys.form_error_firstName_lettersOnly.tr();
      case AppFormFields.middleName:
        return LocaleKeys.form_error_middleName_lettersOnly.tr();
      case AppFormFields.lastName:
        return LocaleKeys.form_error_lastName_lettersOnly.tr();
      default:
        return '';
    }
  }

  static String? validateRequiredField(String? value, String fieldKey) {
    if (isEmpty(value)) {
      final field = LocalizedFieldExtension.fromKey(fieldKey);
      return LocalizedErrorType.requiredField.translate(field: field);
    }
    return null;
  }

  static String? validateName(String fieldName, String value) {
    if (value.trim().length < 2) {
      return getNameLengthErrorMsg(fieldName);
    } else if (!isName(value.trim())) {
      return getNameLettersErrorMsg(fieldName);
    }
    return null;
  }

  static String? validateDateOfBirth(String value, int? minimumAge) {
    final asDate = value.toDate(AppDate.ddMMyyyy);
    if(asDate == null) {
      return null;
    }
    var dateDiff = DateTime.now().diffInYears(asDate);
    if (dateDiff < (minimumAge ?? 0)) {
      return LocaleKeys.form_error_dateOfBirthAge_invalidAge.tr(
        args: [minimumAge.toString()],
      );
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (!isEmail(value)) {
      return LocaleKeys.form_error_email_invalid.tr();
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.length < 8) {
      return LocaleKeys.form_error_password_length.tr();
    } else if (!isPassword(value)) {
      return LocaleKeys.form_error_password_missing.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(
    String confirmPassword,
    String password,
  ) {
    if (confirmPassword != password) {
      return LocaleKeys.form_error_confirmPassword_mismatch.tr();
    }
    return null;
  }

  static String? validateField(String fieldName, String? value,
      [dynamic value2]) {
    String? requiredMsg = validateRequiredField(value, fieldName);
    if (requiredMsg != null) {
      return requiredMsg;
    }
    switch (fieldName) {
      case AppFormFields.firstName:
      case AppFormFields.middleName:
      case AppFormFields.lastName:
        return validateName(fieldName, value!);
      case AppFormFields.dateOfBirth:
        return validateDateOfBirth(value!, value2);
      case AppFormFields.email:
        return validateEmail(value!);
      case AppFormFields.password:
      case AppFormFields.newPassword:
        return validatePassword(value!);
      case AppFormFields.confirmPassword:
        return validateConfirmPassword(value!, value2!);
    }
    return null;
  }
}
