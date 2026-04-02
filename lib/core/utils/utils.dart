import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image/image.dart' as img;
import 'dart:io';
import 'dart:typed_data';

import '../../features/shared/presentation/bloc/user/user_cubit.dart';
import '../constants/constants.dart';
import '../di/injection.dart';
import '../enums/app_enums.dart';
import '../extenstions/string.dart';
import '../network/api_constants.dart';
import '../routes/app_router.dart';
import '../services/image_picker_service.dart';
import '../theme/styles/app_colors.dart';
import '../theme/styles/app_text_style.dart';
import '../widgets/app_elevated_button.dart';
import 'snackbar.dart';

bool isEmpty(String? value) => value == null || value.trim().isEmpty;
bool isName(String value) => AppRegex.name.hasMatch(value);
bool isEmail(String value) => AppRegex.email.hasMatch(value);
bool isPassword(String value) => AppRegex.password.hasMatch(value);

List<int> getLookUpsDataIntValues() {
  return LookUpsData.values.map((e) => e.intValue).toList();
}

bool isStudentRole(BuildContext context) {
  final cubit = context.read<UserCubit>();
  return cubit.state.role?.comparisonName == UserRoles.Student.name;
}

Future<void> showAppLoadingDialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: SizedBox(
        height: 60.w,
        width: 60.w,
        child: CircularProgressIndicator(
          strokeWidth: 4.w,
          color: AppColors.navyBlue,
        ),
      ),
    ),
  );
}

Future<void> showAppModalBottomSheet({
  required BuildContext context,
  required String title,
  required String subTitle,
  required String mainBtnLabel,
  required VoidCallback mainOnPressed,
  String? secBtnLabel,
  VoidCallback? secOnPressed,
  String? imagePath,
  TextStyle? titleStyle,
  bool isDismissible = false,
}) async {
  await showModalBottomSheet(
    constraints: const BoxConstraints(maxWidth: double.infinity),
    useSafeArea: true,
    isDismissible: isDismissible,
    isScrollControlled: true,
    enableDrag: isDismissible,
    context: context,
    builder: (builder) {
      return PopScope(
        canPop: isDismissible,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.w),
                topRight: Radius.circular(25.w),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                48.verticalSpace,
                if (imagePath != null) ...[
                  SvgPicture.asset(imagePath),
                  23.verticalSpace
                ],
                Text(
                  context.tr(title),
                  style: titleStyle ?? AppTextStyles.font32TextW700,
                  textAlign: TextAlign.center,
                ),
                15.verticalSpace,
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    context.tr(subTitle),
                    style: AppTextStyles.font24TextW400,
                    textAlign: TextAlign.center,
                  ),
                ),
                23.verticalSpace,
                AppElevatedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  onPressed: mainOnPressed,
                  child: Text(
                    context.tr(mainBtnLabel),
                    style: AppTextStyles.font14WhiteW500,
                  ),
                ),
                if (secBtnLabel != null) ...[
                  16.verticalSpace,
                  AppElevatedButton(
                    elevation: 0,
                    onPressed: secOnPressed,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: const BorderSide(
                        color: Color(0xffF22D2D),
                      ),
                    ),
                    child: Text(
                      context.tr(secBtnLabel),
                      style: AppTextStyles.font15TextW400
                          .copyWith(color: const Color(0xffF22D2D)),
                    ),
                  )
                ],
                43.verticalSpace
              ],
            ),
          ),
        ),
      );
    },
  );
}

void openVideoCamera<B extends Cubit>({
  required BuildContext context,
  Duration? timerCount,
  String? timerCountInString,
  required List<Widget> children,
  required void Function(XFile) setVideo,
  bool withTimer = false,
  B? blocValue,
  double? cameraTop,
  double? cameraBottom,
  void Function()? onCancel,
  bool withDecoration = false,
  void Function()? setStartRecording,
  int? minTimeToStopRecording,
  bool isAudioOnlyMode = false,
}) async {
  assert(
    (withTimer && timerCount != null && timerCountInString != null) ||
        !withTimer,
    'timerCount and timerCountInString are required when withTimer is true',
  );
  final file = await getIt<ImagePickerService>().pickVideo(
    context: context,
    timerCount: timerCount,
    timerCountInString: timerCountInString,
    children: children,
    withTimer: withTimer,
    blocValue: blocValue,
    cameraTop: cameraTop,
    cameraBottom: cameraBottom,
    onCancel: onCancel,
    withDecoration: withDecoration,
    setStartRecording: setStartRecording,
    minTimeToStopRecording: minTimeToStopRecording,
    isAudioOnlyMode: isAudioOnlyMode,
  );
  if (file != null) {
    setVideo(file);
  }
}

