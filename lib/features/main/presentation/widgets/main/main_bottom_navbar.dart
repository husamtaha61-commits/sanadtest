import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widgets/app_directionality_l_t_r.dart';
import '../../../../messaging/presentation/bloc/messaging/messaging_cubit.dart';
import '../../../../notification/presentation/bloc/action_center/action_center_cubit.dart';
import '../../../../notification/presentation/bloc/notification/notification_cubit.dart';
import '../../bloc/navbar/navbar_cubit.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_shadows.dart';

class MainBottomNavbar extends StatefulWidget {
  const MainBottomNavbar({super.key});

  @override
  State<MainBottomNavbar> createState() => _MainBottomNavbarState();
}

class _MainBottomNavbarState extends State<MainBottomNavbar> {

  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getUnreadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final navbarCubit = context.read<NavbarCubit>();

    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0),
          decoration:
              BoxDecoration(boxShadow: AppShadows.blur50BlackOP10OffsetDy4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.r),
            child: NavigationBar(
              height: 72,
              backgroundColor: Colors.white,
              indicatorColor: Colors.transparent,
              onDestinationSelected: (int index) {
                  navbarCubit.updateIndex(index);
                  context.read<NotificationCubit>().getUnreadNotifications();
                  context.read<ActionCenterCubit>().getActionsCenterByPage();
              },
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              selectedIndex: navbarCubit.state.index,
              destinations: NavBarItem.values
                  .map((item) => _NavigationDestination(navItem: item))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _NavigationDestination extends StatelessWidget {
  final NavBarItem navItem;
  const _NavigationDestination({required this.navItem});

  @override
  Widget build(BuildContext context) {
    return navItem.notificationCountProvider(
            (notificationCount) {
              final hasNotification = notificationCount > 0;
              return NavigationDestination(
                label: '',
                icon: AppDirectionalityLTR(
                  child: Badge(
                    backgroundColor: hasNotification ? Colors.red : Colors.transparent,
                    smallSize: 14,
                    largeSize: 14,
                    offset: const Offset(4, -8),
                    padding: EdgeInsets.all(1.5.w),
                    label: hasNotification
                        ? Text(notificationCount > 9 ? "9+" : notificationCount.toString())
                        : const SizedBox(),
                    child: SvgPicture.asset(
                      navItem.imagePath,
                      width: 20,
                    ),
                  ),
                ),
                selectedIcon: AppDirectionalityLTR(
                  child: Badge(
                    backgroundColor: hasNotification ? Colors.red : Colors.transparent,
                    smallSize: 14,
                    largeSize: 14,
                    offset: const Offset(4, -8),
                    padding: EdgeInsets.all(1.5.w),
                    label: hasNotification
                        ? Text(notificationCount > 9 ? "9+" : notificationCount.toString())
                        : const SizedBox(),
                    child: SvgPicture.asset(
                      navItem.imagePath,
                      colorFilter: const ColorFilter.mode(
                        AppColors.goldenOrange,
                        BlendMode.srcIn,
                      ),
                      width: 20,
                    ),
                  ),
                ),
              );
            }
    );
  }
}

enum NavBarItem {
  quran,
  notification,
  home,
  chat,
  menu;

  String get imagePath => switch(this){
    NavBarItem.quran =>  Assets.icons.quran.path,
    NavBarItem.notification => Assets.icons.notification.path,
    NavBarItem.home => Assets.icons.home.path,
    NavBarItem.chat => Assets.icons.chat.path,
    NavBarItem.menu => Assets.icons.burgerMenu.path,
  };

  Widget notificationCountProvider(Widget Function(int) builder) {
    return switch(this) {
      NavBarItem.quran => builder(0),
      NavBarItem.notification =>
          BlocBuilder<ActionCenterCubit, ActionCenterState>(
            builder: (context, actionState) {
              return BlocBuilder<NotificationCubit, NotificationState>(
                  builder: (context, notificationState) =>
                      builder(notificationState.unreadNotifications.length + actionState.actions.length)
              );
            }
          ),
      NavBarItem.home => builder(0),
      NavBarItem.chat => BlocBuilder<MessagingCubit, MessagingState>(
          builder: (context, state) =>
              builder(state.conversations.values.fold(0, (count, chat) => count + chat.numberOfUnreadMessages))
      ),
      NavBarItem.menu => builder(0),
    };
  }
}