import 'dart:io';

import 'package:auto_route/auto_route.dart';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:video_player/video_player.dart';

import '../../../gen/assets.gen.dart';
import '../../di/injection.dart';
import '../../services/app_preferences.dart';
import '../../theme/styles/app_colors.dart';
import '../../theme/styles/app_text_style.dart';
import '../app_transform_flip_x.dart';
import 'capture_button.dart';
import 'video_player_view.dart';

@RoutePage()
class CameraVideoAppPage extends StatefulWidget {
  final bool withTimer;
  final Duration? timerCount;
  final String? timerCountInString;
  final List<Widget> widgets;
  final double? cameraTop;
  final double? cameraBottom;
  final void Function()? onCancel;
  final bool withDecoration;
  final void Function()? setStartRecording;
  final int minTimeToStopRecording;
  const CameraVideoAppPage({
    super.key,
    required this.widgets,
    this.timerCount,
    this.timerCountInString,
    required this.withTimer,
    this.cameraTop,
    this.cameraBottom,
    this.onCancel,
    required this.withDecoration,
    this.setStartRecording,
    this.minTimeToStopRecording = 0,
  });

  @override
  State<CameraVideoAppPage> createState() => _CameraVideoAppPageState();
}

class _CameraVideoAppPageState extends State<CameraVideoAppPage> {
  String? video;
  String? tempPath;
  bool isRecording = false;

  CameraState? _cameraState;

  void _setCameraState(CameraState state) {
    setState(() {
      _cameraState = state;
    });
  }

  void _setTempPath(String filePath) {
    setState(() {
      tempPath = filePath;
    });
  }

  void _setVideo() {
    setState(() {
      video = tempPath;
    });
  }

  void _setTimer() {
    setState(() {
      isRecording = true;
      widget.setStartRecording?.call();
    });
  }

  void _stopRecording() async {
    if (_cameraState is VideoRecordingCameraState) {
      await (_cameraState as VideoRecordingCameraState).stopRecording();
      if (!mounted) return;
      _setVideo();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);
    return Scaffold(
      backgroundColor: Colors.black,
      body: video != null
          ? _VideoPreview(
              videoUrl: video!,
              onCancel: () {
                setState(
                  () {
                    video = null;
                    isRecording = false;
                  },
                );
                widget.onCancel?.call();
              },
              onSave: () => context.router.maybePop(XFile(video!)),
            )
          : Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
                Positioned.fill(
                  top: widget.cameraTop ?? 0,
                  bottom: widget.cameraBottom ?? 0,
                  child: Container(
                    decoration: widget.withDecoration
                        ? BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: 10.w),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          )
                        : null,
                    child: _CameraWidget(
                      isCheckedVidRecord: true,
                      setCameraState: _setCameraState,
                      setTimer: _setTimer,
                      setVideo: _setVideo,
                      setTempPath: _setTempPath,
                      minTimeToStopRecording: widget.minTimeToStopRecording,
                    ),
                  ),
                ),
                ...widget.widgets,
                if (widget.withTimer)
                  _CameraTimer(
                    isRecording: isRecording,
                    stopRecording: _stopRecording,
                    timerCount: widget.timerCount!,
                    timerCountInString: widget.timerCountInString!,
                  ),
                const _CameraBackButton()
              ],
            ),
    );
  }
}

class _VideoPreview extends StatelessWidget {
  final String videoUrl;
  final void Function() onCancel;
  final void Function() onSave;
  const _VideoPreview({
    required this.videoUrl,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.of(context).padding;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: safeArea.top + 45.w, bottom: safeArea.bottom),
          child: Column(
            children: [
              VideoPlayerView(
                url: videoUrl,
                dataSourceType: DataSourceType.file,
              ),
              15.verticalSpace,
            ],
          ),
        ),
        _VideoPreviewActionButton(
          onPressed: onCancel,
          icon: const Icon(Icons.clear),
          top: safeArea.top,
          left: safeArea.left + 10.w,
        ),
        _VideoPreviewActionButton(
          onPressed: onSave,
          icon: const Icon(Icons.check),
          right: safeArea.right + 15.w,
          bottom: safeArea.bottom,
        ),
      ],
    );
  }
}

