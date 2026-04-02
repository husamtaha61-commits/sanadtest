import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:facebook_app_events/facebook_app_events.dart';

class AnalyticsService with WidgetsBindingObserver {
  // Singleton
  AnalyticsService._privateConstructor() {
    WidgetsBinding.instance.addObserver(this);
  }

  static final AnalyticsService instance =
      AnalyticsService._privateConstructor();

  // SDK instances
  final FirebaseAnalytics _firebase = FirebaseAnalytics.instance;
  final FacebookAppEvents _facebook = FacebookAppEvents();

  // App lifecycle state
  AppLifecycleState _state = AppLifecycleState.resumed;
  DateTime? _sessionStart;

  bool get isAppActive => _state == AppLifecycleState.resumed;

  // ------------------------------
  // LIFECYCLE EVENTS
  // ------------------------------
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _state = state;

    if (state == AppLifecycleState.resumed) {
      // Start session timer
      _sessionStart = DateTime.now();
    } else if (state == AppLifecycleState.paused) {
      // End session and log duration
      if (_sessionStart != null) {
        final duration = DateTime.now().difference(_sessionStart!).inSeconds;
        AnalyticsService.instance.logEvent(
          'session_duration',
          parameters: {'duration_seconds': duration},
        );
        _sessionStart = null;
      }
    }
  }

  // ------------------------------
  // SCREEN VIEW
  // ------------------------------
  void logScreenView(String screenName) {
    logEvent('screen_view', parameters: {'screen_name': screenName});
  }

  // ------------------------------
  // CUSTOM EVENTS
  // ------------------------------
  void logEvent(String name, {Map<String, dynamic>? parameters}) async {
    // Firebase
    await _firebase.logEvent(
      name: name,
      parameters: parameters?.cast<String, Object>(),
    );

    // Meta
    _facebook.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  // ------------------------------
  // ONBOARDING & ACCOUNT
  // ------------------------------
  void logSignUp() => logEvent('sign_up');
  void logLogin() => logEvent('login');
  void logProfileUpdate() => logEvent('profile_update');

  // ------------------------------
  // LEARNING JOURNEY
  // ------------------------------
  void logCourseEnrolled(String courseId) =>
      logEvent('course_enrolled', parameters: {'course_id': courseId});

  void logLessonStarted(String lessonId) =>
      logEvent('lesson_started', parameters: {'lesson_id': lessonId});

  void logLessonCompleted(String lessonId) =>
      logEvent('lesson_completed', parameters: {'lesson_id': lessonId});

  void logQuizStarted(String quizId) =>
      logEvent('quiz_started', parameters: {'quiz_id': quizId});

  void logQuizCompleted(String quizId, int score) => logEvent('quiz_completed',
      parameters: {'quiz_id': quizId, 'score': score});

  void logCertificateEarned(String certificateId) =>
      logEvent('certificate_earned',
          parameters: {'certificate_id': certificateId});

// ------------------------------
// PAYMENTS
// ------------------------------
  void logPaymentAction({
    required String paymentMethod,
    required double amount,
    String? currency = 'USD',
    String? status,
  }) {
    logEvent(
      'payment_action',
      parameters: {
        'payment_method': paymentMethod,
        'amount': amount,
        'currency': currency,
        if (status != null) 'status': status,
      },
    );
  }

  // ------------------------------
  // ENGAGEMENT & MARKETING
  // ------------------------------
  void logPushNotificationOpened(String notificationId) =>
      logEvent('push_notification_opened',
          parameters: {'notification_id': notificationId});

  void logInAppMessageClicked(String messageId) =>
      logEvent('in_app_message_clicked', parameters: {'message_id': messageId});

  void logShareApp(String channel) =>
      logEvent('share_app', parameters: {'channel': channel});

  // ------------------------------
// ACTION CENTER (IN-APP MESSAGES)
// ------------------------------
  void logActionCenterItemClicked({
    required String actionType,
    required String actionId,
  }) {
    logEvent(
      'action_center_item_clicked',
      parameters: {
        'action_type': actionType,
        'action_id': actionId,
      },
    );
  }

  void logActionCenterActionPerformed({
    required String actionType,
    String? requestId,
    String? sessionId,
  }) {
    logEvent(
      'action_center_action_performed',
      parameters: {
        'action_type': actionType,
        if (requestId != null) 'request_id': requestId,
        if (sessionId != null) 'session_id': sessionId,
      },
    );
  }

  // ------------------------------
  // Dispose
  // ------------------------------
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
