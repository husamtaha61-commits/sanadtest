import 'package:flutter/material.dart';

import '../../../gen/translations/locale_keys.g.dart';
import '../../constants/constants.dart';
import '../../utils/app_form_validator.dart';
import '../app_text_field.dart';

class NameTextField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final bool? readOnly;

  final TextEditingController textEditingController;
  const NameTextField({
    super.key,
    required this.label,
    this.validator,
    this.readOnly,
    required this.textEditingController,
  });

  String get localizedLabel {
    switch (label) {
      case AppFormFields.firstName:
        return LocaleKeys.form_field_firstName;
      case AppFormFields.middleName:
        return LocaleKeys.form_field_middleName;
      case AppFormFields.lastName:
        return LocaleKeys.form_field_lastName;
      default:
        return '';
    }
  }

  List<String>? get autoFillHints {
    switch (label) {
      case AppFormFields.firstName:
        return [AutofillHints.givenName];
      case AppFormFields.middleName:
        return [AutofillHints.middleName];
      case AppFormFields.lastName:
        return [AutofillHints.familyName];
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      keyboardType: TextInputType.name,
      validator:
          validator ?? (value) => AppFormValidator.validateField(label, value),
      textEditingController: textEditingController,
      label: localizedLabel,
      readOnly: readOnly,
      autofillHints: autoFillHints,
    );
  }
}
