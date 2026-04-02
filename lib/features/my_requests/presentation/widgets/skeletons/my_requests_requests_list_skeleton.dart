import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/skeletons/fake_data/my_request_response_fake_data.dart';
import '../my_requests_requests_list_item.dart';

class MyRequestsRequestsListSkeleton extends StatelessWidget {
  const MyRequestsRequestsListSkeleton({super.key});

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
              bottom: 15.w,
              left: 25.w,
              right: 25.w,
            ),
            child: MyRequestsRequestsListItem(
              myRequest: myRequestResponseFakeData,
            ),
          );
        },
      ),
    );
  }
}
