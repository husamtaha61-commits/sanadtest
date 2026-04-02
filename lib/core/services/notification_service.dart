import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';
import '../extenstions/string.dart';
import '../network/api_constants.dart';
import '../network/dio_client.dart';
import '../network/retrofit_client.dart';
import '../utils/notification_manager.dart';
import '../utils/snackbar.dart';
import 'app_preferences.dart';

@pragma('vm:entry-point')
Future<void> _handleBackgroundNotification(RemoteMessage message) async {
  try {
    if (!message.isFromTwilio) {
      final pref = SharedPreferencesAsync();
      final key = PreferencesKey.notifications.name;
      List<String> notifications = await pref.getStringList(key) ?? [];
      notifications.add(jsonEncode(message.data));
      pref.setStringList(key, notifications);
      return;
    }
    await _twilioMessageReceiveHandler(message, false);
  } catch (err) {
    // Don't call showGeneralSnackBarError in background isolate - no UI context
    if (kDebugMode) {
      log("_handleBackgroundNotification error: $err");
    }
  }
}

@pragma('vm:entry-point')
Future<File?> _downloadImage(String? imageId) async {
  final dio = DioClient.createDio(
    baseOptions: BaseOptions(),
    interceptors: DioConstants.isolateInterceptors,
  );
  try {
    final imageExtension = '.${imageId!.split(".").last}';
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/avatar_image$imageExtension';

    final response = await dio.get(
        '${DioConstants.baseUrl}${DioConstants.getFileByIdEndpoint}?fileId=$imageId',
        options: Options(responseType: ResponseType.bytes));
    if (response.statusCode == 200) {
      return await File(filePath).writeAsBytes(response.data);
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

@pragma('vm:entry-point')
Future<void> _twilioMessageReceiveHandler(
    RemoteMessage message, bool fore) async {
  try {
    log("_twilioMessageReceiveHandler started, fore: $fore");

    const androidChannel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: "This channel is used for important notifications",
      importance: Importance.high,
    );

    log("Getting message info...");
    final twilioMessageInfo = await message.getMessageInfo();
    log("Message info received: ${twilioMessageInfo.name}, ${twilioMessageInfo.messageBody}");

    File? avatarFile;
    try {
      avatarFile = await _downloadImage(twilioMessageInfo.avatarImageUrl);
    } catch (_) {
      // Ignore avatar download errors
    }

    // Create and initialize the plugin for background isolate
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Initialize for background usage
    const androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInitializationSettings = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    log("FlutterLocalNotificationsPlugin initialized");

    // Create the notification channel on Android
    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidChannel);
      log("Android notification channel created");
    }

    log("Showing notification...");
    await flutterLocalNotificationsPlugin.show(
      twilioMessageInfo.hashCode & 0x7FFFFFFF, // Mask to 31 bits
      "${kDebugMode ? (fore ? "Fore" : "Back") : ""}New Message from ${twilioMessageInfo.name}",
      twilioMessageInfo.messageBody,
      NotificationDetails(
          android: AndroidNotificationDetails(
            "high_importance_channel",
            androidChannel.name,
            channelDescription: androidChannel.description,
            icon: '@mipmap/ic_launcher',
            largeIcon: avatarFile != null
                ? FilePathAndroidBitmap(avatarFile.path)
                : null,
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(
            presentBadge: true,
            presentBanner: true,
            presentList: true,
            presentSound: true,
            attachments: avatarFile != null
                ? [DarwinNotificationAttachment(avatarFile.path)]
                : null,
          )),
      payload: jsonEncode(twilioMessageInfo.toPayloadMap()),
    );
    log("Notification shown successfully");
  } catch (e, stackTrace) {
    // Log error but don't crash - show a basic notification if possible
    log("_twilioMessageReceiveHandler error: $e");
    log("Stack trace: $stackTrace");
  }
}

@lazySingleton
class NotificationService {
  final FirebaseMessaging _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _flutterLocalNotifications;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: "This channel is used for important notifications",
    importance: Importance.high,
  );

  NotificationService(this._firebaseMessaging, this._flutterLocalNotifications);

  Future<void> initNotifications() async {
    _firebaseMessaging.requestPermission(provisional: false);
    await initPushNotifications();
    await initLocalNotifications();
  }

  Future<String?> getFCMToken() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      log("FCMToken $fcmToken");
      return fcmToken;
    } catch (error) {
      log(error.toString());
    }
    return null;
  }

  //S==========================Push Notifications==========================S//

  Future<void> initPushNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _firebaseMessaging.getInitialMessage().then(handleMessageTap);
    // When the app is opened via a notification from terminated state

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessageTap);
    // When the app is opened via a notification from background state

    FirebaseMessaging.onBackgroundMessage(_handleBackgroundNotification);
    // When the app is received a notification within background/terminated state

    FirebaseMessaging.onMessage.listen(handleMessageReceive);
    // When the app is received a notification within foreground state
  }

  void handleMessageReceive(RemoteMessage? message) {
    if (message == null) return;
    log("Received FCM message: ${message.data}");
    try {
      if (message.isFromTwilio) {
        _twilioMessageReceiveHandler(message, true).catchError((e) {
          if (kDebugMode) {
            log("Twilio message handler error: $e");
          }
        });
      } else {
        _defaultMessageReceiveHandler(message);
      }
    } catch (err) {
      if (kDebugMode) {
        log("handleMessageReceive error: $err");
      }
      showGeneralSnackBarError();
    }
  }

  void _defaultMessageReceiveHandler(RemoteMessage message) {
    try {
      NotificationManager.handleLogic(
          message.data, scaffoldMessengerKey.currentContext!);
    } catch (_) {
      showGeneralSnackBarError();
    }
    final notification = message.notification;
    if (notification == null) return;
    _flutterLocalNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          "high_importance_channel",
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      payload: jsonEncode(message.toMap()),
    );
  }

  void handleMessageTap(RemoteMessage? message) {
    if (message == null) return;
    try {
      NotificationManager.navigateToScreen(message: message);
    } catch (err) {
      showGeneralSnackBarError();
    }
  }

  //E==========================Push Notifications==========================E//

  //S==========================Local Notifications==========================S//

  Future<void> initLocalNotifications() async {
    const androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const iosInitializationSettings = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    // request notification permissions for android 13 or above
    if (Platform.isAndroid) {
      final androidPlugin =
          _flutterLocalNotifications.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!;

      await androidPlugin.requestNotificationsPermission();

      // Create the notification channel for Android
      await androidPlugin.createNotificationChannel(_androidChannel);
    }

    await _flutterLocalNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onLocalNotificationTap,
    );
  }

  // when local notification is tapped in foreground
  void onLocalNotificationTap(NotificationResponse notificationResponse) async {
    try {
      final payload = jsonDecode(notificationResponse.payload!);

      // Check if this is a Twilio message notification
      if (payload['isTwilioMessage'] == true) {
        NotificationManager.navigateToTwilioChat(payload);
        return;
      }

      final message = RemoteMessage.fromMap(payload);
      NotificationManager.navigateToScreen(
          message: message, logShowContentEvent: true);
    } catch (err) {
      showGeneralSnackBarError();
    }
  }

  Future<NotificationAppLaunchDetails?> getNotificationAppLaunchDetails() =>
      _flutterLocalNotifications.getNotificationAppLaunchDetails();
  // get the local notification that opened the app from the terminated state

  //E==========================Local Notifications==========================E//
}

