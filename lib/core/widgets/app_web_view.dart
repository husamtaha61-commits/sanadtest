import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_arrow_back_button.dart';
import 'app_loading_indicator.dart';

class AppWebView extends StatefulWidget {
  final String url;
  final void Function(InAppWebViewController, WebUri?)? onLoadStop;

  const AppWebView({super.key, required this.url, this.onLoadStop});

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late final InAppWebViewController inAppWebViewController;
  int _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        10.verticalSpace,
        const AppArrowBackButton(),
        Padding(
          padding: EdgeInsets.only(top: 50.w),
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(widget.url),
            ),
            initialSettings: InAppWebViewSettings(
              mediaPlaybackRequiresUserGesture: false,
              transparentBackground: true,
              allowsInlineMediaPlayback: true,
              supportMultipleWindows: true,
              javaScriptCanOpenWindowsAutomatically: true,
              thirdPartyCookiesEnabled: true,
              allowBackgroundAudioPlaying: true,
              cacheEnabled: true,
            ),
            onWebViewCreated: (controller) {
              inAppWebViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState(() => _progress = 0);
            },
            onLoadStop: (controller, url) {
              setState(() => _progress = 100);
              widget.onLoadStop?.call(controller, url);
            },
            onProgressChanged: (controller, progress) {
              setState(() => _progress = progress);
            },
          ),
        ),
        if (_progress < 100) const Center(child: AppLoadingIndicator()),
      ],
    );
  }
}
