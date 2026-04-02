import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../core/network/api_constants.dart';
import '../../../../../../../core/widgets/camera/video_player_view.dart';
import '../../../../domain/entites/reciter.dart';

class ReciterDetailsContentVideoPreview extends StatelessWidget {
  final Reciter reciter;
  final bool isShared;
  const ReciterDetailsContentVideoPreview(
      {super.key, required this.reciter, this.isShared = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.black,
      ),
      child: Stack(
        children: [
          VideoPlayerView(
            url: '${DioConstants.baseUrl}${DioConstants.getVideoByIdEndpoint}?fileId=${reciter.videoId}',
            dataSourceType: DataSourceType.network,
            aspectRatio: 1 / 1,
          ),
        ],
      ),
    );
  }
}