extension TwilioRemoteMessageExtension on RemoteMessage {
  bool get isFromTwilio => data.containsKey("twi_message_id");

  int get _authorId => int.parse(data["author"]);

  String get _messageBody => data["twi_body"];

  String? get conversationSid => data["conversation_sid"];

  Future<TwilioMessageInfo> getMessageInfo() async {
    try {
      final dio =
          DioClient.createDio(interceptors: DioConstants.isolateInterceptors);

      final retrofitClient = RetrofitClient(dio);
      final userInfo = (await retrofitClient.getUserInfo(_authorId)).data;

      return TwilioMessageInfo(
        avatarImageUrl: userInfo.profileImageUrl,
        name:
            "${userInfo.firstName?.toCapitalize() ?? ""} ${userInfo.lastName?.toCapitalize() ?? ""}",
        messageBody: _messageBody,
        conversationSid: conversationSid,
        authorId: _authorId,
        firstName: userInfo.firstName ?? "",
        middleName: userInfo.middleName,
        lastName: userInfo.lastName ?? "",
      );
    } catch (e) {
      // Return fallback info if network request fails
      return TwilioMessageInfo(
        avatarImageUrl: null,
        name: "User",
        messageBody: _messageBody,
        conversationSid: conversationSid,
        authorId: _authorId,
        firstName: "",
        middleName: null,
        lastName: "",
      );
    }
  }
}

class TwilioMessageInfo {
  TwilioMessageInfo({
    required this.avatarImageUrl,
    required this.name,
    required this.messageBody,
    required this.conversationSid,
    required this.authorId,
    required this.firstName,
    this.middleName,
    required this.lastName,
  });

  final String? avatarImageUrl;
  final String name;
  final String messageBody;
  final String? conversationSid;
  final int authorId;
  final String firstName;
  final String? middleName;
  final String lastName;

  Map<String, dynamic> toPayloadMap() => {
        'isTwilioMessage': true,
        'conversationSid': conversationSid,
        'authorId': authorId,
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'profileImageUrl': avatarImageUrl,
      };
}

class APNService {
  static const MethodChannel _channel = MethodChannel('APNS_CHANNEL');

  static Future<void> initialize() async {
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  static Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'IOSTwilioNewMessage':
        try {
          final data = Map<String, dynamic>.from(call.arguments);
          return await _processBackgroundData(data, true);
        } catch (e) {
          print(e);
          return false;
        }
      case 'IOSTwilioNewMessageBackground':
        try {
          final data = Map<String, dynamic>.from(call.arguments);
          return await _processBackgroundData(data, false);
        } catch (e) {
          print(e);
          return false;
        }
      default:
    }
  }

  static Future<bool> _processBackgroundData(
      Map<String, dynamic> data, bool isFore) async {
    try {
      _twilioMessageReceiveHandler(RemoteMessage(data: data), isFore);
      return true; // Return true for success
    } catch (e) {
      print('Background task failed: $e');
      return false;
    }
  }
}
