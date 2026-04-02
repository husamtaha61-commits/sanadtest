import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../domain/entites/reciter.dart';
import '../../bloc/reciter_listing/reciter_listing_cubit.dart';

import 'reciter_listing_reciters_list_item.dart';
import 'skeletons/reciter_listing_reciters_list_skeleton.dart';

class ReciterListingRecitersList extends StatefulWidget {
  const ReciterListingRecitersList({super.key});

  @override
  State<ReciterListingRecitersList> createState() =>
      _ReciterListingRecitersListState();
}

class _ReciterListingRecitersListState
    extends State<ReciterListingRecitersList> {
  @override
  void initState() {
    super.initState();

    final reciterListingCubit = context.read<ReciterListingCubit>();
    reciterListingCubit.pagingController.addPageRequestListener((pageKey) {
      reciterListingCubit.getRecitersByPage(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    final reciterListingCubit = context.read<ReciterListingCubit>();

    return BlocBuilder<ReciterListingCubit, ReciterListingState>(
      builder: (context, state) {
        return state.status.maybeWhen(
          orElse: () => const SliverToBoxAdapter(child: SizedBox()),
          loading: () => const SliverToBoxAdapter(
            child: ReciterListingRecitersListSkeleton(),
          ),
          success: () => PagedSliverList<int, Reciter>(
            pagingController: reciterListingCubit.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Reciter>(
              noItemsFoundIndicatorBuilder: (context) {
                return Column(
                  children: [
                    30.verticalSpace,
                    Text(
                      context.tr(LocaleKeys.itemNotFound_title),
                      style: AppTextStyles.font20TextW400,
                    ),
                    10.verticalSpace,
                    Text(context.tr(LocaleKeys.itemNotFound_subTitle))
                  ],
                );
              },
              itemBuilder: (context, item, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(bottom: 15.w, left: 15.w, right: 15.w),
                  child: ReciterListingRecitersListItem(
                    reciter: item,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
