import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_expansion_tile.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../session_details/domain/entites/bookmark.dart';

class BookmarksListItem extends StatelessWidget {
  final BookmarkGroup bookmarkGroup;

  const BookmarksListItem({super.key, required this.bookmarkGroup});

  @override
  Widget build(BuildContext context) {
    return AppExpansionTile(
      title: Text(
        "${context.tr(LocaleKeys.readingProgress_surah)} ${bookmarkGroup.bookmarks[0].surahName}",
        style: AppTextStyles.font16TextW400,
      ),
      children: bookmarkGroup.bookmarks.map(
        (bookmark) {
          final verse = bookmark.verseKey.isNotEmpty
              ? bookmark.verseKey[bookmark.verseKey.length - 1]
              : '';

          return Padding(
            padding: EdgeInsets.only(bottom: 10.w),
            child: Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xffF8F9FA),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${context.tr(LocaleKeys.readingProgress_verse)} $verse",
                    style: AppTextStyles.font16GoldenOrangeW500,
                  ),
                  20.horizontalSpace,
                  Container(
                    width: 4.w,
                    height: 4.w,
                    decoration: BoxDecoration(
                      color: AppColors.goldenOrange,
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                  ),
                  20.horizontalSpace,
                  Text(
                    "${context.tr(LocaleKeys.readingProgress_page)} ${bookmark.page}",
                    style: AppTextStyles.font16GoldenOrangeW500,
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
