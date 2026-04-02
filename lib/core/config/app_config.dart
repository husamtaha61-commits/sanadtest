import 'package:firebase_core/firebase_core.dart';

import 'firebase/firebase_options.dart' as firebase_prod;
import 'firebase/firebase_options_dev.dart' as firebase_dev;
import 'firebase/firebase_options_stage.dart' as firebase_stage;

enum Flavor { dev, stage, prod }

class AppConfig {
  final String appName;
  final String baseUrl;
  final String quranPageUrl;
  final Flavor flavor;
  final String firebaseAppName;
  final FirebaseOptions firebaseOptions;

  static AppConfig shared = AppConfig.create(appProdConfig);

  factory AppConfig.create(AppConfig appConfig) {
    return shared = AppConfig(
      appName: appConfig.appName,
      baseUrl: appConfig.baseUrl,
      quranPageUrl: appConfig.quranPageUrl,
      flavor: appConfig.flavor,
      firebaseAppName: appConfig.firebaseAppName,
      firebaseOptions: appConfig.firebaseOptions,
    );
  }

  AppConfig({
        required this.appName,
        required this.baseUrl,
        required this.quranPageUrl,
        required this.flavor,
        required this.firebaseAppName,
        required this.firebaseOptions
      });
}

final appDevConfig = AppConfig(
  appName: "Sanad Dev",
  baseUrl: "https://sanad-api-dev.sociumtech.com/api",
  quranPageUrl: 'https://sanad-stage-quran.sociumtech.com',
  flavor: Flavor.dev,
  firebaseAppName: "Sanad-Dev",
  firebaseOptions: firebase_dev.DefaultFirebaseOptions.currentPlatform,
);

final appStageConfig = AppConfig(
  appName: "Sanad Stage",
  baseUrl: "https://sanad-revamp-staging.sociumtech.com/api",
  quranPageUrl: 'https://sanad-quran-page-staging.sociumtech.com',
  flavor: Flavor.stage,
  firebaseAppName: "Sanad-Stage",
  firebaseOptions: firebase_stage.DefaultFirebaseOptions.currentPlatform,
);

final appProdConfig = AppConfig(
  appName: "Sanad Prod",
  baseUrl: "https://api.sanadquran.com/api",
  quranPageUrl: 'https://quran-page.sanadquran.com',
  flavor: Flavor.prod,
  firebaseAppName: "Sanad-Prod",
  firebaseOptions: firebase_prod.DefaultFirebaseOptions.currentPlatform,
);