class _VideoPreviewActionButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  const _VideoPreviewActionButton({
    this.onPressed,
    required this.icon,
    this.top,
    this.bottom,
    this.right,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      bottom: bottom,
      top: top,
      left: left,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.navyBlue,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: onPressed,
            icon: icon),
      ),
    );
  }
}

class _CameraWidget extends StatelessWidget {
  final void Function() setVideo;
  final void Function() setTimer;
  final void Function(CameraState) setCameraState;
  final void Function(String) setTempPath;
  final int minTimeToStopRecording;
  final bool isCheckedVidRecord;

  const _CameraWidget({
    required this.setVideo,
    required this.setTimer,
    required this.setCameraState,
    required this.setTempPath,
    required this.minTimeToStopRecording,
    this.isCheckedVidRecord = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CameraAwesomeBuilder.awesome(
          theme: AwesomeTheme(
            bottomActionsBackgroundColor: Colors.transparent,
          ),
          topActionsBuilder: (state) {
            return const SizedBox();
          },
          middleContentBuilder: (state) {
            return const SizedBox();
          },
          bottomActionsBuilder: (state) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20.w),
              child: CustomCaptureButton(
                state: state,
                setVideo: setVideo,
                setTimer: setTimer,
                setCameraState: setCameraState,
                minTimeToStopRecording: minTimeToStopRecording,
              ),
            );
          },
          saveConfig: SaveConfig.photoAndVideo(
              initialCaptureMode: CaptureMode.video,
              mirrorFrontCamera: true,
              videoPathBuilder: (sensors) async {
                final Directory extDir = await getTemporaryDirectory();
                final testDir = await Directory('${extDir.path}/camerawesome')
                    .create(recursive: true);

                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';
                setTempPath(filePath);

                return SingleCaptureRequest(filePath, sensors.first);
              },
              videoOptions: VideoOptions(
                  quality: VideoRecordingQuality.fhd,
                  enableAudio: true,
                  android: AndroidVideoOptions(bitrate: 4000000),
                  ios: CupertinoVideoOptions(fps: 60))),
          sensorConfig: SensorConfig.single(
            sensor: Sensor.position(SensorPosition.front),
            aspectRatio: CameraAspectRatios.ratio_4_3,
            flashMode: FlashMode.none,
            zoom: 0.0,
          ),
          enablePhysicalButton: true,
          availableFilters: const [],
        ),
      ],
    );
  }
}

class _CameraBackButton extends StatelessWidget {
  const _CameraBackButton();

  @override
  Widget build(BuildContext context) {
    final isAr = getIt<AppPreferences>().isAr;
    final safeArea = MediaQuery.of(context).padding;
    return Positioned.directional(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
      start: safeArea.left + 10.w,
      top: safeArea.top + 5.w,
      child: Container(
        width: 38.w,
        height: 38.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: Colors.black.withAlpha(100),
        ),
        child: IconButton(
          icon: AppTransformFlipX(
            child: SvgPicture.asset(Assets.icons.arrowBackCurve.path),
          ),
          onPressed: () => context.router.maybePop(),
          color: Colors.white,
        ),
      ),
    );
  }
}

class _CameraTimer extends StatelessWidget {
  final bool isRecording;
  final Duration timerCount;
  final String timerCountInString;
  final void Function() stopRecording;
  const _CameraTimer({
    required this.isRecording,
    required this.timerCount,
    required this.timerCountInString,
    required this.stopRecording,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      child: Container(
        width: 170.w,
        height: 42.w,
        decoration: BoxDecoration(
            color: AppColors.navyBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            )),
        child: Center(
          child: isRecording
              ? Directionality(
                  textDirection: TextDirection.ltr,
                  child: TimerCountdown(
                    spacerWidth: 0,
                    enableDescriptions: false,
                    colonsTextStyle: AppTextStyles.font16WhiteW400,
                    format: CountDownTimerFormat.hoursMinutesSeconds,
                    timeTextStyle: AppTextStyles.font16WhiteW400,
                    endTime: DateTime.now().add(timerCount),
                    onEnd: stopRecording,
                  ),
                )
              : Text(
                  timerCountInString,
                  style: AppTextStyles.font16WhiteW400,
                ),
        ),
      ),
    );
  }
}
