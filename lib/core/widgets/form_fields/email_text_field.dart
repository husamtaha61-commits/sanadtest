import 'package:flutter/material.dart';

import '../../../gen/translations/locale_keys.g.dart';
import '../../constants/constants.dart';
import '../../utils/app_form_validator.dart';
import '../app_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool? enabled;
  final bool? filled;
  final Color? fillColor;
  final InputBorder? disabledBorder;
  final TextStyle? style;
  final bool? readOnly;

  const EmailTextField({
    super.key,
    required this.textEditingController,
    this.enabled,
    this.filled,
    this.fillColor,
    this.disabledBorder,
    this.style,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: LocaleKeys.form_field_email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) =>
          AppFormValidator.validateField(AppFormFields.email, value),
      textEditingController: textEditingController,
      enabled: enabled,
      filled: filled,
      fillColor: fillColor,
      disabledBorder: disabledBorder,
      style: style,
      readOnly: readOnly,
      autofillHints: const [ AutofillHints.email ],
    );
  }
}
