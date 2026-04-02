import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_text_style.dart';

import 'app_colors.dart';

final enabledOutlinedInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: AppColors.textColor.withOpacity(0.2)),
  borderRadius: BorderRadius.all(
    Radius.circular(4.r),
  ),
);

final foucsedOutlinedInputBorder = enabledOutlinedInputBorder.copyWith(
  borderSide: const BorderSide(color: AppColors.goldenOrange),
);

final errorOutlinedInputBorder = enabledOutlinedInputBorder.copyWith(
  borderSide: const BorderSide(color: AppColors.errorColor),
);

final disabledOutlinedInputBorder = enabledOutlinedInputBorder.copyWith(
  borderSide: BorderSide(color: AppColors.textColor.withOpacity(0.2)),
);

final appInputDecorationTheme = InputDecorationTheme(
  errorMaxLines: 3,
  errorBorder: errorOutlinedInputBorder,
  focusedErrorBorder: errorOutlinedInputBorder,
  focusedBorder: foucsedOutlinedInputBorder,
  disabledBorder: disabledOutlinedInputBorder,
  enabledBorder: enabledOutlinedInputBorder,
  contentPadding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 8.w),
  isDense: true,
  hintStyle: AppTextStyles.font14TextW400OP8,
  errorStyle: TextStyle(color: AppColors.errorColor, fontSize: 12.sp),
);
