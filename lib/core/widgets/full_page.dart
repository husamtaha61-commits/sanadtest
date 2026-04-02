import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'app_bloc_wrapper_screen.dart';
import 'app_web_view.dart';

@RoutePage()
class FullPage extends StatelessWidget {
  final String url;
  final bool showBackBtn;
  final void Function(InAppWebViewController, WebUri?)? onLoadStop;

  const FullPage(
      {super.key, required this.url, this.showBackBtn = true, this.onLoadStop});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: AppWebView(
        url: url,
        onLoadStop: onLoadStop,
      ),
    );
  }
}
