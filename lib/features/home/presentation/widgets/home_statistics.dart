import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/base_status.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../domain/entites/global_reciters_section.dart';
import '../../domain/entites/home_statistic.dart';
import '../bloc/global_reciters_section/global_reciters_section_cubit.dart';
import 'home_statistics/statistics_line.dart';

class HomeStatistics extends StatelessWidget {
  const HomeStatistics({super.key});

  List<HomeStatistic> _getStatistics(
      GlobalRecitersSection globalReciterSection) {
    return [
      HomeStatistic(
        num: globalReciterSection.numOfReciters,
        title: LocaleKeys.home_connectingReciters_reciters,
      ),
      HomeStatistic(
        num: globalReciterSection.numOfStudents,
        title: LocaleKeys.home_connectingReciters_students,
      ),
      HomeStatistic(
        num: globalReciterSection.numOfIjazah,
        title: LocaleKeys.home_connectingReciters_sanadIjazah,
      ),
      HomeStatistic(
        num: globalReciterSection.numOfItqan,
        title: LocaleKeys.home_connectingReciters_sanadItqan,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalRecitersSectionCubit, GlobalRecitersSectionState>(
      builder: (context, state) {
        if (state.status is! Success) {
          return const SizedBox();
        }

        final GlobalRecitersSection globalReciterSection =
            state.globalRecitersSection!;
        final statistics = _getStatistics(globalReciterSection);

        return LayoutBuilder(
          builder: (context, constraints) {
            final double totalHeight = 300.w;
            final double cardTop = (totalHeight - 55.w);
            final double bottomPadding = (cardTop > 25) ? (cardTop - 25) : 0;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w)
                  .copyWith(bottom: bottomPadding),
              child: IntrinsicHeight(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.w),
                        bottomRight: Radius.circular(50.w),
                      ),
                      child: Image.asset(
                        Assets.images.test2.path,
                        width: double.infinity,
                        height: totalHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 34.w,
                      top: cardTop,
                      child: Container(
                        padding: EdgeInsets.all(20.w),
                        color: AppColors.navyBlue.withAlpha(229),
                        child: Column(
                          children: [
                            for (int i = 0; i < statistics.length; i += 2)
                              StatisticsLine(index: i, statistics: statistics),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
