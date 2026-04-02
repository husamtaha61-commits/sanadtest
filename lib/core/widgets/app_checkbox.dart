import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/styles/app_colors.dart';
import '../utils/device_manager.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;
  final Widget child;
  final String? errorMsg;
  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.child,
    this.errorMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
              child: Transform.scale(
                scale: DeviceManager.isTablet(context) ? 1.7 : 1,
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  side: BorderSide(
                      color: AppColors.textColor.withValues(alpha: 0.2), width: 1.5),
                  value: value,
                  onChanged: onChanged,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Opacity(
                  opacity: 0.8,
                  child: child,
                ),
              ),
            ),
          ],
        ),
        if (errorMsg != null && errorMsg!.isNotEmpty)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: Text(
                errorMsg!,
                style: TextStyle(color: AppColors.errorColor, fontSize: 12.sp),
              ),
            ),
          ),
      ],
    );
  }
}
