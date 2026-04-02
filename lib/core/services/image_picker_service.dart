import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../gen/translations/locale_keys.g.dart';
import '../extenstions/file.dart';
import '../routes/app_router.dart';
import '../theme/styles/app_colors.dart';
import '../theme/styles/app_text_style.dart';
import '../widgets/camera/camera_video_app_page.dart';
import '../widgets/camera/audio_only_recorder_page.dart';

@lazySingleton
class ImagePickerService {
  final ImagePicker imagePicker;

  ImagePickerService(this.imagePicker);

  Future<dynamic> pickImage(
    BuildContext context, {
    bool allowMultiple = false,
    bool navigateToImageEditor = false,
  }) async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          context.tr(LocaleKeys.imagePicker_popupTitle),
          style: AppTextStyles.font16TextW400,
        ),
        titlePadding: EdgeInsets.all(24.w),
        actions: [
          MaterialButton(
            child: Text(
              LocaleKeys.imagePicker_camera,
              style: AppTextStyles.font14TextW500,
            ).tr(),
            onPressed: () => context.router.maybePop(ImageSource.camera),
          ),
          MaterialButton(
            child: Text(
              LocaleKeys.imagePicker_gallery,
              style: AppTextStyles.font14TextW500,
            ).tr(),
            onPressed: () => context.router.maybePop(ImageSource.gallery),
          )
        ],
      ),
    );
    if (imageSource == ImageSource.gallery) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
        allowMultiple: allowMultiple,
      );
      if (result != null) {
        if (!allowMultiple && navigateToImageEditor) {
          if (File(result.xFiles.first.path).isImage) {
            final croppedImage =
                await launchImageEditor(result.xFiles.first.path);
            return XFile(croppedImage?.path ?? "");
          }
          return result.xFiles.first;
        }
        // Return single file when allowMultiple is false, otherwise return list
        return allowMultiple ? result.xFiles : result.xFiles.first;
      }
    } else if (imageSource == ImageSource.camera) {
      if (context.mounted) {
        return await context.router.push(CameraImageAppRoute(
            navigateToImageEditor: navigateToImageEditor)) as XFile?;
      }
    }
    return null;
  }

  Future<CroppedFile?> launchImageEditor(String imagePath) {
    return ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Edit Image',
          toolbarColor: AppColors.navyBlue,
          toolbarWidgetColor: AppColors.goldenOrange,
        ),
        IOSUiSettings(
          title: 'Edit Image',
        ),
      ],
    );
  }

  Future<XFile?> pickVideo<B extends Cubit>({
    required BuildContext context,
    Duration? timerCount,
    String? timerCountInString,
    required List<Widget> children,
    required bool withTimer,
    B? blocValue,
    double? cameraTop,
    double? cameraBottom,
    void Function()? onCancel,
    required bool withDecoration,
    void Function()? setStartRecording,
    int? minTimeToStopRecording,
    required bool isAudioOnlyMode,
  }) async {
    XFile? file;

    final page = isAudioOnlyMode
        ? AudioOnlyRecorderPage(
            widgets: children,
            timerCount: timerCount,
            timerCountInString: timerCountInString,
            withTimer: withTimer,
            onCancel: onCancel,
            setStartRecording: setStartRecording,
            minTimeToStopRecording: minTimeToStopRecording ?? 0,
          )
        : CameraVideoAppPage(
            timerCount: timerCount,
            timerCountInString: timerCountInString,
            withTimer: withTimer,
            widgets: children,
            cameraTop: cameraTop,
            cameraBottom: cameraBottom,
            onCancel: onCancel,
            withDecoration: withDecoration,
            setStartRecording: setStartRecording,
            minTimeToStopRecording: minTimeToStopRecording ?? 0,
          );

    file = await context.router.pushWidget(
      blocValue != null
          ? BlocProvider.value(value: blocValue, child: page)
          : page,
    ) as XFile?;

    return file;
  }
}
