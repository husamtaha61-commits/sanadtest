import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../home/domain/entites/student_progress.dart';

class ReadingProgressGrid extends StatefulWidget {
  final ReadingProgress readingProgress;
  const ReadingProgressGrid({super.key, required this.readingProgress});

  @override
  State<ReadingProgressGrid> createState() => _ReadingProgressGridState();
}

class _ReadingProgressGridState extends State<ReadingProgressGrid> {
  late List<Map<String, dynamic>> readProgress;

  @override
  void initState() {
    super.initState();
    readProgress = [
      {
        "title": LocaleKeys.readingProgress_juz,
        "imagePath": Assets.icons.juz.path,
        "value": widget.readingProgress.juz,
      },
      {
        "title": LocaleKeys.readingProgress_surah,
        "imagePath": Assets.icons.sessionQuran.path,
        "value": widget.readingProgress.surah,
      },
      {
        "title": LocaleKeys.readingProgress_page,
        "imagePath": Assets.icons.pages.path,
        "value": widget.readingProgress.page,
      },
      {
        "title": LocaleKeys.readingProgress_verse,
        "imagePath": Assets.icons.verse.path,
        "value": widget.readingProgress.verse,
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppShadowContainer(
      child: AlignedGridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 32.w,
        itemCount: readProgress.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                readProgress[index]['imagePath'] as String,
                height: index == 0 ? 55.w : 40.w,
                fit: BoxFit.cover,
              ),
              15.horizontalSpace,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(readProgress[index]['title'] as String),
                      style: AppTextStyles.font16TextW600,
                    ),
                    Text(
                      readProgress[index]['value'].toString(),
                      style: AppTextStyles.font12TextW400OP8,
                      softWrap: true,
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
