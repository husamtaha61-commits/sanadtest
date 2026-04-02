import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/styles/app_text_style.dart';

class ReciterDetailsContentNationalityContainer extends StatelessWidget {
  final String nationality;
  final String countryIsoCode;

  const ReciterDetailsContentNationalityContainer(
      {super.key, required this.nationality, required this.countryIsoCode});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(182, 198, 201, 0.1),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 16.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 10.r,
                child: CountryFlag.fromCountryCode(
                  countryIsoCode,
                  shape: const Circle(),
                ),
              ),
            ),
            10.horizontalSpace,
            Text(
              nationality,
              style: AppTextStyles.font12TextW400,
            ),
          ],
        ),
      ),
    );
  }
}
