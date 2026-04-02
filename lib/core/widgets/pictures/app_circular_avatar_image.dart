import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';

class AppCircularAvatarImage extends StatelessWidget {
  final double imageSize;
  const AppCircularAvatarImage({super.key, required this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize.w,
      height: imageSize.w,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        Assets.images.avatar.path,
        fit: BoxFit.cover,
      ),
    );
  }
}
