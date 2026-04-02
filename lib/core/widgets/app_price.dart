import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/styles/app_text_style.dart';

class AppPrice extends StatelessWidget {
  final double price;
  final Color? textColor;
  final MainAxisAlignment? mainAxisAlignment;
  const AppPrice(
      {super.key, required this.price, this.textColor, this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    int integerPart = price.floor();
    double fractionalPart = ((price - integerPart) * 100).round() / 100;

    String fractionalText = (fractionalPart == 0)
        ? ''
        : fractionalPart.toStringAsFixed(2).substring(1);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$$integerPart',
            style: AppTextStyles.font46NavyBlueW600.copyWith(color: textColor),
          ),
          if (fractionalText.isNotEmpty) ...[
            Text(
              '.',
              style:
                  AppTextStyles.font46NavyBlueW600.copyWith(color: textColor),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6.w),
              child: Text(
                fractionalText.substring(1),
                style: AppTextStyles.font28SlateBlueW500
                    .copyWith(color: textColor),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
