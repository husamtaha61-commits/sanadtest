import 'package:auto_route/auto_route.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/widgets/full_page.dart';
import '../../../home/presentation/pages/home.dart';
import '../../../messaging/presentation/bloc/messaging/messaging_cubit.dart';
import '../../../messaging/presentation/pages/messaging_center.dart';
import '../../../notification/presentation/pages/notifications_actions.dart';
import '../../../shared/data/models/requests/user_device_token_request.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../bloc/navbar/navbar_cubit.dart';
import '../widgets/main/main_bloc_wrapper_screen.dart';
import 'menu.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key, this.initialPageIndex = 2});

  final int initialPageIndex;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  DateTime? _lastPausedTime;
  static const Duration _refreshThreshold = Duration(minutes: 5);

  void addDeviceToken() async {
    final String? fcm = await getIt<NotificationService>().getFCMToken();

    if (fcm != null && mounted) {
      context
          .read<UserCubit>()
          .addDeviceToken(UserDeviceTokenRequest(deviceToken: fcm));
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final userCubit = context.read<UserCubit>();
    FirebaseCrashlytics.instance
        .setUserIdentifier(userCubit.state.id.toString());

    if (userCubit.state.id == 0) {
      userCubit.getUserInfo();
    }

    context.read<MessagingCubit>().getToken();
    addDeviceToken();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      _lastPausedTime = DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      if (_lastPausedTime != null) {
        final duration = DateTime.now().difference(_lastPausedTime!);

        if (duration >= _refreshThreshold) {
          context.read<UserCubit>().getUserInfo();
        }

        _lastPausedTime = null;
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainBlocWrapperScreen(
      initialPageIndex: widget.initialPageIndex,
      child: const _MainContent(),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, state) {
        final navbarCubit = context.read<NavbarCubit>();
        return PopScope(
          canPop: navbarCubit.state.index == 2,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              navbarCubit.updateIndex(2);
            }
          },
          child: switch (state.index) {
            0 => FullPage(
                url: AppConfig.shared.quranPageUrl,
                showBackBtn: false,
              ),
            1 => const NotificationsActions(),
            2 => const Home(),
            3 => const MessingCenter(),
            4 => const Menu(),
            _ => const SizedBox(),
          },
        );
      },
    );
  }
}
