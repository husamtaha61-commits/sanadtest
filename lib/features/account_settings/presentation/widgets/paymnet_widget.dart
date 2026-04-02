import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';

class PaymentInformationWidget extends StatefulWidget {
  const PaymentInformationWidget({super.key});

  @override
  State<PaymentInformationWidget> createState() =>
      _PaymentInformationWidgetState();
}

class _PaymentInformationWidgetState extends State<PaymentInformationWidget> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPaymentMethod = 'bank_transfer';
  final TextEditingController _ibanController = TextEditingController();
  final TextEditingController _swiftController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();

  bool _obscureSwift = true;
  bool _obscureBankName = true;

  // Basic IBAN validation
  String? _validateIBAN(String? value) {
    if (value == null || value.isEmpty) {
      return context.tr(LocaleKeys.form_error_requiredField);
    }
    // Basic IBAN validation - at least 15 characters for most countries
    if (value.length < 15) {
      return context.tr(LocaleKeys.form_error_email_invalid);
    }
    return null;
  }

  // dummy checking for now if needed later will do proper validation
  String? _validateSWIFT(String? value) {
    if (value == null || value.isEmpty) {
      return context.tr(LocaleKeys.form_error_requiredField);
    }
    if (value.length != 8 && value.length != 11) {
      return context.tr(LocaleKeys.form_error_requiredField);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context
                .tr(LocaleKeys.reciter_completeProfile_paymentInformation_st1),
            style: AppTextStyles.font14TextW400,
          ),
          24.verticalSpace,
          Row(
            children: [
              _buildPaymentMethodOption(
                value: 'Bank Transfer',
                label: context.tr(LocaleKeys
                    .reciter_completeProfile_paymentInformation_type1),
                icon: SvgPicture.asset(
                  Assets.icons.bank.path,
                ),
              ),
              16.horizontalSpace,
              _buildPaymentMethodOption(
                value: 'PayPal',
                label: LocaleKeys.form_field_paypal.tr(),
                icon: SvgPicture.asset(Assets.icons.paypal.path),
              ),
              16.horizontalSpace,
              _buildPaymentMethodOption(
                value: 'Western Union',
                label: LocaleKeys.form_field_westernUnion.tr(),
                icon: SvgPicture.asset(Assets.icons.westrenUnion.path),
              ),
            ],
          ),
          24.verticalSpace,
          if (_selectedPaymentMethod == 'Bank Transfer') ...[
            AppTextFormField(
              textEditingController: _ibanController,
              label: LocaleKeys.form_field_iban,
              validator: _validateIBAN,
            ),
            16.verticalSpace,
            AppTextFormField(
              textEditingController: _swiftController,
              label: LocaleKeys.form_field_swift,
              validator: _validateSWIFT,
              obscureText: _obscureSwift,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureSwift ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.navyBlue,
                ),
                onPressed: () {
                  setState(() {
                    _obscureSwift = !_obscureSwift;
                  });
                },
              ),
            ),
            16.verticalSpace,
            AppTextFormField(
              textEditingController: _bankNameController,
              label: LocaleKeys.form_field_bankName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.tr(LocaleKeys.form_error_requiredField);
                }
                return null;
              },
              obscureText: _obscureBankName,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureBankName ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.navyBlue,
                ),
                onPressed: () {
                  setState(() {
                    _obscureBankName = !_obscureBankName;
                  });
                },
              ),
            ),
            24.verticalSpace,
          ],
          if (_selectedPaymentMethod != 'Bank Transfer') ...[
            Text(
              context.tr(LocaleKeys.button_comingSoon),
              style: AppTextStyles.font14TextW400,
            ),
            24.verticalSpace,
          ],
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                AppElevatedButton(
                  onPressed: () {
                    // Handle save action
                    context.router.popForced();
                  },
                  backgroundColor: AppColors.navyBlue,
                  child: Text(
                    context.tr(LocaleKeys.button_save),
                    style: AppTextStyles.font15WhiteW400,
                  ),
                ),
                16.verticalSpace,
                AppElevatedButton(
                  onPressed: () {
                    // Handle cancel action
                    context.router.popForced();
                  },
                  backgroundColor: const Color(0xffE5ECF2),
                  textStyle: AppTextStyles.font15NavyBlueW400,
                  foregroundColor: AppColors.navyBlue,
                  child: Text(context.tr(LocaleKeys.button_cancel)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodOption({
    required String value,
    required String label,
    required Widget icon,
  }) {
    final isSelected = _selectedPaymentMethod == value;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedPaymentMethod = value;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
          constraints: BoxConstraints(
            minHeight: 90.h,
            maxHeight: 110.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
            border: Border.all(
              color:
                  isSelected ? AppColors.goldenOrange : const Color(0xffE5ECF2),
              width: 2.w,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .05),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
              if (isSelected)
                BoxShadow(
                  color: AppColors.goldenOrange.withValues(alpha: .4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 32.w,
                height: 32.w,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: icon,
                ),
              ),
              8.verticalSpace,
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                  style: AppTextStyles.font16BlackW400
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
