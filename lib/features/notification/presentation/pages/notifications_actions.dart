import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../bloc/action_center/action_center_cubit.dart';
import '../bloc/notification/notification_cubit.dart';
import '../widgets/notification/action_center_section.dart';
import '../widgets/notification/notification_section.dart';

class NotificationsActions extends StatelessWidget {
  const NotificationsActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBlocWrapperScreen(
      child: _NotificationsActionsContent(),
    );
  }
}

class _NotificationsActionsContent extends StatefulWidget {
  const _NotificationsActionsContent();

  @override
  State<_NotificationsActionsContent> createState() =>
      _NotificationsActionsContentState();
}

class _NotificationsActionsContentState
    extends State<_NotificationsActionsContent> {
  int index = 1;

  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getNotificationByPage();
  }

  @override
  Widget build(BuildContext context) {
    final notificationCubit = context.read<NotificationCubit>();
    final actionCenterCubit = context.read<ActionCenterCubit>();

    return RefreshIndicator(
      onRefresh: () => Future.sync(
        index == 1
            ? () => notificationCubit.getNotificationByPage()
            : () => actionCenterCubit.getActionsCenterByPage(),
      ),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.w,
                    left: 15.w,
                    right: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BlocBuilder<NotificationCubit, NotificationState>(
                            builder: (context, state) {
                              final notificationCount = state.unreadNotifications.length;
                              final hasNotification = notificationCount > 0;

                              return Badge(
                                backgroundColor: hasNotification ? AppColors.goldenOrange : Colors.transparent,
                                offset: const Offset(8, -7),
                                padding: EdgeInsets.all(1.5.w),
                                label: hasNotification
                                    ? Text(notificationCount > 9 ? "9+" : notificationCount.toString())
                                    : const SizedBox(),
                                child: _Title(
                                  isActive: index == 1,
                                  onTap: () => setState(() => index = 1),
                                  title: LocaleKeys.notificationsActions_notifcations,
                                ),
                              );
                            }
                          ),
                          8.horizontalSpace,
                          SizedBox(
                            height: 20.w,
                            child: VerticalDivider(
                              color: AppColors.textColor,
                              thickness: 1.w,
                            ),
                          ),
                          8.horizontalSpace,
                          BlocBuilder<ActionCenterCubit, ActionCenterState>(
                            builder: (context, state) {
                              final notificationCount = state.actions.length;
                              final hasNotification = notificationCount > 0;

                              return Badge(
                                backgroundColor: hasNotification ? AppColors.goldenOrange : Colors.transparent,
                                offset: const Offset(12, -7),
                                padding: EdgeInsets.all(1.5.w),
                                label: hasNotification
                                    ? Text(
                                    notificationCount > 9 ? "9+" : notificationCount.toString()

                                )
                                    : const SizedBox(),
                                child: _Title(
                                  isActive: index == 2,
                                  onTap: () => setState(() => index = 2),
                                  title: LocaleKeys.notificationsActions_actionCenter,
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                      Visibility(
                        maintainState: true,
                        maintainAnimation: true,
                        maintainSize: true,
                        visible: index == 1,
                        child: const _MenuOptions(),
                      ),
                    ],
                  ),
                ),
                30.verticalSpace,
              ],
            ),
          ),
          index == 1 ? const NotificationSection() : const ActionCenterSection()
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool isActive;
  const _Title(
      {required this.title, required this.onTap, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        context.tr(title),
        style: isActive
            ? AppTextStyles.font20TextW700
            : AppTextStyles.font20TextW500,
      ),
    );
  }
}

class _MenuOptions extends StatelessWidget {
  const _MenuOptions();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: SvgPicture.asset(
        Assets.icons.dots.path,
        width: 20.w,
        height: 20.w,
        colorFilter: const ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        ),
      ),
      position: PopupMenuPosition.under,
      splashRadius: 8.r,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          onTap: context.read<NotificationCubit>().markAllNotificationsAsRead,
          value: 1,
          child: Text(
            context.tr(LocaleKeys.notificationsActions_markAllAsRead),
            style: AppTextStyles.font14TextW400,
          ),
        ),
      ],
    );
  }
}
