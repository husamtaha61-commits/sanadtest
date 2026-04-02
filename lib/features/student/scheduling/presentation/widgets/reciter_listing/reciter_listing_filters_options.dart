import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/widgets/app_filter_box_properities.dart';
import '../../../../../../core/widgets/form_fields/app_search_field.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../bloc/reciter_listing/reciter_listing_cubit.dart';
import '../../pages/my_available_time_page.dart';

class ReciterListingFiltersOptions extends StatelessWidget {
  const ReciterListingFiltersOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final reciterListingCubti = BlocProvider.of<ReciterListingCubit>(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: AppSearchField(
              onFieldSubmitted: (val) =>
                  reciterListingCubti.pagingController.refresh(),
              onPressed: reciterListingCubti.pagingController.refresh,
              textEditingController: reciterListingCubti.search,
            ),
          ),
          4.horizontalSpace,
          const AppFilterBoxProperties(),
          4.horizontalSpace,
          const _FilterFavBox(),
          4.horizontalSpace,
          const _FilterBoxTimes(),
        ],
      ),
    );
  }
}

class _FilterFavBox extends StatelessWidget {
  const _FilterFavBox();

  @override
  Widget build(BuildContext context) {
    final reciterListingCubti = BlocProvider.of<ReciterListingCubit>(context);

    return BlocBuilder<ReciterListingCubit, ReciterListingState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: reciterListingCubti.favoritesOnly
                ? AppColors.navyBlue
                : Colors.transparent,
            border: Border.all(
              color: AppColors.textColor.withAlpha(50),
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            iconSize: 20.w,
            onPressed: reciterListingCubti.toggleFav,
            icon: SvgPicture.asset(
              reciterListingCubti.favoritesOnly
                  ? Assets.icons.favOutlinedWhite.path
                  : Assets.icons.favOutlinedGrey.path,
              width: 20.w,
              height: 20.w,
            ),
          ),
        );
      },
    );
  }
}

class _FilterBoxTimes extends StatelessWidget {
  const _FilterBoxTimes();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.navyBlue,
        border: Border.all(
          color: AppColors.textColor,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: IconButton(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        onPressed: () {
          context.router.pushWidget(
            BlocProvider.value(
              value: context.read<ReciterListingCubit>(),
              child: const MyAvailableTimePage(),
            ),
          );
        },
        icon: SvgPicture.asset(
          Assets.icons.timeWhite.path,
          width: 20.w,
          height: 20.w,
        ),
      ),
    );
  }
}
