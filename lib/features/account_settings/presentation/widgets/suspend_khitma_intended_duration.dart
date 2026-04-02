import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../gen/translations/locale_keys.g.dart';

class IntendedDurationPicker extends StatefulWidget {
  final void Function(DateTime from, DateTime to)? onDurationSelected;

  const IntendedDurationPicker({super.key, this.onDurationSelected});

  @override
  State<IntendedDurationPicker> createState() => _IntendedDurationPickerState();
}

class _IntendedDurationPickerState extends State<IntendedDurationPicker> {
  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _pickDate({required bool isFromDate}) async {
    final now = DateTime.now();
    final tomorrow =
        DateTime(now.year, now.month, now.day).add(const Duration(days: 1));

    final picked = await showDatePicker(
      context: context,
      initialDate: isFromDate
          ? (fromDate ?? tomorrow)
          : (toDate ??
              (fromDate != null
                  ? fromDate!.add(const Duration(days: 1))
                  : tomorrow.add(const Duration(days: 1)))),
      firstDate: isFromDate
          ? tomorrow
          : (fromDate != null
              ? fromDate!.add(const Duration(days: 1))
              : tomorrow.add(const Duration(days: 1))),
      lastDate: isFromDate
          ? tomorrow.add(const Duration(days: 30))
          : (fromDate != null
              ? fromDate!.add(const Duration(days: 30))
              : tomorrow.add(const Duration(days: 30))),
    );

    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
          if (toDate != null &&
              toDate!.isAfter(fromDate!.add(const Duration(days: 30)))) {
            toDate = null;
          }
        } else {
          toDate = picked;
        }
      });

      if (fromDate != null && toDate != null) {
        widget.onDurationSelected?.call(fromDate!, toDate!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.accountSettings_khitmaSuspension_suspenesionDuration.tr(),
          style: AppTextStyles.font15TextW400OP8,
        ),
        8.verticalSpace,
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _pickDate(isFromDate: true),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: AppColors.grey.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    fromDate != null
                        ? DateFormat.yMMMd(context.locale.toLanguageTag())
                            .format(fromDate!)
                        : LocaleKeys.times_from.tr(),
                    style: AppTextStyles.font15TextW400OP8,
                  ),
                ),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: GestureDetector(
                onTap: () => _pickDate(isFromDate: false),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: AppColors.grey.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    toDate != null
                        ? DateFormat.yMMMd(context.locale.toLanguageTag())
                            .format(toDate!)
                        : LocaleKeys.times_to.tr(),
                    style: AppTextStyles.font15TextW400OP8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
