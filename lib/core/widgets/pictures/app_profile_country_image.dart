import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_circular_avatar_image.dart';
import 'app_cirular_nework_image.dart';
import 'app_circular_country_flag_image.dart';

class AppProfileCountryImage extends StatelessWidget {
  final String? countryIsoCode;
  final double imageSize;
  final double memCache;
  final String? profileImageId;
  final double? right;
  final double? bottom;
  final double? radius;
  final double? width;
  const AppProfileCountryImage({
    super.key,
    this.countryIsoCode,
    required this.imageSize,
    required this.memCache,
    this.profileImageId,
    this.right,
    this.bottom,
    this.radius,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (width ?? 120).w,
      child: Stack(
        children: [
          profileImageId != null
              ? AppCirularNeworkImage(
                  imageSize: imageSize,
                  memCache: memCache,
                  imageId: profileImageId!,
                )
              : AppCircularAvatarImage(imageSize: imageSize),
          if (countryIsoCode != null)
            AppCircularCountryFlagImage(
              countryIsoCode: countryIsoCode,
              right: right,
              bottom: bottom,
              radius: radius,
            )
        ],
      ),
    );
  }
}
