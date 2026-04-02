import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import '../core/di/injection.dart';
import '../core/models/base_status.dart';
import '../core/routes/app_router.dart';
import '../core/theme/styles/app_colors.dart';
import '../core/theme/styles/app_text_style.dart';
import '../core/widgets/app_bloc_wrapper_screen.dart';
import '../core/widgets/app_elevated_button.dart';
import '../core/widgets/app_loading_indicator.dart';
import '../gen/translations/locale_keys.g.dart';
import 'shared/presentation/bloc/session_token/session_token_cubit.dart';

@RoutePage()
class SessionWebViewPage extends StatelessWidget {
  final String url;
  final String guid;

  const SessionWebViewPage({super.key, required this.url, required this.guid});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: BlocProvider(
        create: (context) => getIt<SessionTokenCubit>()..addSessionToken(guid),
        lazy: false,
        child: _WebViewContent(url: url),
      ),
    );
  }
}

class _WebViewContent extends StatefulWidget {
  final String url;

  const _WebViewContent({required this.url});

  @override
  State<_WebViewContent> createState() => _WebViewContentState();
}

class _WebViewContentState extends State<_WebViewContent> {
  late final InAppWebViewController inAppWebViewController;
  int _progress = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionTokenCubit, SessionTokenState>(
      listener: (context, state) {
        if (state.status is Failure) {
          context.router.removeLast();
        }
      },
      child: BlocBuilder<SessionTokenCubit, SessionTokenState>(
        builder: (context, state) {
          return state.status.maybeWhen(
            success: () => PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) async {
                if (didPop) {
                  return;
                }
                bool canGoBack = await inAppWebViewController.canGoBack();
                if (canGoBack) {
                  inAppWebViewController.goBack();
                } else {
                  if (context.mounted) {
                    showDialog(
                        context: context,
                        builder: (_) => Dialog(
                            insetPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 24),
                            child: SizedBox(
                              height: 180.w,
                              width: double.infinity,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    10.verticalSpace,
                                    Text(
                                      LocaleKeys.dialog_exitSessionTitle.tr(),
                                      style: AppTextStyles.font24TextW600,
                                    ),
                                    10.verticalSpace,
                                    Text(
                                      LocaleKeys.dialog_exitSessionSubtitle
                                          .tr(),
                                      style: AppTextStyles.font16NavyBlueW500,
                                      textAlign: TextAlign.center,
                                    ),
                                    const Spacer(),
                                    Row(children: [
                                      10.horizontalSpace,
                                      Expanded(
                                        child: AppElevatedButton(
                                          fixedSize:
                                              Size(double.infinity, 40.w),
                                          elevation: 0,
                                          onPressed: () {
                                            context.router.maybePop();
                                          },
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            side: const BorderSide(
                                              color: AppColors.navyBlue,
                                            ),
                                          ),
                                          overlayColor: AppColors.dividerGrey
                                              .withAlpha(150),
                                          child: Text(
                                            LocaleKeys.dialog_stay.tr(),
                                            style: AppTextStyles
                                                .font15NavyBlueW400,
                                          ),
                                        ),
                                      ),
                                      10.horizontalSpace,
                                      Expanded(
                                        child: AppElevatedButton(
                                          fixedSize:
                                              Size(double.infinity, 40.w),
                                          elevation: 0,
                                          onPressed: () async {
                                            await context.router.maybePop();
                                            context.router.removeLast();
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          child:
                                              Text(LocaleKeys.dialog_exit.tr()),
                                        ),
                                      ),
                                      10.horizontalSpace
                                    ]),
                                    25.verticalSpace,
                                  ]),
                            )));
                  }
                }
              },
              child: Stack(
                children: [
                  InAppWebView(
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
                      useShouldInterceptRequest: true,
                      allowBackgroundAudioPlaying: true,
                    ),
                    onWebViewCreated: (controller) {
                      inAppWebViewController = controller;

                      // Close WebView
                      inAppWebViewController.addJavaScriptHandler(
                        handlerName: 'flutterHandler',
                        callback: (args) {
                          if (args[0] == 'closeWebView') {
                            if (context.router.canPop()) {
                              // ignore: deprecated_member_use
                              context.router.pop();
                            } else {
                              context.router.replace(MainRoute());
                            }
                          } else if (args[0] == 'endSession') {
                            final uri = Uri.parse(widget.url);
                            final sessionId = uri.queryParameters['sessionId'];
                            context.router.removeLast();
                            context.router.push(SessionDetailsRoute(
                                sessionId: sessionId ?? ''));
                          } else if (args[0] == "sessionForciblyEnded") {
                            final uri = Uri.parse(widget.url);
                            final sessionId = uri.queryParameters['sessionId'];
                            context.router.removeLast();
                            context.router.push(SessionDetailsRoute(
                                sessionId: sessionId ?? ''));
                          }
                          return null;
                        },
                      );
                    },
                    onLoadStart: (controller, url) {
                      setState(() => _progress = 0);
                    },
                    onLoadStop: (controller, url) {
                      setState(() => _progress = 100);
                    },
                    onProgressChanged: (controller, progress) {
                      setState(() => _progress = progress);
                    },
                    onReceivedError: (controller, request, error) {},
                    onPermissionRequest: (controller, permissionRequest) async {
                      late PermissionStatus permissionStatus;
                      if (permissionRequest.resources
                          .contains(PermissionResourceType.MICROPHONE)) {
                        permissionStatus =
                            await Permission.microphone.request();
                      } else if (permissionRequest.resources
                          .contains(PermissionResourceType.CAMERA)) {
                        permissionStatus = await Permission.camera.request();
                      }

                      if (permissionStatus.isGranted) {
                        return PermissionResponse(
                          resources: permissionRequest.resources,
                          action: PermissionResponseAction.GRANT,
                        );
                      } else {
                        return PermissionResponse(
                          resources: permissionRequest.resources,
                          action: PermissionResponseAction.DENY,
                        );
                      }
                    },
                  ),
                  if (_progress < 100)
                    const Center(child: AppLoadingIndicator()),
                ],
              ),
            ),
            orElse: () => const AppLoadingIndicator(),
          );
        },
      ),
    );
  }
}
