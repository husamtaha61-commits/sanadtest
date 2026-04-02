import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanFeatureItem extends StatelessWidget {
  final String feature;
  final bool isIncluded;

  const PlanFeatureItem({
    super.key,
    required this.feature,
    this.isIncluded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isIncluded
                ? Icons.check_circle_rounded
                : Icons.remove_circle_rounded,
            color: isIncluded ? Colors.green.shade600 : Colors.grey.shade400,
            size: 20.w,
          ),
          12.horizontalSpace,
          Expanded(
            child: Text(
              feature,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isIncluded
                        ? Colors.grey.shade800
                        : Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
