import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/skeletons/fake_data/notification_fake_data.dart';
import '../notification/notification_section.dart';

class NotificationsListSkeleton extends StatelessWidget {
  const NotificationsListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10.w, left: 15.w, right: 15.w),
            child: NotificationItem(
              notification: notificationFakeData,
            ),
          );
        },
      ),
    );
  }
}
