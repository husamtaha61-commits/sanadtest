import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'app_network_image.dart';

class AppCirularNeworkImage extends StatelessWidget {
  final String imageId;
  final double imageSize;
  final double memCache;
  const AppCirularNeworkImage(
      {super.key,
      required this.imageId,
      required this.imageSize,
      required this.memCache});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(53.w),
      child: Skeleton.replace(
          replacement: Container(
            width: imageSize.w,
            height: imageSize.w,
            color: Colors.white,
          ),
          child: AppNetworkImage(
            imageId: imageId,
            imageSize: imageSize,
            memCache: memCache,
          )),
    );
  }
}
