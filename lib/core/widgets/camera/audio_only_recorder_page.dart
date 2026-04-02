import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../../gen/assets.gen.dart';
import '../../di/injection.dart';
import '../../services/app_preferences.dart';
import '../../theme/styles/app_colors.dart';
import '../../theme/styles/app_text_style.dart';
import '../app_transform_flip_x.dart';

/// Audio-only recorder page that records ONLY audio without any camera
/// This ensures complete user privacy - no camera is used at all
@RoutePage()
class AudioOnlyRecorderPage extends StatefulWidget {
  final bool withTimer;
  final Duration? timerCount;
  final String? timerCountInString;
  final List<Widget> widgets;
  final void Function()? onCancel;
  final void Function()? setStartRecording;
  final int minTimeToStopRecording;

  const AudioOnlyRecorderPage({
    super.key,
    required this.widgets,
    this.timerCount,
    this.timerCountInString,
    required this.withTimer,
    this.onCancel,
    this.setStartRecording,
    this.minTimeToStopRecording = 0,
  });

  @override
  State<AudioOnlyRecorderPage> createState() => _AudioOnlyRecorderPageState();
}

class _AudioOnlyRecorderPageState extends State<AudioOnlyRecorderPage> {
  final Record _audioRecorder = Record();
  bool _isRecording = false;
  bool _canStopRecording = false;
  Timer? _minTimeTimer;
  DateTime? _recordingEndTime;

  @override
  void dispose() {
    _audioRecorder.dispose();
    _minTimeTimer?.cancel();
    super.dispose();
  }

  Future<void> _startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        final Directory tempDir = await getTemporaryDirectory();
        final String audioPath =
            '${tempDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.mp4';

        await _audioRecorder.start(
          path: audioPath,
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
        );

        setState(() {
          _isRecording = true;
          _canStopRecording = widget.minTimeToStopRecording == 0;
          if (widget.withTimer) {
            _recordingEndTime = DateTime.now().add(widget.timerCount!);
          }
        });

        widget.setStartRecording?.call();

        if (widget.minTimeToStopRecording > 0) {
          _minTimeTimer = Timer(
            Duration(minutes: widget.minTimeToStopRecording),
            () {
              if (mounted) {
                setState(() {
                  _canStopRecording = true;
                });
              }
            },
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Microphone permission is required to record audio'),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Error starting recording: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error starting recording: $e')),
        );
      }
    }
  }

  Future<void> _stopRecording() async {
    if (!_canStopRecording) return;

    try {
      final path = await _audioRecorder.stop();
      _minTimeTimer?.cancel();
      setState(() {
        _recordingEndTime = null;
      });

      if (path != null && mounted) {
        context.router.maybePop(XFile(path));
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Recording failed - no file generated')),
        );
      }
    } catch (e) {
      debugPrint('Error stopping recording: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error stopping recording: $e')),
        );
      }
    }
  }

  void _cancelRecording() async {
    await _audioRecorder.stop();
    _minTimeTimer?.cancel();
    setState(() {
      _recordingEndTime = null;
    });
    widget.onCancel?.call();
    if (mounted) {
      context.router.maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 3 + 20.h,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mic,
                          size: 100.w,
                          color: _isRecording ? Colors.red : AppColors.navyBlue,
                        ),
                        30.verticalSpace,
                        Text(
                          _isRecording
                              ? 'Recording Audio'
                              : 'Audio-Only Recording',
                          style: AppTextStyles.font20TextW700.copyWith(
                            color: AppColors.navyBlue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        15.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Text(
                            _isRecording
                                ? 'Recording in progress...'
                                : 'Your face will not be recorded.\nOnly audio will be captured.',
                            style: AppTextStyles.font16TextW400.copyWith(
                              color: AppColors.navyBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (_isRecording && !_canStopRecording) ...[
                          30.verticalSpace,
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.w,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  AppColors.goldenOrange.withValues(alpha: .1),
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: AppColors.goldenOrange,
                                width: 2.w,
                              ),
                            ),
                            child: Text(
                              'Minimum recording time: ${widget.minTimeToStopRecording} min',
                              style: AppTextStyles.font14TextW400.copyWith(
                                color: AppColors.goldenOrange,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          ...widget.widgets,
          if (widget.withTimer)
            _AudioTimer(
              isRecording: _isRecording,
              stopRecording: _stopRecording,
              timerCount: widget.timerCount!,
              timerCountInString: widget.timerCountInString!,
              recordingEndTime: _recordingEndTime,
            ),
          _BackButton(onCancel: _cancelRecording),
          Positioned(
            bottom: 300.w,
            child: _RecordButton(
              isRecording: _isRecording,
              canStopRecording: _canStopRecording,
              onTap: _isRecording ? _stopRecording : _startRecording,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecordButton extends StatelessWidget {
  final bool isRecording;
  final bool canStopRecording;
  final VoidCallback onTap;

  const _RecordButton({
    required this.isRecording,
    required this.canStopRecording,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (canStopRecording || !isRecording) ? onTap : null,
      child: Container(
        width: 70.w,
        height: 70.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (canStopRecording || !isRecording)
              ? AppColors.goldenOrange
              : AppColors.dividerGrey,
          border: Border.all(
            color: AppColors.navyBlue,
            width: 4.w,
          ),
        ),
        child: Center(
          child: isRecording
              ? Container(
                  width: 25.w,
                  height: 25.w,
                  decoration: BoxDecoration(
                    color: canStopRecording ? Colors.red : Colors.grey,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                )
              : Icon(
                  Icons.fiber_manual_record,
                  color: Colors.white,
                  size: 30.w,
                ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback onCancel;

  const _BackButton({required this.onCancel});

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
          color: AppColors.navyBlue.withValues(alpha: .1),
          border: Border.all(
            color: AppColors.navyBlue.withValues(alpha: .3),
          ),
        ),
        child: IconButton(
          icon: AppTransformFlipX(
            child: SvgPicture.asset(
              Assets.icons.arrowBackCurve.path,
              colorFilter:
                  const ColorFilter.mode(AppColors.navyBlue, BlendMode.srcIn),
            ),
          ),
          onPressed: onCancel,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

class _AudioTimer extends StatelessWidget {
  final bool isRecording;
  final Duration timerCount;
  final String timerCountInString;
  final void Function() stopRecording;
  final DateTime? recordingEndTime;

  const _AudioTimer({
    required this.isRecording,
    required this.timerCount,
    required this.timerCountInString,
    required this.stopRecording,
    this.recordingEndTime,
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
          ),
        ),
        child: Center(
          child: isRecording && recordingEndTime != null
              ? Directionality(
                  textDirection: TextDirection.ltr,
                  child: TimerCountdown(
                    spacerWidth: 0,
                    enableDescriptions: false,
                    colonsTextStyle: AppTextStyles.font16WhiteW400,
                    format: CountDownTimerFormat.hoursMinutesSeconds,
                    timeTextStyle: AppTextStyles.font16WhiteW400,
                    endTime: recordingEndTime!,
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
