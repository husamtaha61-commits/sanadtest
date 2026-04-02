import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/domain/entites/student_progress.dart';
import '../../../../reciter/khitma_progress/presentation/widgets/reciter_khitma_progress_more_options.dart';
import 'reading_progress_details.dart';
import 'reading_progress_grid.dart';
import 'reading_progress_title.dart';

class ReadingProgressSection extends StatelessWidget {
  final bool withReciterMoreOptions;
  final bool withReadingProgressDetials;
  final ReadingProgress readingProgress;
  final bool showReadingProgressTitle;
  const ReadingProgressSection({
    super.key,
    required this.readingProgress,
    this.withReciterMoreOptions = false,
    this.withReadingProgressDetials = true,
    this.showReadingProgressTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ReadingProgressTitle(),
            if (withReciterMoreOptions) const ReciterKhitmaProgressMoreOptions()
          ],
        ),
        12.verticalSpace,
        if (withReadingProgressDetials)
          ReadingProgressDetails(
            showReadingProgressTitle: showReadingProgressTitle,
            khitmaStartDate: readingProgress.khitmaStartDate,
            estimatedEndDate: readingProgress.khitmaEndDate,
          ),
        12.verticalSpace,
        ReadingProgressGrid(
          readingProgress: readingProgress,
        ),
      ],
    );
  }
}
