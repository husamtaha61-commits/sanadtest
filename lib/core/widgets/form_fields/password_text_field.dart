import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/translations/locale_keys.g.dart';
import '../../constants/constants.dart';
import '../../utils/app_form_validator.dart';
import '../../utils/device_manager.dart';
import '../app_text_field.dart';

class PasswordTextField extends StatefulWidget {
  final String label;
  final TextEditingController textEditingController;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  const PasswordTextField({
    super.key,
    required this.label,
    required this.textEditingController,
    this.onFieldSubmitted,
    this.textInputAction,
    this.validator,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObsecuredPassword = true;

  String getLabel() {
    switch (widget.label) {
      case AppFormFields.password:
        return LocaleKeys.form_field_password;
      case AppFormFields.oldPassword:
        return LocaleKeys.accountSettings_changePassword_oldPassword;
      case AppFormFields.newPassword:
        return LocaleKeys.accountSettings_changePassword_newPassword;
      case AppFormFields.confirmPassword:
        return LocaleKeys.form_field_confirmPassword;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: getLabel(),
      enableSuggestions: false,
      validator: widget.validator ??
          (value) => AppFormValidator.validateField(
                widget.label,
                value,
              ),
      textEditingController: widget.textEditingController,
      obscureText: isObsecuredPassword,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      suffixIcon: IconButton(
        padding: DeviceManager.isTablet(context)
            ? EdgeInsets.symmetric(horizontal: 12.w)
            : null,
        onPressed: () => setState(
          () {
            isObsecuredPassword = !isObsecuredPassword;
          },
        ),
        icon: SvgPicture.asset(
          width: 18.w,
          height: 18.w,
          isObsecuredPassword
              ? Assets.icons.passwordInvisible.path
              : Assets.icons.passwordVisible.path,
        ),
      ),
      autofillHints: const [ AutofillHints.password, AutofillHints.newPassword ],
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