Future<void> shareReciterPage(int reciterId) async {
  await Share.share(
    '${DioConstants.baseUrl}/reciters/$reciterId',
    subject: "Share Reciter Profile",
  );
}

void navigateToHomePage(BuildContext context,
    {bool handleCustomRouting = false}) {
  context.router.replaceAll([MainRoute()], updateExistingRoutes: false);
  if (!handleCustomRouting) {
    return;
  }
  if (isStudentRole(context) &&
      !context.read<UserCubit>().state.hasActiveSchedule) {
    context.router.push(const ReciterListingRoute());
  }
}

Future<void> openUrl(String url, [bool showError = true]) async {
  try {
    final uri = Uri.parse(url);

    if (!await canLaunchUrl(uri)) {
      if (showError) {
        showGlobalSnackBar("Cannot open the link!", SnackBarStatus.error);
      }
      return;
    }

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } catch (err) {
    if (showError) {
      showGlobalSnackBar("Something went wrong!", SnackBarStatus.error);
    }
  }
}

String formatTime(int minutes) {
  // Calculate hours, minutes, and seconds.
  int hours = minutes ~/ 60;
  int remainingMinutes = minutes % 60;
  int seconds = 0;

  // Format the time to hh:mm:ss.
  String formattedTime =
      '${hours.toString().padLeft(2, '0')}:${remainingMinutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

  return formattedTime;
}

String formatDate(String date) {
  DateTime parsedDate = DateTime.parse(date);
  String formattedDateTime = DateFormat("EEEE d MMM yy - h:mm a")
      .format(parsedDate); // Outputs: Monday 18 Nov 24 - 5:05 PM

  return formattedDateTime;
}

TextDirection getTextDirection(String content) {
  final bool isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(content);
  return isArabic ? TextDirection.rtl : TextDirection.ltr;
}

String getFullName(String firstName, String middleName, String lastName) {
  return [
    firstName.toCapitalize(),
    if (middleName.isNotEmpty) middleName.toCapitalize(),
    lastName.toCapitalize(),
  ].join(' ');
}

String getDeviceLanguage() {
  Locale deviceLocale =
      View.of(scaffoldMessengerKey.currentContext!).platformDispatcher.locale;
  String languageCode = deviceLocale.languageCode;
  return languageCode;
}

T? safeCast<T>(dynamic object) => object is T ? object : null;

@pragma('vm:entry-point')
Future<File?> getRoundedImage(File file) async {
  try {
    Uint8List imageBytes = await file.readAsBytes();
    img.Image? image = img.decodeImage(imageBytes);
    if (image == null) return null;
    image = image.convert(numChannels: 4);

    int size = image.width < image.height ? image.width : image.height;
    img.Image circularImage = img.copyCrop(image,
        x: 0, y: 0, width: size, height: size, radius: size / 2);
    // Save to file
    String extension = file.path.split('.').last;
    String newPath =
        file.path.replaceFirst(RegExp(r'\.\w+$'), '_rounded.$extension');

    File roundedFile = File(newPath);
    if (extension.toLowerCase() == 'png') {
      await roundedFile.writeAsBytes(img.encodePng(circularImage));
    } else if (extension.toLowerCase() == 'jpg' ||
        extension.toLowerCase() == 'jpeg') {
      await roundedFile.writeAsBytes(img.encodeJpg(circularImage));
    } else {
      print("Unsupported format: $extension");
      return null;
    }

    return roundedFile;
  } catch (e) {
    print("Error processing image: $e");
  }
  return null;
}
