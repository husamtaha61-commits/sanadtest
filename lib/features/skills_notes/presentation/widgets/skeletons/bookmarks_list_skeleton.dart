import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/skeletons/fake_data/bookmark_group_fake_data.dart';
import '../bookmarks_list_item.dart';

class BookmarksListSkeleton extends StatelessWidget {
  const BookmarksListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.w),
            child: BookmarksListItem(bookmarkGroup: bookmarkGroupFakeData),
          );
        },
      ),
    );
  }
}
