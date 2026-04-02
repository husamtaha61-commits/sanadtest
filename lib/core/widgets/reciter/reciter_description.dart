import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/styles/app_text_style.dart';

class ReciterDescription extends StatelessWidget {
  final String description;
  const ReciterDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color.fromRGBO(182, 198, 201, 0.1),
      ),
      child: Text(
        description,
        style: AppTextStyles.font12TextW400OP8,
      ),
    );
  }
}
