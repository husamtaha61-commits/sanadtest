import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../gen/translations/locale_keys.g.dart';
import '../../constants/constants.dart';
import '../../services/localized_error.dart';
import '../../services/localized_field.dart';
import '../../theme/styles/app_text_style.dart';

class PhoneTextField extends StatelessWidget {
  final PhoneController controller;
  final String label;
  final bool enabled;
  final void Function(PhoneNumber)? onChanged;

  const PhoneTextField({
    super.key,
    required this.controller,
    required this.label,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.font15TextW400OP8).tr(),
        3.verticalSpace,
        Directionality(
          textDirection: TextDirection.ltr,
          child: PhoneFormField(
            enabled: enabled,
            style: AppTextStyles.font16TextW400,
            countryButtonStyle: CountryButtonStyle(
              flagSize: 20.w,
              textStyle: AppTextStyles.font15TextW400,
            ),
            controller: controller,
            onChanged: (value) {
              controller.changeCountry(value.isoCode);
              controller.changeNationalNumber(value.nsn);
              if (onChanged != null) onChanged!(value); // <- notify parent
            },
            countrySelectorNavigator:
                CountrySelectorNavigator.draggableBottomSheet(
              searchBoxTextStyle: AppTextStyles.font16TextW400,
              countries: customCountries,
              searchBoxDecoration: InputDecoration(
                hintText: context.tr(LocaleKeys.button_search),
              ),
            ),
            validator: PhoneValidator.compose(
              [
                PhoneValidator.required(
                  context,
                  errorText: LocalizedErrorType.requiredField.translate(
                    field: LocalizedField.phoneNumber,
                  ),
                ),
                PhoneValidator.validMobile(
                  context,
                  errorText:
                      LocaleKeys.form_error_phoneNumber_invalidNumber.tr(),
                )
              ],
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        )
      ],
    );
  }
}
