import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/skeletons/fake_data/messaging_conversation_fake_data.dart';
import '../../pages/messaging_center.dart';

class MessagesListSkeleton extends StatelessWidget {
  const MessagesListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(
                bottom: 10.w,
              ),
              child: MessageItem(conversation: messagingConversationFakeData));
        },
      ),
    );
  }
}
