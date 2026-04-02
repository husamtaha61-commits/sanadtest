import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../theme/styles/app_colors.dart';
import '../theme/styles/app_text_style.dart';

class AppPinCodeTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final BuildContext appContext;
  final int length;

  const AppPinCodeTextField({
    super.key,
    this.onChanged,
    this.controller,
    required this.appContext,
    this.length = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        autovalidateMode: AutovalidateMode.disabled,
        length: length,
        cursorColor: AppColors.textColor,
        textStyle: AppTextStyles.font24TextW700,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(4.r),
          inactiveBorderWidth: 1.w,
          selectedBorderWidth: 1.w,
          activeBorderWidth: 1.w,
          fieldWidth: 45.w,
          fieldHeight: 45.w,
          activeColor: AppColors.goldenOrange,
          selectedColor: AppColors.goldenOrange,
          inactiveColor: const Color(0xffE0E1E3),
        ),
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        controller: controller,
        onChanged: onChanged,
        appContext: appContext,
      ),
    );
  }
}
