import 'package:flutter/material.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../student_my_progress_statistic_item.dart';

class StudentMyProgressStatisticListSkeleton extends StatelessWidget {
  const StudentMyProgressStatisticListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) => StudentMyProgressStatisticItem(
        imagePath: Assets.icons.khitmat.path,
        num: 1,
        title: LocaleKeys.reciter_khitmaProgress_numberOfKhitmat,
      ),
    );
  }
}
