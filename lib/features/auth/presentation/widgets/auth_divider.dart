import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/styles/app_colors.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _SubDivider(indent: 8),
        Container(
          height: 7.w,
          width: 7.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.5.w),
            color: AppColors.navyBlue,
          ),
        ),
        const _SubDivider(endIndent: 8),
      ],
    );
  }
}

class _SubDivider extends StatelessWidget {
  final double? indent;
  final double? endIndent;

  const _SubDivider({this.indent, this.endIndent});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        height: indent?.w,
        endIndent: endIndent?.w,
        color: AppColors.dividerGrey.withValues(alpha: .4),
      ),
    );
  }
}
