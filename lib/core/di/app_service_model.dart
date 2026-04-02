import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../network/dio_client.dart';
import '../network/retrofit_client.dart';
import '../routes/app_router.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

@module
abstract class AppServiceModel {
  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @lazySingleton
  Dio get dio => DioClient.createDio();

  @lazySingleton
  RetrofitClient get retrofitClient => RetrofitClient(dio);

  @preResolve
  Future<StreamingSharedPreferences> preferences() =>
      StreamingSharedPreferences.instance;

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FacebookAuth get facebookAuth => FacebookAuth.instance;

  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @lazySingleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @lazySingleton
  FlutterLocalNotificationsPlugin get flutterLocalNotificationsPlugin =>
      FlutterLocalNotificationsPlugin();

  @lazySingleton
  FirebaseCrashlytics get firebaseCrashlytics => FirebaseCrashlytics.instance;
}
