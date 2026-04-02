import 'dart:io';
import 'dart:isolate';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../gen/translations/codegen_loader.g.dart';
import '../di/injection.dart';
import '../sanad_app.dart';
import '../services/localization_service.dart';
import '../services/notification_service.dart';
import 'app_config.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'time_ago_config.dart';

void initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  getIt.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance(),
  );
  // START: Firebase Initialize //
  await Firebase.initializeApp(
    name: AppConfig.shared.firebaseAppName,
    options: AppConfig.shared.firebaseOptions,
  );
  // END: Firebase Initialize //


  // START: Firebase Crashlytics //
  if (kReleaseMode) {
    final firebaseCrashlytics = getIt<FirebaseCrashlytics>();

    // Catch errors from background isolates
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
        fatal: true,
      );
    }).sendPort);

    // Catch all errors that are thrown within the Flutter framework
    FlutterError.onError = (errorDetails) {
      firebaseCrashlytics.recordFlutterFatalError(errorDetails);
    };

    // Catch asynchronous errors that aren't handled by the Flutter framework
    PlatformDispatcher.instance.onError = (error, stack) {
      firebaseCrashlytics.recordError(error, stack, fatal: true);
      return true;
    };
  }
  // END: Firebase Crashlytics //

  Intl.defaultLocale = 'en';

  // START: EasyLocalization logger //
  EasyLocalization.logger.enableLevels = [
    LevelMessages.warning,
    LevelMessages.error,
  ];
  await EasyLocalization.ensureInitialized();
  // END: EasyLocalization logger //

  // START: ScreenUtil Initialize //
  if (kReleaseMode) {
    await ScreenUtil.ensureScreenSize();
  }
  // END: ScreenUtil Initialize //

  // START: Screen Orientation //
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // END: Screen Orientation //

  // START: Time Ago //
  timeago.setLocaleMessages('custom', getIt<TimeAgoCustomMessages>());
  // END: Time Ago //

  final localizationService = getIt<LocalizationService>();

  // IOS only
  if(Platform.isIOS) {
    final status = await AppTrackingTransparency.requestTrackingAuthorization();
    await FacebookAppEvents().setAdvertiserTracking(
        enabled: status == TrackingStatus.authorized,
        collectId: status == TrackingStatus.authorized
    );
  }

  await APNService.initialize();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (_, __) => EasyLocalization(
          supportedLocales: localizationService.supportedLocales,
          saveLocale: localizationService.saveLocale,
          path: localizationService.langAssetPath,
          assetLoader: const CodegenLoader(),
          child: SanadApp(),
        ),
      ),
    ),
  );
}
