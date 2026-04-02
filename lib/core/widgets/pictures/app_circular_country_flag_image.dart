import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/styles/app_colors.dart';

class AppCircularCountryFlagImage extends StatelessWidget {
  final String? countryIsoCode;
  final double? right;
  final double? bottom;
  final double? radius;
  const AppCircularCountryFlagImage({
    super.key,
    this.countryIsoCode,
    this.right,
    this.bottom,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final bool countryIsoCodeIsNull = countryIsoCode == null;
    return Positioned(
      right: (right ?? 15).w,
      bottom: (bottom ?? 0).w,
      child: FractionalTranslation(
        translation: const Offset(0.45, -0.2),
        child: CircleAvatar(
          radius: (radius != null ? (radius! + 4) : 14).w,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundColor:
                countryIsoCodeIsNull ? AppColors.goldenOrange : null,
            radius: (radius ?? 10).w,
            child: countryIsoCodeIsNull
                ? const SizedBox()
                : CountryFlag.fromCountryCode(
                    countryIsoCode!,
                    shape: const Circle(),
                  ),
          ),
        ),
      ),
    );
  }
}
