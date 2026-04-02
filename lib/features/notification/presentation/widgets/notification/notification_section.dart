import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/notification_manager.dart';
import '../../../../../gen/assets.gen.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../bloc/notification/notification_cubit.dart';
import '../../../domain/entites/notification.dart';
import '../skeletons/notifications_list_skeleton.dart';

class NotificationSection extends StatefulWidget {
  const NotificationSection({super.key});

  @override
  State<NotificationSection> createState() => _NotificationSectionState();
}

class _NotificationSectionState extends State<NotificationSection> {
  late NotificationCubit notificationCubit;
  late void Function(int) _pageRequestListener;

  @override
  void initState() {
    super.initState();
    notificationCubit = context.read<NotificationCubit>();
    _pageRequestListener = (pageKey) {
      if(pageKey == 1) {
        return;
      }
      notificationCubit.getNotificationByPage(pageKey: pageKey);
    };
    notificationCubit.pagingController
        .addPageRequestListener(_pageRequestListener);
  }

  @override
  void dispose() {
    notificationCubit.pagingController
        .removePageRequestListener(_pageRequestListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) => state.status.maybeWhen(
        orElse: () => const SliverToBoxAdapter(child: SizedBox()),
        loading: () =>
            const SliverToBoxAdapter(child: NotificationsListSkeleton()),
        success: () => PagedSliverList<int, Notification>(
          pagingController: notificationCubit.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Notification>(
            noItemsFoundIndicatorBuilder: (context) {
              return const SizedBox();
            },
            itemBuilder: (context, item, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10.w, left: 10.w, right: 10.w),
                child: NotificationItem(notification: item),
              );
            },
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final Notification notification;
  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        context
            .read<NotificationCubit>()
            .markNotificationAsRead(notification.id);
        NotificationManager.navigateToScreen(type: notification.type, message: RemoteMessage(data: {"url" : notification.url}), context: context);
      },
      child: Container(
        color: const Color(0xffF8F9FA),
        padding: EdgeInsets.only(
          left: 8.w,
          right: 14.w,
          top: 14.w,
          bottom: 14.w,
        ),
        child: Row(
          children: [
            if (!notification.isRead)
              Container(
                width: 5.w,
                height: 5.w,
                decoration: BoxDecoration(
                  color: const Color(0xffF22D2D),
                  borderRadius: BorderRadius.circular(2.5.w),
                ),
              ),
            6.horizontalSpace,
            Skeleton.replace(
              replacement: Container(
                width: 46.w,
                height: 46.w,
                color: Colors.white,
              ),
              child: Container(
                color: notification.isSessionRelated
                    ? AppColors.goldenOrange.withValues(alpha: .08)
                    : AppColors.navyBlue.withValues(alpha: .08),
                width: 46.w,
                height: 46.w,
                child: Center(
                  child: SvgPicture.asset(
                    notification.isSessionRelated
                        ? Assets.icons.notificationSession.path
                        : Assets.icons.notificationMsg.path,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.title, style: AppTextStyles.font14TextW500),
                  Text(
                    notification.message,
                    style: AppTextStyles.font10TextW400OP6,
                  ),
                ],
              ),
            ),
            26.horizontalSpace,
            Text(
              timeago.format(notification.creationDate, locale: 'custom'),
              style: AppTextStyles.font12TextW400OP6,
            ),
          ],
        ),
      ),
    );
  }
}
