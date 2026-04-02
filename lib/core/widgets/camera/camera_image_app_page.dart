import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../di/injection.dart';
import '../../services/image_picker_service.dart';
import 'capture_button.dart';

@RoutePage()
class CameraImageAppPage extends StatefulWidget {
  const CameraImageAppPage({
    super.key,
    this.navigateToImageEditor = false
  });

  final bool navigateToImageEditor;

  @override
  State<CameraImageAppPage> createState() => _CameraImageAppPageState();
}

class _CameraImageAppPageState extends State<CameraImageAppPage> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);
    final safeArea = MediaQuery.of(context).padding;
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
              theme: AwesomeTheme(
                bottomActionsBackgroundColor: Colors.transparent,
              ),
              topActionsBuilder: (state) {
                return const SizedBox();
              },
              bottomActionsBuilder: (state) {
                return Padding(
                  padding: EdgeInsets.only(bottom: safeArea.bottom + 10.w),
                  child: CustomCaptureButton(
                    state: state,
                  ),
                );
              },
              middleContentBuilder: (state) {
                return const SizedBox();
              },
              saveConfig: SaveConfig.photoAndVideo(
                mirrorFrontCamera: false,
                initialCaptureMode: CaptureMode.photo,
                photoPathBuilder: (sensors) async {
                  final Directory extDir = await getTemporaryDirectory();
                  final testDir = await Directory('${extDir.path}/camerawesome')
                      .create(recursive: true);

                  final String filePath =
                      '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

                  Future.delayed(
                    const Duration(milliseconds: 100),
                    () async {
                      var isStop = false;
                      while (!isStop) {
                        isStop = await File(filePath).exists();
                        if (isStop) {
                          if(widget.navigateToImageEditor) {
                            final croppedImage = await getIt<ImagePickerService>().launchImageEditor(filePath);
                            context.router.maybePop(croppedImage != null ? XFile(croppedImage.path) : null);
                          } else {
                            context.router.maybePop(XFile(filePath));
                          }
                        }
                      }
                    },
                  );

                  return SingleCaptureRequest(filePath, sensors.first);
                },
              ),
              sensorConfig: SensorConfig.single(
                sensor: Sensor.position(SensorPosition.back),
                flashMode: FlashMode.none,
                zoom: 0.0,
                aspectRatio: CameraAspectRatios.ratio_16_9,
              ),
              enablePhysicalButton: true,
              availableFilters: const [],
            ),
    );
  }
}
