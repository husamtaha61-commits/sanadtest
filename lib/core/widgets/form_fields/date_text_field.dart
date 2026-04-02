import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/constants.dart';
import '../../extenstions/date_time.dart';
import '../../extenstions/string.dart';
import '../../utils/app_date.dart';
import '../../utils/app_form_validator.dart';
import '../../utils/device_manager.dart';
import '../app_text_field.dart';

class DateTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final int? minimumAge;
  final String? hintText;
  final String? label;
  final String? Function(String?)? customValidator;
  final bool useBirthOfDateValidator;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function()? onChanged;
  final bool readOnly;

  const DateTextField({
    super.key,
    required this.textEditingController,
    this.minimumAge,
    this.hintText,
    this.customValidator,
    this.useBirthOfDateValidator = false,
    this.label,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: label,
      onTap: readOnly
          ? () {}
          : () => _handleDatePicker(
              context, textEditingController, initialDate, onChanged),
      textEditingController: textEditingController,
      validator: _validateInput,
      readOnly: true,
      suffixIcon: IconButton(
        padding: DeviceManager.isTablet(context)
            ? EdgeInsets.symmetric(horizontal: 12.w)
            : null,
        onPressed: readOnly
            ? () {}
            : () => _handleDatePicker(
                context, textEditingController, initialDate, onChanged),
        icon: SvgPicture.asset(
          Assets.icons.calendar.path,
          width: 18.w,
          height: 18.w,
        ),
      ),
      hintText: hintText?.tr(),
    );
  }

  String? _validateInput(String? value) {
    if (customValidator != null) {
      return customValidator!(value);
    } else if (useBirthOfDateValidator) {
      return _dateOfBirthValidator(value);
    }
    return null;
  }

  String? _dateOfBirthValidator(String? value) =>
      AppFormValidator.validateField(AppFormFields.dateOfBirth, value, minimumAge);

  Future<void> _handleDatePicker(BuildContext context,
      TextEditingController dateOfBirth, DateTime? initialDate,
      [Function()? onChanged]) async {
    DateTime getInitalDate() {
      late DateTime intialDate;
      if (textEditingController.text.isEmpty) {
        intialDate = DateTime.now();
      } else {
        intialDate = dateOfBirth.text.toDate(AppDate.ddMMyyyy) ?? DateTime.now();
      }
      return intialDate;
    }

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: initialDate ?? getInitalDate(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now(),
      builder: (context, child) {
        return Transform.scale(
          scale: DeviceManager.isTablet(context) ? 2 : 1,
          child: child,
        );
      },
    );
    if (pickedDate != null) {
      dateOfBirth.text = pickedDate.toStr(AppDate.ddMMyyyy);
      onChanged?.call();
    }
  }
}
