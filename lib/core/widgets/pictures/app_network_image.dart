import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../di/injection.dart';
import '../../network/api_constants.dart';
import '../../services/app_preferences.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageId;
  final double? imageSize;
  final double? memCache;
  final bool isCenterLoading;

  const AppNetworkImage({
    super.key,
    required this.imageId,
    this.imageSize,
    this.memCache,
    this.isCenterLoading = false,
  });

  bool _isFullUrl(String value) {
    return value.startsWith('http://') || value.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = _isFullUrl(imageId)
        ? imageId
        : '${DioConstants.baseUrl}${DioConstants.getFileByIdEndpoint}?fileId=$imageId';

    return imageId.isEmpty
        ? const SizedBox()
        : CachedNetworkImage(
            memCacheHeight: memCache != null
                ? (memCache!.w * MediaQuery.devicePixelRatioOf(context)).round()
                : null,
            fit: BoxFit.cover,
            width: imageSize?.w,
            height: imageSize?.w,
            imageUrl: imageUrl,
            httpHeaders: _isFullUrl(imageId)
                ? null
                : {
                    "Authorization":
                        'Bearer ${getIt<AppPreferences>().accessToken}'
                  },
            placeholder: (context, url) => isCenterLoading || imageSize == null
                ? const Center(child: CircularProgressIndicator())
                : const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
  }
}
