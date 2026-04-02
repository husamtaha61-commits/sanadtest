import 'dart:async';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../routes/app_router.dart';
import '../widgets/payment_dialogs.dart';

@lazySingleton
class FirebaseMessagingListener {
  final AppRouter _appRouter;
  bool _isInitialized = false;
  bool _isFirebaseRedirect = false;
  StreamSubscription<RemoteMessage>? _messageSubscription;

  FirebaseMessagingListener(this._appRouter);

  Future<void> setupMessageListeners(BuildContext context) async {
    if (_isInitialized) {
      return;
    }

    _isInitialized = true;
    _appRouter.popUntilRoot();

    _messageSubscription = FirebaseMessaging.onMessage.listen((message) {
      _handleMessage(message, context, isForeground: true);
    });

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage, context, isForeground: false);
    }
  }

  void dispose() {
    _messageSubscription?.cancel();
    _isInitialized = false;
  }

  bool dialogShow = true;

  void _handleMessage(RemoteMessage message, BuildContext context,
      {required bool isForeground}) {
    log('Received FCM message: ${message.data}');

    final trimmedData = <String, String>{};
    message.data.forEach((key, value) {
      trimmedData[key.trim()] = value;
    });

    final data = trimmedData;
    final status = data['type'];
    _isFirebaseRedirect = true;

    if (data['type'] != 'PaymentSuccess') return;

    if (dialogShow) {
      dialogShow = false;
      _appRouter.popUntilRoot();

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.delayed(const Duration(milliseconds: 300));

        if (context.mounted) {
          showDialog(
            context: _appRouter.navigatorKey.currentContext!,
            barrierDismissible: false,
            builder: (context) => PaymentSuccessDialog(
              onContinue: () {
                context.router.pop();
                context.router.pop();
                context.router.pop();
                dialogShow = true;
                context.router.push(const ReciterListingRoute());
              },
            ),
          ).then((_) => dialogShow = true);
        } else if (status == 'failure') {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) => PaymentFailureDialog(
              errorMessage:
                  data['error_message'] ?? 'Payment processing failed',
              onClose: () {
                dialogShow = true;
                context.router.popForced();
              },
            ),
          ).then((_) => dialogShow = true);
        } else {
          dialogShow = true;
        }
      });
    }
  }

  bool get isFirebaseRedirect => _isFirebaseRedirect;

  // Call this after handling the redirect to reset the flag
  void resetFirebaseRedirect() {
    _isFirebaseRedirect = false;
  }
}
