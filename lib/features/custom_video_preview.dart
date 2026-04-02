import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../core/theme/styles/app_colors.dart';
import '../core/theme/styles/app_text_style.dart';

class StyledVideoPlayer extends StatefulWidget {
  final String path;

  const StyledVideoPlayer({required this.path, super.key});

  @override
  State<StyledVideoPlayer> createState() => _StyledVideoPlayerState();
}

class _StyledVideoPlayerState extends State<StyledVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isSeeking = false;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() {
          _isInitialized = true;
        });
      });

    _controller.addListener(() {
      if (!mounted) return;
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(color: const Color.fromARGB(255, 139, 134, 134)),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1.65,
            child: VideoPlayer(_controller),
          ),

          if (_isSeeking)
            const Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Center(child: CircularProgressIndicator())
            ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  ValueListenableBuilder<VideoPlayerValue>(
                    valueListenable: _controller,
                    builder: (context, value, child) {
                      double positionSeconds =
                          value.position.inSeconds.toDouble().clamp(0, value.duration.inSeconds.toDouble());
                      final durationSeconds = value.duration.inSeconds.toDouble();

                      return Slider(
                        activeColor: AppColors.goldenOrange,
                        
                        value: positionSeconds,
                        max: durationSeconds > 0 ? durationSeconds : 1,
                        onChangeStart: (v) {
                          setState(() {
                            _isSeeking = true;
                          });
                        },
                        onChanged: (v) {
                          setState(() {
                          });
                        },
                        onChangeEnd: (v) async {
                          await _controller.seekTo(Duration(seconds: v.toInt()));
                          setState(() {
                            _isSeeking = false;
                          });
                        },
                      );
                    },
                  ),

                  ValueListenableBuilder<VideoPlayerValue>(
                    valueListenable: _controller,
                    builder: (context, value, child) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _formatDuration(value.position),
                            style: AppTextStyles.font14navyBlueW400,
                          ),
                          17.horizontalSpace,
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: _togglePlayPause,
                            child: Center(
                              child: ValueListenableBuilder<VideoPlayerValue>(
                                valueListenable: _controller,
                                builder: (context, value, child) {
                                  return Container(
                                    width: 35.h,
                                    height: 35.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFFFFFFFF).withValues(alpha: 0.4), 
                                          blurRadius: 2.3, 
                                          spreadRadius: 2.3, 
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      value.isPlaying ? Icons.pause : Icons.play_arrow,
                                      color: AppColors.goldenOrange,
                                      size: 14.h,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          17.horizontalSpace,
                          Text(
                            _formatDuration(value.duration),
                            style: AppTextStyles.font14navyBlueW400,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
