import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/styles/app_colors.dart';
import '../theme/styles/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  final String? label;
  final Widget? customLabel;
  final bool? readOnly;
  final bool? obscureText;
  final bool? enableSuggestions;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final bool? filled;
  final Color? fillColor;
  final InputBorder? disabledBorder;
  final String? initialValue;
  final double cursorWidth;
  final Color cursorColor;
  final Color cursorErrorColor;
  final String? hintText;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final Key? textFormkey;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;
  final List<String>? autofillHints;
  final AutovalidateMode autoValidateMode;

  const AppTextFormField({
    super.key,
    this.label,
    this.customLabel,
    this.suffixIcon,
    this.prefixIcon,
    this.textEditingController,
    this.validator,
    this.onChanged,
    this.onTap,
    this.readOnly,
    this.obscureText,
    this.enableSuggestions,
    this.textInputAction,
    this.cursorWidth = 1.7,
    this.cursorColor = AppColors.textColor,
    this.cursorErrorColor = AppColors.textColor,
    this.onFieldSubmitted,
    this.enabled,
    this.filled,
    this.fillColor,
    this.disabledBorder,
    this.initialValue,
    this.keyboardType,
    this.style,
    this.textFormkey,
    this.hintText,
    this.maxLines = 1,
    this.maxLength,
    this.contentPadding,
    this.autofillHints,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ..._buildLabel(label!),
        if (customLabel != null) ...[customLabel!, 3.verticalSpace],
        TextFormField(
          key: textFormkey ?? ValueKey(context.locale),
          textInputAction: textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            suffixIcon: suffixIcon,
            filled: filled,
            fillColor: fillColor,
            disabledBorder: disabledBorder,
            hintText: hintText,
            counterStyle: AppTextStyles.font12TextW400,
            prefixIcon: prefixIcon,
          ),
          obscureText: obscureText ?? false,
          enableSuggestions: enableSuggestions ?? true,
          cursorWidth: cursorWidth.w,
          cursorColor: cursorColor,
          readOnly: readOnly ?? false,
          cursorErrorColor: cursorErrorColor,
          controller: textEditingController,
          validator: validator,
          onTap: onTap,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          enabled: enabled ?? true,
          initialValue: initialValue,
          keyboardType: keyboardType,
          style: style ?? AppTextStyles.font15TextW400,
          maxLines: maxLines,
          maxLength: maxLength,
          autofillHints: autofillHints,
          autovalidateMode: autoValidateMode,
        ),
      ],
    );
  }

  List<Widget> _buildLabel(String label) {
    return [
      Text(label, style: AppTextStyles.font15TextW400OP8).tr(),
      3.verticalSpace,
    ];
  }
}
