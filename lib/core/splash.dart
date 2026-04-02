import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'services/app_preferences.dart';

import '../features/shared/presentation/bloc/user/user_cubit.dart';
import '../gen/assets.gen.dart';
import 'di/injection.dart';
import 'enums/app_enums.dart';
import 'routes/app_router.dart';
import 'services/notification_service.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      splashScreenBody: Lottie.asset(
        Assets.images.splash,
        height: double.infinity,
        width: double.infinity,
        repeat: false,
        frameRate: const FrameRate(30),
        fit: BoxFit.cover,
      ),
      duration: const Duration(seconds: 1, milliseconds: 400),
      onEnd: () async {
        final router = context.router;
        final notificationsService = getIt<NotificationService>();
        final userCubit = context.read<UserCubit>();

        router.removeLast();
        if (getIt<AppPreferences>().isLoggedIn()) {
          await userCubit.getUserInfo();
          FacebookAppEvents().logViewContent();
          if (!userCubit.state.isLoginCompleted &&
              userCubit.state.role?.comparisonName == UserRoles.Reciter.name) {
            router.replace(LoginRoute());
            router.push(const ReciterCompleteProfileRoute());
          } else {
            router.replaceAll([MainRoute()]);
            Future.delayed(const Duration(seconds: 2),
                () => notificationsService.initNotifications()).then((_) async {
              final notificationDetails =
                  await notificationsService.getNotificationAppLaunchDetails();
              if (notificationDetails?.didNotificationLaunchApp == true &&
                  notificationDetails?.notificationResponse != null) {
                notificationsService.onLocalNotificationTap(
                    notificationDetails!.notificationResponse!);
              }
            });
            final isStudent =
                userCubit.state.role?.comparisonName == UserRoles.Student.name;
            if (isStudent && !userCubit.state.hasActiveSchedule) {
              router.push(const ReciterListingRoute());
            }
          }
        } else {
          router.push(LoginRoute());
        }
      },
    );
  }
}
