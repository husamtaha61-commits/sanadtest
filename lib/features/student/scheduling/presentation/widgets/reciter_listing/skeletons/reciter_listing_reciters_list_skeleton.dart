import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../core/skeletons/fake_data/reciter_response_fake_data.dart';
import '../reciter_listing_reciters_list_item.dart';

class ReciterListingRecitersListSkeleton extends StatelessWidget {
  const ReciterListingRecitersListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Skeletonizer(
        enabled: true,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 15.w),
              child: ReciterListingRecitersListItem(
                reciter: reciterResponseFakeData,
              ),
            );
          },
        ),
      ),
    );
  }
}
