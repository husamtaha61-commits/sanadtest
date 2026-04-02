import 'dart:async';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/styles/app_colors.dart';

class CustomCaptureButton extends StatefulWidget {
  final CameraState state;
  final void Function()? setVideo;
  final void Function()? setTimer;
  final void Function(CameraState state)? setCameraState;
  final int minTimeToStopRecording;

  const CustomCaptureButton({
    super.key,
    required this.state,
    this.setVideo,
    this.setTimer,
    this.setCameraState,
    this.minTimeToStopRecording = 0,
  });

  @override
  State<CustomCaptureButton> createState() => _CustomCaptureButtonState();
}

class _CustomCaptureButtonState extends State<CustomCaptureButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late double _scale;
  final Duration _duration = const Duration(milliseconds: 100);

  late bool canStopRecording;
  DateTime? initalRecordingDate;

  void _setCameraRecordButton() {
    initalRecordingDate = DateTime.now();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if(mounted){
        setState(() {
          final requiredTime = initalRecordingDate!
              .add(Duration(minutes: widget.minTimeToStopRecording));
          if (requiredTime.isBefore(DateTime.now())) {
            canStopRecording = true;
            timer.cancel();
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    canStopRecording = widget.minTimeToStopRecording == 0 ? true : false;

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state is AnalysisController) {
      return Container();
    }
    _scale = 1 - _animationController.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: SizedBox(
        key: const ValueKey('cameraButton'),
        height: 50.w,
        width: 50.w,
        child: Transform.scale(
          scale: _scale,
          child: CustomPaint(
            painter: widget.state.when(
              onPhotoMode: (_) => CameraButtonPainter(),
              onPreparingCamera: (_) => CameraButtonPainter(),
              onVideoMode: (_) => VideoButtonPainter(),
              onVideoRecordingMode: (_) => VideoButtonPainter(
                isRecording: true,
                canStopRecording: canStopRecording,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onTapDown(TapDownDetails details) {
    HapticFeedback.selectionClick();
    _animationController.forward();
  }

  _onTapUp(TapUpDetails details) {
    Future.delayed(_duration, () {
      if (mounted && !_animationController.isAnimating) {
        _animationController.reverse();
      }
    });

    onTap.call();
  }

  _onTapCancel() {
    if (mounted && !_animationController.isAnimating) {
      _animationController.reverse();
    }
  }

  get onTap => () {
        widget.state.when(
          onPhotoMode: (photoState) async => await photoState.takePhoto(),
          onVideoMode: (videoState) async {
            _setCameraRecordButton();
            await videoState.startRecording();
            Future.delayed(const Duration(seconds: 1), () {
              widget.setCameraState!(widget.state);
              widget.setTimer!();
            });
          },
          onVideoRecordingMode: (videoState) async {
            if (canStopRecording) {
              await videoState.stopRecording();
              widget.setVideo!();
            }
          },
        );
      };
}

class CameraButtonPainter extends CustomPainter {
  CameraButtonPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var bgPainter = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    var center = Offset(size.width / 2, size.height / 2);
    bgPainter.color = AppColors.goldenOrange.withValues(alpha: 0.4);
    canvas.drawCircle(center, 32.w, bgPainter);

    bgPainter.color = AppColors.goldenOrange;
    canvas.drawCircle(center, 25.w, bgPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class VideoButtonPainter extends CustomPainter {
  final bool isRecording;
  final bool canStopRecording;

  VideoButtonPainter({
    this.isRecording = false,
    this.canStopRecording = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var bgPainter = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    var center = Offset(size.width / 2, size.height / 2);

    bgPainter.color = canStopRecording
        ? AppColors.goldenOrange.withValues(alpha: .4)
        : AppColors.dividerGrey.withValues(alpha: .4);
    canvas.drawCircle(center, 32.w, bgPainter);

    bgPainter.color =
        canStopRecording ? AppColors.goldenOrange : AppColors.dividerGrey;
    canvas.drawCircle(center, 25.w, bgPainter);

    if (isRecording) {
      bgPainter.color = canStopRecording ? Colors.red : Colors.grey;
      canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(
              17.w,
              17.w,
              size.width - (17 * 2).w,
              size.height - (17 * 2).w,
            ),
            const Radius.circular(3),
          ),
          bgPainter);
    } else {
      bgPainter.color = Colors.white;
      canvas.drawCircle(center, 8.w, bgPainter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
