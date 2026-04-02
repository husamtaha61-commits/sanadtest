import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_step_card_item.dart';

class AppSetpCards extends StatelessWidget {
  final int activeIndex;
  final List<Map<String, String>> items;

  const AppSetpCards({
    super.key,
    required this.activeIndex,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(items.length, (i) {
          return [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  end: i < items.length - 1 ? 9.w : 0,
                ),
                child: AppStepCardItem(
                  imagePath: items[i]['imagePath']!,
                  label: context.tr(items[i]['label']!),
                  isActive: activeIndex == i + 1,
                ),
              ),
            ),
          ];
        }).expand((e) => e).toList(),
      ),
    );
  }
}
