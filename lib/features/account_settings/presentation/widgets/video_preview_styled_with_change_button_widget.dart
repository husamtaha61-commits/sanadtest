import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/widgets/camera/video_player_view.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class VideoPlayerWithChange extends StatefulWidget {
  final bool enabled;
  final String? videoURL;
  final XFile? videoFile;
  final void Function(File?)? onVideoEditFinished;

  const VideoPlayerWithChange({
    super.key,
    required this.enabled,
    this.videoURL,
    this.videoFile,
    this.onVideoEditFinished,
  });

  @override
  State<VideoPlayerWithChange> createState() => _VideoPlayerWithChangeState();
}

class _VideoPlayerWithChangeState extends State<VideoPlayerWithChange> {
  final bool _isLoading = false;

  Future<void> _pickNewVideo() async {
    final picker = ImagePicker();
    final XFile? pickedVideo =
        await picker.pickVideo(source: ImageSource.gallery);

    if (pickedVideo != null) {
      if (widget.onVideoEditFinished != null) {
        widget.onVideoEditFinished!(File(pickedVideo.path));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasVideo =
        (widget.videoFile != null) || (widget.videoURL?.isNotEmpty ?? false);

    String? videoPath;
    DataSourceType sourceType;

    if (widget.videoFile != null) {
      videoPath = widget.videoFile!.path;
      sourceType = DataSourceType.file;
    } else if (widget.videoURL != null && widget.videoURL!.isNotEmpty) {
      videoPath = widget.videoURL;
      sourceType = DataSourceType.network;
    } else {
      videoPath = null;
      sourceType = DataSourceType.network;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AspectRatio(
          aspectRatio: 7 / 9,
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.navyBlue),
                )
              : hasVideo
                  ? VideoPlayerView(
                      key: ValueKey(videoPath),
                      url: videoPath!,
                      dataSourceType: sourceType,
                      aspectRatio: 7 / 9,
                    )
                  : Center(
                      child: Text(
                        "No video available",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor.withValues(alpha: .6),
                        ),
                      ),
                    ),
        ),
        SizedBox(height: 8.h),
        if (hasVideo)
          TextButton(
            onPressed: widget.enabled ? _pickNewVideo : null,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.white.withValues(alpha: .5),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.icons.upload.path,
                  width: 20.w,
                  height: 20.w,
                ),
                SizedBox(width: 6.w),
                Text(
                  LocaleKeys.button_replace,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    color: AppColors.textColor,
                  ),
                ).tr(),
              ],
            ),
          ),
      ],
    );
  }
}
