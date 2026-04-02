import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/skeletons/fake_data/note_fake_data.dart';
import '../notes_list_item.dart';

class NotesListSkeleton extends StatelessWidget {
  const NotesListSkeleton({super.key, this.itemCount = 3});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.w),
            child: NotesListItem(note: noteFakeData),
          );
        },
      ),
    );
  }
}
