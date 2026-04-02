import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../bloc/my_requests/my_requests_cubit.dart';
import 'my_requests_requests_list_item.dart';
import 'skeletons/my_requests_requests_list_skeleton.dart';

class MyRequestsRequestsList extends StatefulWidget {
  const MyRequestsRequestsList({super.key});

  @override
  State<MyRequestsRequestsList> createState() => _MyRequestsRequestsListState();
}

class _MyRequestsRequestsListState extends State<MyRequestsRequestsList> {
  late final MyRequestsCubit _myRequestsCubit;
  late final void Function(int) _pageRequestListener;

  @override
  void initState() {
    super.initState();
    _myRequestsCubit = context.read<MyRequestsCubit>();
    _pageRequestListener = (pageKey) {
      _myRequestsCubit.getMyRequestsByPage(pageKey);
    };
    // Ensure we attach exactly one listener to avoid duplicate fetches on rebuilds
    _myRequestsCubit.pagingController
        .addPageRequestListener(_pageRequestListener);
  }

  @override
  void dispose() {
    // Remove the listener when this widget is disposed to prevent multiple registrations
    _myRequestsCubit.pagingController
        .removePageRequestListener(_pageRequestListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myRequestsCubit = _myRequestsCubit;

    return BlocBuilder<MyRequestsCubit, MyRequestsState>(
      builder: (context, state) {
        return state.requestListStatus.maybeWhen(
          orElse: () => const SliverToBoxAdapter(child: SizedBox()),
          loading: () => const SliverToBoxAdapter(
            child: MyRequestsRequestsListSkeleton(),
          ),
          success: () {
            return PagedSliverList<int, dynamic>(
              pagingController: myRequestsCubit.pagingController,
              builderDelegate: PagedChildBuilderDelegate<dynamic>(
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
                    padding: EdgeInsets.only(
                      bottom: 15.w,
                      left: 25.w,
                      right: 25.w,
                    ),
                    child: MyRequestsRequestsListItem(myRequest: item),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
