import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import '../../di/injection.dart';
import '../../services/app_preferences.dart';
import '../../theme/styles/app_colors.dart';

class VideoPlayerView extends StatefulWidget {
  final double? aspectRatio;

  const VideoPlayerView({
    super.key,
    required this.url,
    required this.dataSourceType,
    this.aspectRatio,
  });

  final String url;

  final DataSourceType dataSourceType;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool wasPlayingBefore = false;

  @override
  void initState() {
    super.initState();

    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);

        break;
      case DataSourceType.network:
        _videoPlayerController = VideoPlayerController.networkUrl(
          Uri.parse(widget.url),
          // Uri.parse("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
          httpHeaders: {
            "Authorization": 'Bearer ${getIt<AppPreferences>().accessToken}'
          },
        );

        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }

    _videoPlayerController?.initialize().then((_) {
      setState(
        () => _chewieController = ChewieController(
          showOptions: false,
          materialProgressColors: ChewieProgressColors(
              playedColor: AppColors.goldenOrange,
              backgroundColor: const Color(0xffF8F9FA),
              bufferedColor: const Color(0xffF8F9FA),
              handleColor: AppColors.goldenOrange),
          cupertinoProgressColors: ChewieProgressColors(
              playedColor: AppColors.goldenOrange,
              backgroundColor: const Color(0xffF8F9FA),
              bufferedColor: const Color(0xffF8F9FA),
              handleColor: AppColors.goldenOrange),
          videoPlayerController: _videoPlayerController!,
          aspectRatio: _videoPlayerController!.value.aspectRatio,
        ),
      );
      _videoPlayerController?.addListener(yourListeningMethod);
    });
  }

  void yourListeningMethod() {
    if (!_videoPlayerController!.value.isPlaying && !wasPlayingBefore) {
      // https://github.com/flutter/flutter/issues/165149 -> Workaround if seekTo another position while it was paused before.
      // On Android this might lead to infinite loading, so just play the video again.
      if (_videoPlayerController!.value.position.inSeconds ==
          _videoPlayerController!.value.duration.inSeconds) {
        _videoPlayerController!.pause();
      } else {
        _videoPlayerController!.play();
      }
    }
    wasPlayingBefore = _videoPlayerController!.value.isPlaying;
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _videoPlayerController!.value.isInitialized
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.black,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: AspectRatio(
                        aspectRatio: widget.aspectRatio ??
                            _videoPlayerController!.value.aspectRatio,
                        child: Chewie(controller: _chewieController!),
                      ),
                    ),
                  ),
                )
              : AspectRatio(
                  aspectRatio: widget.aspectRatio ?? 1 / 1,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.navyBlue,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
