import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/services/app_preferences.dart';

class PaymentModal {
  static Future<PaymentResult> show({
    required BuildContext context,
    required String url,
    String? customAppBarTitle = 'Payment',
  }) async {
    final paymentUrl = url;

    final result = await Navigator.of(context).push<PaymentResult>(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        reverseTransitionDuration: const Duration(milliseconds: 700),
        opaque: false,
        barrierDismissible: false,
        pageBuilder: (context, animation, secondaryAnimation) {
          return _PaymentPage(
            paymentUrl: paymentUrl,
            appBarTitle: customAppBarTitle,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeIn,
          );

          final slide =
              Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                  .animate(curvedAnimation);
          final scale =
              Tween<double>(begin: 0.95, end: 1.0).animate(curvedAnimation);
          final fade =
              Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);

          return FadeTransition(
            opacity: fade,
            child: SlideTransition(
              position: slide,
              child: ScaleTransition(scale: scale, child: child),
            ),
          );
        },
      ),
    );

    return result ?? PaymentResult.cancelled();
  }
}

class _PaymentPage extends StatefulWidget {
  final String paymentUrl;
  final String? appBarTitle;

  const _PaymentPage({
    required this.paymentUrl,
    this.appBarTitle,
  });

  @override
  State<_PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<_PaymentPage> {
  bool _isLoading = true;
  bool _hasError = false;
  bool _loadCompletedOnce = false;
  late InAppWebViewController _webViewController;

  void _handlePaymentCompletion(String url) {
    final uri = Uri.parse(url);
    if (uri.scheme == 'myapp') {
      if (uri.host == 'payment-success') {
        Navigator.of(context).pop(PaymentResult.success());
      } else if (uri.host == 'payment-cancel') {
        Navigator.of(context).pop(PaymentResult.cancelled());
      } else if (uri.host == 'payment-failure') {
        Navigator.of(context).pop(PaymentResult.failed('Payment failed'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final token = getIt<AppPreferences>().accessToken;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle ?? 'Payment'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(PaymentResult.cancelled()),
        ),
        actions: [
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(widget.paymentUrl),
                headers: {'Authorization': 'Bearer $token'},
              ),
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                clearCache: true,
              ),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onLoadStart: (controller, url) {
                setState(() {
                  _isLoading = true;
                  // don’t reset _hasError here
                });
              },
              onLoadStop: (controller, url) async {
                setState(() {
                  _isLoading = false;
                  _hasError = false;
                  _loadCompletedOnce = true;
                });
                if (url != null) _handlePaymentCompletion(url.toString());
              },
              onLoadError: (controller, url, code, message) {
                // Only show error if we never successfully loaded anything before
                if (!_loadCompletedOnce) {
                  Future.delayed(const Duration(seconds: 1), () {
                    if (mounted && !_loadCompletedOnce) {
                      setState(() {
                        _isLoading = false;
                        _hasError = true;
                      });
                    }
                  });
                }
              },
              onReceivedHttpError: (controller, url, response) {
                // Prevent showing transient errors (like redirects)
                if (response.statusCode! >= 400 && !_loadCompletedOnce) {
                  Future.delayed(const Duration(seconds: 1), () {
                    if (mounted && !_loadCompletedOnce) {
                      setState(() => _hasError = true);
                    }
                  });
                }
              },
            ),
            if (_hasError)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    const Text(
                      'Payment Error',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text('There was an issue loading the payment page.'),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasError = false;
                          _isLoading = true;
                        });
                        _webViewController.reload();
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class PaymentResult {
  final bool isSuccess;
  final bool isCancelled;
  final String? errorMessage;

  PaymentResult({
    required this.isSuccess,
    required this.isCancelled,
    this.errorMessage,
  });

  factory PaymentResult.success() => PaymentResult(
        isSuccess: true,
        isCancelled: false,
      );

  factory PaymentResult.failed(String error) => PaymentResult(
        isSuccess: false,
        isCancelled: false,
        errorMessage: error,
      );

  factory PaymentResult.cancelled() => PaymentResult(
        isSuccess: false,
        isCancelled: true,
      );
}
